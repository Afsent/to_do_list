import bottle_mysql
from bottle import run, template, request, redirect, static_file, Bottle, \
    response
import re
import os
import auth

key = os.urandom(24)
key_cookie = os.urandom(20)

app = Bottle()
plugin = bottle_mysql.Plugin(dbuser='root', dbpass="82134",
                             dbname='todo')
app.install(plugin)
app.config['SECRET_KEY'] = key


def validate_email(email):
    pattern = re.compile(r'^\w{3,}@\w{2,}\.\w{2,4}$')
    match = re.fullmatch(pattern, email)
    return True if match else False


def is_auth():
    token = request.get_cookie("token", secret=key_cookie)
    user_id = auth.decode_auth_token(app, token)
    return True if user_id else False


def exist(db, value, kind):
    if kind == 'Login':
        db.execute("SELECT ID_user FROM "
                   "todo.users WHERE Login LIKE %s;", (value,))
    elif kind == 'Email':
        db.execute("SELECT ID_user FROM "
                   "todo.users WHERE Email LIKE %s;", (value,))
    item = db.fetchone()
    if item is None:
        return False
    else:
        return True


@app.get('/')
def main():
    return template('main')


@app.get('/registration')
def registration():
    return template('registration', msg='', data='')


@app.post('/registration')
def registration(db):
    name = request.POST.first_name.strip()
    surname = request.POST.surname.strip()
    email = request.POST.email.strip()
    login = request.POST.login.strip()
    password1 = request.POST.password1.strip()
    password2 = request.POST.password2.strip()

    data = {
        'name': name,
        'surname': surname,
        'email': email,
        'login': login
    }

    if exist(db, email, 'Email'):
        msg = 'Данный email уже используется'
        return template('registration', msg=msg, data=data)

    if not validate_email(email):
        msg = 'Неверный формат email'
        return template('registration', msg=msg)

    if exist(db, login, 'Login'):
        msg = 'Данный логин уже используется'
        return template('registration', msg=msg)

    if len(password1) < 8:
        msg = 'Пароль должен быть не менее 8 символов'
        return template('registration', msg=msg)

    if password1 != password2:
        msg = 'Пароли не совпадают'
        return template('registration', msg=msg)

    db.execute(
        "INSERT INTO todo.users(Name,Surname,Email,Login, Password) VALUES (%s, %s, %s, %s, %s);",
        (name, surname, email, login, password1))

    db.execute("SELECT ID_user FROM todo.users WHERE Login LIKE %s;", (login,))
    user = db.fetchone()

    token = auth.encode_auth_token(app, user['ID_user'])
    response.set_cookie("token", token, secret=key_cookie)
    return redirect("/todo")


@app.get('/login')
def sign_in():
    return template('login', msg='')


@app.post('/login')
def sign_in(db):
    login = request.POST.login.strip()
    password = request.POST.password.strip()

    db.execute("SELECT ID_user, Login, Password FROM "
               "todo.users WHERE Login LIKE %s;", (login,))
    user = db.fetchone()
    if user:
        if password == user['Password']:
            token = auth.encode_auth_token(app, user['ID_user'])
            response.set_cookie("token", token, secret=key_cookie)
            return redirect("/todo")
        else:
            return template('login', msg='Неправильный пароль')
    else:
        return template('login', msg='Не удалось найти пользователя с '
                                     'таким именем')


@app.get('/logout')
def sign_out():
    response.delete_cookie("token")
    return redirect('/')


@app.get('/todo')
def todo_list(db):
    if not is_auth():
        return redirect('/login')
    else:
        token = request.get_cookie("token", secret=key_cookie)
        user_id = auth.decode_auth_token(app, token)
        db.execute(
            "SELECT ID_tasks, Task FROM todo.tasks  WHERE Status = '1' AND "
            "ID_user = %s;", (user_id,))
        rows = db.fetchall()
        return template('table', rows=rows, msg='')


@app.get('/done')
def done_list(db):
    if not is_auth():
        return redirect('/login')
    else:
        token = request.get_cookie("token", secret=key_cookie)
        user_id = auth.decode_auth_token(app, token)
        db.execute(
            "SELECT ID_tasks, Task FROM todo.tasks WHERE Status LIKE '0' AND ID_user = %s;",
            (user_id,))
        rows = db.fetchall()
        return template('table', rows=rows, msg='')


@app.post('/new')
def new_item(db):
    if not is_auth():
        return redirect('/login')
    else:
        token = request.get_cookie("token", secret=key_cookie)
        user_id = auth.decode_auth_token(app, token)
        new = request.POST.task.strip()
        db.execute("INSERT INTO todo.tasks(Task, Status, ID_user) VALUES ("
                   "%s,%s,%s);",
                   (new, 1, user_id))
        return redirect("/todo")


@app.get('/new')
def new_item():
    if not is_auth():
        return redirect('/login')
    else:
        return template('new_task.tpl')


@app.post('/edit/<no:int>')
def edit_item(no, db):
    if not is_auth():
        return redirect('/login')
    else:
        token = request.get_cookie("token", secret=key_cookie)
        user_id = auth.decode_auth_token(app, token)

        edit = request.POST.task.strip()
        status = request.POST.status.strip()

        if status == 'нужно сделать':
            status = 1
        else:
            status = 0

        db.execute(
            "UPDATE todo.tasks SET Task = %s, Status = %s WHERE ID_tasks = "
            "%s AND ID_user = %s;",
            (edit, status, no, user_id))

        # msg = f'Задача под номером {no} успешно обновлена'
        return redirect('/todo')


@app.get('/edit/<no:int>')
def edit_item(no, db):
    if not is_auth():
        return redirect('/login')
    else:
        token = request.get_cookie("token", secret=key_cookie)
        user_id = auth.decode_auth_token(app, token)
        db.execute("SELECT Task FROM todo.tasks WHERE ID_tasks = %s AND "
                   "ID_user = %s;",
                   (no, user_id))
        cur_data = db.fetchone()
        return template('edit_task', old=list(cur_data.values())[0], no=no)


@app.post('/del/<no:int>')
def del_task(no, db):
    if not is_auth():
        return redirect('/login')
    else:
        try:
            token = request.get_cookie("token", secret=key_cookie)
            user_id = auth.decode_auth_token(app, token)
            db.execute(
                "DELETE FROM todo.tasks WHERE ID_tasks = %s AND "
                "ID_user = %s;", (no, user_id))
        except:
            pass
        return redirect('/todo')


@app.route('/static/:filename#.*#')
def send_static(filename):
    return static_file(filename, root='./static/')


@app.error(403)
def mistake403(err):
    return 'Неверный формат передаваемого параметра!'


@app.error(404)
def mistake404(err):
    return 'Ошибка 404. Данной страницы не существует!'


run(app, reloader=True, debug=True)
