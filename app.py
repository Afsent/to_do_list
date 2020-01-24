import bottle_mysql
from bottle import run, template, request, redirect, static_file, Bottle

app = Bottle()
plugin = bottle_mysql.Plugin(dbuser='root', dbpass="*****",
                             dbname='todo')
app.install(plugin)


@app.get('/registration')
def registration():
    return template('registration')


@app.post('/registration')
def registration(db):
    if request.POST.save:
        name = request.POST.first_name.strip()
        surname = request.POST.surname.strip()
        email = request.POST.email.strip()
        login = request.POST.login.strip()
        password = request.POST.password.strip()

        db.execute("INSERT INTO todo.users(Name,Surname,Email,Login, Password"
                   ") VALUES (%s, %s, %s, %s, %s);", (name, surname, email,
                                                      login, password))
        return redirect("/todo")



@app.get('/todo')
def todo_list(db):
    db.execute(
        "SELECT ID_tasks, Task FROM todo.tasks  WHERE Status LIKE '1';")
    rows = db.fetchall()
    if rows:
        return template('table', rows=rows)
    return "<b>Задач нет</b>"


@app.get('/done')
def done_list(db):
    db.execute("SELECT ID_tasks, Task FROM todo.tasks WHERE Status LIKE '0'")
    rows = db.fetchall()
    if rows:
        return template('table', rows=rows)
    return "<b>Задач нет</b>"


@app.post('/new')
def new_item(db):
    if request.POST.save:
        new = request.POST.task.strip()
        db.execute("INSERT INTO todo.tasks(Task, Status) VALUES (%s,%s);",
                   (new, 1))
        return redirect("/todo")


@app.get('/new')
def new_item():
    return template('new_task.tpl')


@app.post('/edit/<no:int>')
def edit_item(no, db):
    if request.POST.save:
        edit = request.POST.task.strip()
        status = request.POST.status.strip()

        if status == 'нужно сделать':
            status = 1
        else:
            status = 0

        db.execute(
            "UPDATE todo.tasks SET Task = %s, Status = %s WHERE ID_tasks "
            "LIKE %s;",
            (edit, status, no))
        return f'<p>Задача под номером {no} успешно обновлена</p><a ' \
               f'href="/todo"></a>'


@app.get('/edit/<no:int>')
def edit_item(no, db):
    db.execute("SELECT Task FROM todo.tasks WHERE ID_tasks LIKE %s;",
               (no,))
    cur_data = db.fetchone()
    return template('edit_task', old=list(cur_data.values())[0], no=no)


@app.post('/del/<no:int>')
def del_task(no, db):
    db.execute(
        "DELETE FROM todo.tasks WHERE ID_tasks LIKE %s;", (no,))
    return f'<p>Задача под номером {no} успешно удалена</p>'


@app.route('/static/:filename#.*#')
def send_static(filename):
    return static_file(filename, root='./static/')


@app.error(403)
def mistake403(err):
    return 'Неверный формат передаваемого параметра!'


@app.error(404)
def mistake404(err):
    return f'Ошибка 404. Данной страницы не существует!'


run(app, reloader=True, debug=True)
