% rebase('base.tpl', msg='', title='Новая задача')
<div class="container-sm col-6">
    <h3>Добавте новую задачу:</h3>
    <form action="/new" method="POST">
        <div class="form-group">
            <label>Название:</label>
            <input type="text" size="100" maxlength="100" name="task"
                   class="form-control" autofocus>
        </div>
        <input type="submit" name="save" value="Сохранить"
               class="btn btn-primary mb-2">
        <input name="csrf_token" type="hidden" value="{{csrf_token()}}">
    </form>
</div>
