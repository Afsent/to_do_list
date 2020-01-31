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
    <form action="/registration" method="POST">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label>Имя</label>
                <input type="text" size="100" maxlength="100" name="first_name"
                       class="form-control" required>
            </div>
            <div class="form-group col-md-6">
                <label>Фамилия</label>
                <input type="text" size="100" maxlength="100" name="surname"
                       class="form-control" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputEmail4">Email</label>
                <input type="email" class="form-control" id="inputEmail4"
                       name="email" required>
                <span id="validEmail"></span>
            </div>
            <div class="form-group col-md-6">
                <label for="inputPassword4">Логин</label>
                <input type="text" class="form-control"
                       id="inputLogin" name="login" required>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword4">Пароль</label>
            <input type="password" class="form-control"
                   id="inputPassword4" name="password" required>
            <span id="validPassword"></span>
        </div>
        <input type="submit" name="save" value="Зарегистрироваться"
               class="btn btn-primary mb-2" id="button">
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/validate.js"></script>
<script src="/static/js/bootstrap.js"></script>
</body>
</html>