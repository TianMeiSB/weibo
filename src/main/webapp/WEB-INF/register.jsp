<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <title>用户注册</title>
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
</head>
<style>
    body{
        background-size: 100% 100%;
    }
</style>
<body background="${ctx}/images/background/l1.jpg">
<nav class="navbar navbar-default navbar-fixed-top"  style="background-color: #E7EAED;">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/index">帅鹏博客</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/index">首页 <span class="sr-only">(current)</span></a></li>
                <c:if test="${not empty user}">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">发表内容<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="addweibo">微博</a></li>
                            <li><a href="addblog">博客</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="全站搜索">
                </div>
                <button type="submit" class="btn btn-default">GO</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${empty user}">
                    <li><a href="/login">登陆</a></li>
                </c:if>
                <li><a href="#">关于本站</a></li>
                <c:if test="${not empty user}">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false" style="padding-bottom: 0px;padding-left: 0px;padding-top: 10px;">
                            <img src="${user.image}" alt="头像" class="img-circle"  style="width: 30px;height: 30px;">
                                ${user.username}<span class="caret"></span>
                            <c:if test="${comments.size()!=0||comments2.size()!=0}">
                                <span class="layui-badge-dot"></span>
                            </c:if>
                        </a>
                        <ul class="dropdown-menu">
                            <c:if test="${user.type==1}">
                                <li><a href="backstage">后台管理</a></li>
                            </c:if>
                            <li><a href="/user/myIndex">我的主页</a></li>
                            <li><a href="/user/seeComment">
                                我的消息
                                <c:if test="${comments.size()!=0||comments2.size()!=0}">
                                    <span class="layui-badge">${comments.size()+comments2.size()}
                                    </span></c:if></a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="logout">退出登录</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div style="width: 550px;height: 420px;background-color: #F8F8F8;margin: auto;margin-top: 100px;opacity: 0.92;">
    <div class="layui-form-item" style="width: 90%;margin: auto;">
        <h2 style="float: left;margin-top: 15px;margin-left: 200px;">用户注册</h2>
    </div>
    <form class="layui-form" action="#<%--register--%>" method="post" lay-filter="example" style="margin-top: 10px;">
        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-block">
                <input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input" id="username">
            </div>
        </div>
        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input" id="password">
            </div>
        </div>
        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-block">
                <input type="text" name="address" lay-verify="title" autocomplete="off" placeholder="请输入地址" class="layui-input" id="address">
            </div>
        </div>
        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <label class="layui-form-label">电话</label>
            <div class="layui-input-block">
                <input type="text" name="phone" lay-verify="title" autocomplete="off" placeholder="请输入电话号码" class="layui-input" id="phone" maxlength="11">
            </div>
        </div>
        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-block">
                <input type="text" name="phone" lay-verify="title" autocomplete="off" placeholder="请输入正确格式的邮箱" class="layui-input" id="email">
            </div>
        </div>
        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <label class="layui-form-label">验证码</label>
            <div class="layui-input-block">
                <input type="text" name="phone" lay-verify="title" autocomplete="off" placeholder="请输入验证码" class="layui-input" id="code" style="width: 120px;float: left;margin-right: 10px;">
                <input class="layui-btn" lay-submit="" lay-filter="demo1" id="email2" value="发送验证码" type="button" style="float: left" />
            </div>
        </div>
        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked="" class="sex">
                <input type="radio" name="sex" value="女" title="女" class="sex">
                <input type="radio" name="sex" value="保密" title="保密" class="sex">
            </div>
        </div>

        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <div class="layui-input-block">
                <input class="layui-btn" lay-submit="" lay-filter="demo1" id="register" value="立即提交" type="button">
            </div>
        </div>
    </form>
</div>
</body>
<script src="${ctx}/static/js/jquery-3.3.1.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });
        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
    });
    layui.use('layer',function () {
        var layer = layui.layer;
    });
    $("#register").click(function(){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/register",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("username="+$("#username").val()+"&password="+$("#password").val()+"&address="+$("#address").val()+"&phone="+$("#phone").val()+"&sex="+$("input[type='radio']:checked").val()+"&email="+$("#email").val()+"&code="+$("#code").val());
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    layer.ready(function(){
                        layer.msg('注册成功！即将为您跳转到首页');
                    });
                    window.setTimeout(index,3000);
                    function index() {
                        location.href="${ctx}/";
                    }
                }else if(xmlhttp.responseText=='err1'){
                    layer.ready(function(){
                        layer.msg('注册失败！请填写完整信息！');
                    });
                }else if(xmlhttp.responseText=='err2'){
                    layer.ready(function(){
                        layer.msg('注册失败！该用户名已被注册！');
                    });
                }else if(xmlhttp.responseText=='err3'){
                    layer.ready(function(){
                        layer.msg('注册失败，请联系管理员！');
                    });
                }else if(xmlhttp.responseText=='err4'){
                    layer.ready(function(){
                        layer.msg('注册失败，验证码不正确！');
                    });
                }else{
                    layer.ready(function(){
                        layer.msg('注册失败，请联系管理员！');
                    });
                }
            }
        }
    })
    $("#email2").click(function () {
        var email = $("#email").val();
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/sendMail",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("email="+email);
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    layer.ready(function(){
                        layer.msg('验证码已发送！');
                    });
                }else if(xmlhttp.responseText=='err1'){
                    layer.ready(function(){
                        layer.msg('邮箱不能为空！');
                    });
                }
                else if(xmlhttp.responseText=='err2'){
                    layer.ready(function(){
                        layer.msg('邮箱格式不正确！');
                    });
                }
            }
        }
    })
</script>
</html>
