% rebase('base.tpl', msg=msg, title='Задачи')
<div class="container-sm col-6">
    <h1>Список задач:</h1>
    <table class="table table-hover">
        <tr>
            <td><h5>№</h5></td>
            <td><h5>Задача</h5></td>
        </tr>
        %for id, row in enumerate(rows):
        <tr>
            <td>{{id + 1}}</td>
            <td>{{list(row.values())[1]}}</td>
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