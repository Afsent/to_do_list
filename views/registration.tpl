% rebase('base.tpl', msg=msg, title='Регистрация')
%if data:
    %name, surname, email, login = data.values()
%else :
    %name = surname = email = login = ''
%end
<div class="container-sm col-6">
    <h3>Добро пожаловать</h3>
    <form action="/registration" method="POST">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label>Имя</label>
                <input type="text" size="100" name="first_name"
                       class="form-control" value="{{name}}" required
                       autofocus>
            </div>
            <div class="form-group col-md-6">
                <label>Фамилия</label>
                <input type="text" size="100" name="surname"
                       class="form-control" value="{{surname}}" required>
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="inputEmail4">Email</label>
                <input type="email" class="form-control" id="inputEmail4"
                       name="email" value="{{email}}" required>
                <span id="validEmail"></span>
            </div>
            <div class="form-group col-md-6">
                <label for="inputPassword4">Логин</label>
                <input type="text" class="form-control"
                       id="inputLogin" name="login" value="{{login}}" required>
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword4">Пароль</label>
            <input type="password" class="form-control"
                   id="inputPassword4" name="password1" required>
            <span id="validPassword"></span>
        </div>
        <div class="form-group">
            <label for="inputPassword5">Пароль</label>
            <input type="password" class="form-control"
                   id="inputPassword5" name="password2" required>
            <span id="validPassword2"></span>
        </div>
        <input type="submit" name="save" value="Зарегистрироваться"
               class="btn btn-primary mb-2" id="button">
        <input name="csrf_token" type="hidden" value="{{csrf_token()}}">
    </form>
</div>