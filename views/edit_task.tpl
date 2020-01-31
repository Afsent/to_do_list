<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <title>Изменение задачи</title>
</head>

<body>
% include('header.tpl')
<div class="container">
    <h3>Изменить задачу под нод номером {{no}}</h3>
    <form action="/edit/{{no}}" method="post">
        <div class="form-group">
            <label>Название:</label>
            <input type="text" name="task" value="{{old}}"
                   size="100"
                   maxlength="100" class="form-control">
        </div>
        <div class="form-group">
            <label>Статус:</label>
            <select name="status" class="custom-select mr-sm-2"
                    id="inlineFormCustomSelect">
                <option>нужно сделать</option>
                <option>завершено</option>
            </select>
        </div>
        <input type="submit" name="save" value="Сохранить" class="btn btn-primary mb-2">
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/js/validate.js"></script>
<script src="/static/js/bootstrap.js"></script>
</body>
</html>