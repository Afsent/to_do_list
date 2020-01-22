<p>Изменить задачу под нод номером {{no}}</p>
<form action="/edit/{{no}}" method="get">
  <input type="text" name="task" value="{{old[0]}}" size="100" maxlength="100">
  <select name="status">
    <option>нужно сделать</option>
    <option>завершено</option>
  </select>
  <br>
  <input type="submit" name="save" value="save">
</form>