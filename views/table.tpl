<p>Список задач:</p>
<table border="1">
    %for row in rows:
    <tr>
        %for col in row:
        <td>{{col}}</td>
        %end
        <td><a href="/edit/{{int(row[0])}}">Изменить</a></td>
        <td><a href="/del/{{int(row[0])}}">Удалить</a></td>
    </tr>
    %end
</table>
<a href="/new">Создать новую задачу</a>