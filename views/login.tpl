<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <title>Регистрация</title>
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
<div class="container-sm col-6">
    <h3>Добро пожаловать</h3>
    <form action="/login" method="POST">
        <div class="form-group">
            <label for="inputPassword4">Логин</label>
            <input type="text" class="form-control"
                   id="inputLogin" name="login">
        </div>
        <div class="form-group">
            <label for="inputPassword4">Пароль</label>
            <input type="password" class="form-control"
                   id="inputPassword4" name="password">
        </div>
        <input type="submit" name="save" value="Войти"
               class="btn btn-primary mb-2">
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/validate.js"></script>
<script src="/static/js/bootstrap.js"></script>
</body>
</html>