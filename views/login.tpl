% rebase('base.tpl', msg=msg, title='Вход')
<div class="container-sm col-4">
    <h3>Добро пожаловать</h3>
    <form action="/login" method="POST">
        <div class="form-group">
            <label for="inputPassword4">Логин</label>
            <input type="text" class="form-control"
                   id="inputLogin" name="login" autofocus required>
        </div>
        <div class="form-group">
            <label for="inputPassword4">Пароль</label>
            <input type="password" class="form-control"
                   id="inputPassword4" name="password" required>
        </div>
        <input type="submit" name="save" value="Войти"
               class="btn btn-primary mb-2">
        <input name="csrf_token" type="hidden" value="{{csrf_token()}}">
    </form>
</div>
