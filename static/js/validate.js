$(document).ready(function () {
    $('#inputEmail4').blur(function () {
        submitButton = document.getElementById('button')
        if ($(this).val() != '') {
            // Здесь происходит проверка email
            let pattern =
                /^\w{3,}@\w{3,}\.\w{2,4}$/i;
            if (pattern.test($(this).val())) {
                $(this).css({'border': '1px solid #00ad0e'});
                $('#valid').text('Верно');
                submitButton.disabled = false;
            } else {
                $(this).css({'border': '1px solid #ff0000'});
                $('#valid').text('Не верно');
                submitButton.disabled = true;
            }
        } else {
            // Предупреждающее сообщение
            $(this).css({'border': '1px solid #ff0000'});
            $('#valid').text('Поле пустое. Введите e-mail.');
            submitButton.disabled = true;
        }
    });
});