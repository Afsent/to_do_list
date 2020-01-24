import bottle_mysql
from bottle import run, template, request, redirect, static_file, Bottle

app = Bottle()
plugin = bottle_mysql.Plugin(dbuser='root', dbpass="*****",
                             dbname='todo')
app.install(plugin)


@app.route('/todo')
def todo_list(db):
    db.execute(
        "SELECT ID_tasks, Task FROM todo.tasks  WHERE Status LIKE '1';")
    rows = db.fetchall()
    if rows:
        print(rows)
        return template('table', rows=rows)
    return "<b>Задач нет</b>"


@app.route('/done')
def done_list(db):
    db.execute("SELECT ID_tasks, Task FROM todo.tasks WHERE Status LIKE '0'")
    rows = db.fetchall()
    if rows:
        return template('table', rows=rows)
    return "<b>Задач нет</b>"


@app.route('/new', method='GET')
def new_item(db):
    if request.GET.save:
        new = request.GET.task.strip()
        db.execute("INSERT INTO todo.tasks(Task, Status) VALUES (%s,%s);",
                   (new, 1))
        return redirect("/todo")
    else:
        return template('new_task.tpl')


@app.route('/edit/<no:int>', method='GET')
def edit_item(no, db):
    if request.GET.save:
        edit = request.GET.task.strip()
        status = request.GET.status.strip()

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
    else:
        return template('edit_task', old=[1], no=no)


@app.route('/del/<no:int>')
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
