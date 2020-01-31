<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <title>Задачи</title>
</head>
<body>
% include('header.tpl')
%if msg:
    <div class="container-sm col-6" align="center">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{msg}}
            <button type="button" class="close" data-dismiss="alert"
                    aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </div>
%end
<div class="container">
    <h1>Список задач:</h1>
    <table class="table table-hover">
        <tr>
            <td><h3>ID</h3></td>
            <td><h3>Задача</h3></td>
        </tr>
        %for row in rows:
        <tr>
            %for col in row.values():
            <td>{{col}}</td>
            %end
            <td>
                <a href="/edit/{{int(list(row.values())[0])}}"
                   class="btn btn-warning mb-2">Изменить</a>
            </td>
            <td>
                <form action="/del/{{int(list(row.values())[0])}}"
                      method='post'>
                    <input type="submit" value="Удалить"
                           class="btn btn-danger mb-2">
                </form>
            </td>
        </tr>
        %end
    </table>
    <a href="/new">Создать новую задачу</a>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/validate.js"></script>
<script src="/static/js/bootstrap.js"></script>
</body>
</html>