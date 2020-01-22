import sqlite3
conn = sqlite3.connect('todo.db') # Warning: This file is created in the current directory
conn.execute("CREATE TABLE todo (id INTEGER PRIMARY KEY, task char(100) NOT NULL, status bool NOT NULL)")
conn.execute("INSERT INTO todo (task,status) VALUES ('Task 1',0)")
conn.execute("INSERT INTO todo (task,status) VALUES ('Task 2',1)")
conn.execute("INSERT INTO todo (task,status) VALUES ('Task 3',1)")
conn.execute("INSERT INTO todo (task,status) VALUES ('Task 4',0)")
conn.commit()