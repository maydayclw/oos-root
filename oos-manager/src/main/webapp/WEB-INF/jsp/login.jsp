<%--
  Created by IntelliJ IDEA.
  User: DAV5
  Date: 2017/4/16
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/tag.jsp" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link rel="shortcut icon" type="image/x-icon" href="${basePath}/images/logo.jpg" media="screen" />
    <link href="${basePath}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${basePath}/css/login-register.css" rel="stylesheet"/>
    <link href="${basePath}/plugins/font-awesome/css/font-awesome.css" rel="stylesheet"/>

</head>
<body>
<div id="Layer1" style="position:absolute; left:0; top:0; width:100%; height:100%">
    <img src="http://192.168.139.101/images/background.jpg" width="100%" height="100%"/>
</div>
<div class="container">
    <div class="modal fade login" id="loginModal">
        <div class="modal-dialog login animated">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">OOS 登录</h4>
                </div>
                <div class="modal-body">
                    <div class="box">
                        <div class="content">
                             <div class="social">
                                <img src="${basePath}/images/logo.jpg" />
                             </div>
                             <div class="division">
                                 <div class="line l"></div>
                                 <span>oos</span>
                                 <div class="line r"></div>
                             </div>
                            <div class="error text-danger" style="text-align: center">${requestScope.error}</div>
                            <br>
                            <div class="form loginBox">
                                <form id="login-form" method="post" action="${basePath}/sys/login"
                                      accept-charset="UTF-8">
                                    <input id="login-email" class="form-control" type="text" placeholder="邮箱"
                                           name="usercode">
                                    <input id="login-password" class="form-control" type="password"
                                           placeholder="密码" name="password">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <input id="randomCode" name="randomCode" class="form-control" type="text"
                                                   placeholder="验证码">
                                        </div>
                                        <div class="col-md-4">
                                            <a href='javascript:;'>
                                                <img src="${basePath}/validatecode.jsp"
                                                     onclick="this.src='${basePath}/validatecode.jsp?'+Math.random()"
                                                     alt="验证码"/>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input class="text-success" type="checkbox" name="rememberMe">记住我,自动登录
                                        </label>
                                    </div>
                                    <input class="btn btn-default btn-login" type="button" value="登录"
                                           onclick="loginAjax()">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="content registerBox" style="display:none;">
                            <div class="form">
                                <form method="post" html="{:multipart=>true}" data-remote="true" action=""
                                      accept-charset="UTF-8">
                                    <input id="register-email" class="form-control" type="text" placeholder="邮箱"
                                           name="email">
                                    <input id="register-username" class="form-control" type="text" placeholder="唯一用户名"
                                           name="username">
                                    <input id="register-nickname" class="form-control" type="text" placeholder="昵称"
                                           name="nickname">
                                    <input id="register-password" class="form-control" type="password"
                                           placeholder="密码" name="password">
                                    <input id="register-password_confirmation" class="form-control" type="password"
                                           placeholder="确认密码" name="password_confirmation">
                                    <input class="btn btn-default btn-register" type="button" value="注册" name="commit"
                                           id="register">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="forgot login-footer">
                            <span>没有账户?
                                 <a href="javascript: showRegisterForm();">去注册</a>
                            </span>
                    </div>
                    <div class="forgot register-footer" style="display:none">
                        <span>已经有账户?</span>
                        <a href="javascript: showLoginForm();">去登录</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>var basePath = '${basePath}';</script>
<script src="${basePath}/plugins/jquery/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/plugins/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<script src="${basePath}/js/login-register.js" type="text/javascript"></script>
<script src="${basePath}/plugins/layer/layer.js"></script>
<script>
    $(function () {
        $("#loginModal").modal({
            show: true,
            backdrop: 'static',
            keyboard: false
        });
        $("#register").bind("click", function () {
            var email = $("#register-email").val();
            var username = $("#register-username").val();
            var nickname = $("#register-nickname").val();
            var password = $("#register-password").val();
            var password_confirmation = $("#register-password_confirmation").val();
            if (email == "") {
                $('#loginModal .modal-dialog').addClass('shake');
                $('.error').html("邮箱不能为空!");
                $('input[type="password"]').val('');
                setTimeout(function () {
                    $('#loginModal .modal-dialog').removeClass('shake');
                }, 1000);
                return false;
            }
            if (username == "") {
                $('#loginModal .modal-dialog').addClass('shake');
                $('.error').html("用户名不能为空!");
                $('input[type="password"]').val('');
                setTimeout(function () {
                    $('#loginModal .modal-dialog').removeClass('shake');
                }, 1000);
                return false;
            }
            if (nickname == "") {
                $('#loginModal .modal-dialog').addClass('shake');
                $('.error').html("取个昵称吧!");
                $('input[type="password"]').val('');
                setTimeout(function () {
                    $('#loginModal .modal-dialog').removeClass('shake');
                }, 1000);
                return false;
            }
            if (password == "") {
                $('#loginModal .modal-dialog').addClass('shake');
                $('.error').html("密码不能为空!");
                $('input[type="password"]').val('');
                setTimeout(function () {
                    $('#loginModal .modal-dialog').removeClass('shake');
                }, 1000);
                return false;
            }
            if (password_confirmation == "") {
                $('#loginModal .modal-dialog').addClass('shake');
                $('.error').html("确认密码不能为空!");
                $('input[type="password"]').val('');
                setTimeout(function () {
                    $('#loginModal .modal-dialog').removeClass('shake');
                }, 1000);
                return false;
            }
            if (!email.match(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/)) {
                $('#loginModal .modal-dialog').addClass('shake');
                $('.error').html("邮箱不符合规则!");
                $('input[type="password"]').val('');
                setTimeout(function () {
                    $('#loginModal .modal-dialog').removeClass('shake');
                }, 1000);
                return false;
            }
            if (password_confirmation != password) {
                $('#loginModal .modal-dialog').addClass('shake');
                $('.error').html("两次输入密码不一致!");
                $('input[type="password"]').val('');
                setTimeout(function () {
                    $('#loginModal .modal-dialog').removeClass('shake');
                }, 1000);
                return false;
            }
            var index = layer.load(1, {
                shade: [0.1,'#fff'] //0.1透明度的白色背景
            });
            $.post(basePath + '/sys/register',
                {
                    id: username,
                    username: nickname,
                    usercode: email,
                    password: password
                },
                function (result) {
                    layer.close(index);
                    if (result && result['success']) {//注册成功
                        var message = result['data'];
                        var email = message['usercode'];
                        var role = message['role'];
                        layer.msg("注册成功，邮箱为:" + email + ",角色为:" + role);
                        window.location.href = basePath+'/sys/main';
                    } else {
                        var error = result['message'];
                        $("#loginModal").modal({
                            show: false
                        });
                        layer.msg(error);
                    }
                },
                'json'
            );
        });
    });
</script>
</body>
</html>
