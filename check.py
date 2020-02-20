import re

from bottle import request


def validate_email(email):
    pattern = re.compile(r'^\w{3,}@\w{2,}\.\w{2,4}$')
    match = re.fullmatch(pattern, email)
    return True if match else False


def is_auth():
    s = request.environ.get('beaker.session')
    user_id = 'user_id' in s
    return True if user_id else False


def exist(db, value, kind):
    if kind == 'Login':
        db.execute("SELECT ID_user FROM "
                   "todo.users WHERE Login LIKE %s;", (value,))
    elif kind == 'Email':
        db.execute("SELECT ID_user FROM "
                   "todo.users WHERE Email LIKE %s;", (value,))
    item = db.fetchone()

    return False if item is None else True
