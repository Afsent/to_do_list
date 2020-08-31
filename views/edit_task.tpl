% rebase('base.tpl', msg='', title='Изменение задачи')
<div class="container-sm col-6">
    <h3>Изменить задачу:</h3>
    <form action="/edit/{{no}}" method="post">
        <div class="form-group">
            <label>Название:</label>
            <input type="text" name="task" value="{{old}}"
                   maxlength="100" class="form-control" autofocus>
        </div>
        <div class="form-group">
            <label>Статус:</label>
            <select name="status" class="custom-select mr-sm-2"
                    id="inlineFormCustomSelect">
                <option>нужно сделать</option>
                <option>завершено</option>
            </select>
        </div>
        <input type="submit" name="save" value="Сохранить"
               class="btn btn-primary mb-2">
        <input name="csrf_token" type="hidden" value="{{csrf_token()}}">
    </form>
</div>