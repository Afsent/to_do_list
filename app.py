import sqlite3
from bottle import route, run, template, request, error, redirect


@route('/todo')
def todo_list():
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("SELECT id, task FROM todo WHERE status LIKE '1'")
    result = c.fetchall()
    c.close()
    output = template('table', rows=result)
    return output


@route('/done')
def done_list():
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("SELECT id, task FROM todo WHERE status LIKE '0'")
    result = c.fetchall()
    c.close()
    output = template('table', rows=result)
    return output


@route('/new', method='GET')
def new_item():
    if request.GET.save:

        new = request.GET.task.strip()
        conn = sqlite3.connect('todo.db')
        c = conn.cursor()

        c.execute("INSERT INTO todo (task,status) VALUES (?,?)", (new, 1))

        conn.commit()
        c.close()

        return redirect("/todo")
    else:
        return template('new_task.tpl')


@route('/edit/<no:int>', method='GET')
def edit_item(no):
    if request.GET.save:
        edit = request.GET.task.strip()
        status = request.GET.status.strip()

        if status == 'нужно сделать':
            status = 1
        else:
            status = 0

        conn = sqlite3.connect('todo.db')
        c = conn.cursor()
        c.execute("UPDATE todo SET task = ?, status = ? WHERE id LIKE ?",
                  (edit, status, no))
        conn.commit()

        return f'<p>Задача под номером {no} успешно обновлена</p>'
    else:
        conn = sqlite3.connect('todo.db')
        c = conn.cursor()
        c.execute("SELECT task FROM todo WHERE id LIKE ?", (str(no),))
        cur_data = c.fetchone()

        return template('edit_task', old=cur_data, no=no)


@route('/del/<no:int>')
def del_task(no):
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("DELETE FROM todo WHERE id LIKE ?", (str(no),))
    conn.commit()

    return f'<p>Задача под номером {no} успешно удалена</p>'


@route('/item<item:re:[0-9]+>')
def show_item(item):
    conn = sqlite3.connect('todo.db')
    c = conn.cursor()
    c.execute("SELECT task FROM todo WHERE id LIKE ?", (item,))
    result = c.fetchall()
    c.close()
    if not result:
        return 'Задачи с таким номером не существует!'
    else:
        return f'Задача: {result[0][0]}'


@error(403)
def mistake403(code):
    return 'Неверный формат передаваемого параметра!'


@error(404)
def mistake404(code):
    return 'Данной страницы не существует!'


run(reloader=True)
