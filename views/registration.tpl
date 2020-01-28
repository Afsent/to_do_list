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
        </div>
        <input type="submit" name="save" value="Зарегистрироваться"
               class="btn btn-primary mb-2">
    </form>
</div>
<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
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