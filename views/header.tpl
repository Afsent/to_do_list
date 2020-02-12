<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
     style="margin-bottom: 1rem">
    <div class="container">
        <a class="navbar-brand" href="/todo">TODO</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="/done">Завершенные
                        <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/new">Новая задача</a>
                </li>
            </ul>

        </div>
        <ul class="nav navbar-nav navbar-right">
            % from bottle import request
            % s = request.environ.get('beaker.session')
            % if 'user_id' not in s:
            <li class="nav-item">
                <a class="nav-link" href="/registration">Регистрация</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/login">Вход</a>
            </li>
            % else:
            <li class="nav-item">
                <a class="nav-link" href="/logout">Выход</a>
            </li>
            % end
        </ul>
    </div>
</nav>