$(document).ready(function () {
    $('#inputEmail4').blur(function () {
        submitButton = document.getElementById('button')
        if ($(this).val() != '') {
            // Здесь происходит проверка email
            let pattern =
                /^\w{3,}@\w{2,}\.\w{2,4}$/i;
            if (pattern.test($(this).val())) {
                $(this).css({'border': '1px solid #00ad0e'});
                $('#validEmail').text('Верно').css({'color': 'green'});
                submitButton.disabled = false;
            } else {
                $(this).css({'border': '1px solid #ff0000'});
                $('#validEmail').text('Неверный формат').css({'color': 'red'});
                submitButton.disabled = true;
            }
        } else {
            // Предупреждающее сообщение
            $(this).css({'border': '1px solid #ff0000'});
            $('#validEmail').text('Поле пустое. Введите e-mail.').css({'color': 'red'});
            submitButton.disabled = true;
        }
    });
    $('#inputPassword4').blur(function () {
        pass2 = document.getElementById('inputPassword5')
        submitButton = document.getElementById('button')
        if ($(this).val() != '') {
            // Здесь происходит проверка пароля
            if ($(this).val().length >= 8) {
                $(this).css({'border': '1px solid #00ad0e'});
                $('#validPassword').text('Подходит').css({'color': 'green'});
                submitButton.disabled = false;
                pass2.disabled = false;
            } else {
                $(this).css({'border': '1px solid #ff0000'});
                $('#validPassword').text('Пароль должен быть не менее 8' +
                    ' символов').css({'color': 'red'});
                submitButton.disabled = true;
                pass2.disabled = true;
            }
        } else {
            // Предупреждающее сообщение
            $(this).css({'border': '1px solid #ff0000'});
            $('#validPassword').text('Поле пустое. Введите пароль.').css({'color': 'red'});
            submitButton.disabled = true;
            pass2.disabled = true;
        }
    });

    $('#inputPassword5').blur(function () {
        submitButton = document.getElementById('button')
        if ($(this).val() != '') {
            // Здесь происходит проверка правильности повторения пароля
            if ($('#inputPassword4').val() == $(this).val()) {
                $(this).css({'border': '1px solid #00ad0e'});
                $('#validPassword2').text('Подходит').css({'color': 'green'});
                submitButton.disabled = false;
            } else {
                $(this).css({'border': '1px solid #ff0000'});
                $('#validPassword2').text('Пароли не совпадают').css({'color': 'red'});
                submitButton.disabled = true;
            }
        } else {
            // Предупреждающее сообщение
            $(this).css({'border': '1px solid #ff0000'});
            $('#validPassword2').text('Поле пустое. Введите пароль.').css({'color': 'red'});
            submitButton.disabled = true;
        }
    });
});