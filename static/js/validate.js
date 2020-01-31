$(document).ready(function () {
    $('#inputEmail4').blur(function () {
        if ($(this).val() != '') {
            // Здесь происходит дальнейшая проверка
            let pattern =
                /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
            if (pattern.test($(this).val())) {
                $('#valid').text('Верно');
            } else {
                $('#valid').text('Не верно');
            }
        } else {
            // Предупреждающее сообщение
            $(this).css({'border': '1px solid #ff0000'});
            $('#valid').text('Поле пустое. Введите e-mail.');
        }
    });
});