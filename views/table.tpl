<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
          crossorigin="anonymous">

    <title>Задачи</title>
</head>
<body>
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
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>
</html>