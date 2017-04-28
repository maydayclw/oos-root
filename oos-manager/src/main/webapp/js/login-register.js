function showRegisterForm() {
    $('.loginBox').fadeOut('fast', function () {
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast', function () {
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('OOS 注册');
    });
    $('.error').removeClass('alert alert-danger').html('');

}
function showLoginForm() {
    $('#loginModal .registerBox').fadeOut('fast', function () {
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast', function () {
            $('.login-footer').fadeIn('fast');
        });

        $('.modal-title').html('OOS 登录');
    });
    $('.error').removeClass('alert alert-danger').html('');
}

function openLoginModal() {
    showLoginForm();
    setTimeout(function () {
        $('#loginModal').modal('show');
    }, 230);

}
function openRegisterModal() {
    showRegisterForm();
    setTimeout(function () {
        $('#loginModal').modal('show');
    }, 230);

}

function loginAjax() {
    /*   Remove this comments when moving to server
     $.post( "/login", function( data ) {
     if(data == 1){
     window.location.replace("/home");
     } else {
     shakeModal();
     }
     });
     */

    /*   Simulate error message from the server   */
    shakeModal();
}

function shakeModal() {
    if($("#login-email").val()=="")
    {
        $('#loginModal .modal-dialog').addClass('shake');
        $('.error').html("邮箱不能为空!");
        $('input[type="password"]').val('');
        setTimeout(function () {
            $('#loginModal .modal-dialog').removeClass('shake');
        }, 1000);
        return false;
    }
    if($("#login-password").val()=="")
    {
        $('#loginModal .modal-dialog').addClass('shake');
        $('.error').html("密码不能为空!");
        $('input[type="password"]').val('');
        setTimeout(function () {
            $('#loginModal .modal-dialog').removeClass('shake');
        }, 1000);
        return false;
    }
    var email=$("#login-email").val();
    if(!email.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/))
    {
        $('#loginModal .modal-dialog').addClass('shake');
        $('.error').html("邮箱不符合规则!");
        $('input[type="password"]').val('');
        setTimeout(function () {
            $('#loginModal .modal-dialog').removeClass('shake');
        }, 1000);
        return false;
    }

    $("#login-form").submit();

}

   