<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
</head>

<style type="text/css">
    body{
        background-size: 100% 100%;
    }
</style>
<body  background="${ctx}/images/background/l1.jpg">
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
            <a class="navbar-brand" href="#">帅鹏博客</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
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
                        </a>
                        <ul class="dropdown-menu">
                            <c:if test="${user.type==1}">
                                <li><a href="backstage">后台管理</a></li>
                            </c:if>
                            <li><a href="user/myIndex">我的主页</a></li>
                            <li><a href="#">我的消息</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="logout">退出登录</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
    <div style="width: 300px;height: 250px;margin-top: 10%;background-color: #D3E1ED;float: right;margin-right: 15%">
        <div style="width: 90%;height: 18%;text-align: center;margin: auto;">
            <h3 style="margin-top: 16px;">用户登录</h3>
        </div>
        <div style="width: 100%;height: 82%;">
            <form class="layui-form" action="#<%--login--%>" method="post" lay-filter="example">
                <div class="layui-form-item" style="width: 90%;margin: auto;">
                    <input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input" id="username">
                </div>
                <div class="layui-form-item" style="width: 90%;margin: auto;margin-top: 10px;">
                    <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input" id="password">
                </div>
                <div class="layui-form-item" style="width: 90%;margin: auto;margin-top: 10px;">
                    <input class="layui-btn" id="login" lay-submit="" lay-filter="demo1" style="width: 100%;" value="立即登陆" type="button">
                </div>
                <div class="layui-form-item" style="width: 90%;margin: auto;margin-top: 4px;">
                    <p style="color:red;" id="errMsg"></p>
                </div>
                <div class="layui-form-item" style="width: 90%;margin: auto;margin-top: 4px;">
                    <h4>没有账号？<a href="/register">跳转注册！</a></h4>
                </div>
            </form>
        </div>
    </div>
</body>
<script src="${ctx}/static/js/jquery-3.3.1.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>

    //给登录按钮绑定点击事件
    $("#login").click(function(){
        //利用ajax进行登录请求
        //1、创建XMLHttpRequest 对象
        var xmlhttp = new XMLHttpRequest();
        //2、建立请求
        xmlhttp.open("POST","${ctx}/login",true);
        //3、发送请求
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("username="+$("#username").val()+"&password="+$("#password").val());
        //4、处理响应
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    $("#errMsg").text("登录成功！");
                    window.setTimeout(index,2000);
                    function index() {
                        history.go(-1);
                    }
                }else if(xmlhttp.responseText=='err1'){
                    $("#errMsg").text("登录失败！用户名或密码不能为空！");
                }else if(xmlhttp.responseText=='err2'){
                    $("#errMsg").text("登录失败！用户名或密码错误！");
                }else if(xmlhttp.responseText=='err3'){
                    $("#errMsg").text("用户名不存在！");
                } else if(xmlhttp.responseText=='err4'){
                    $("#errMsg").text("登录失败！您的账户已被封禁！");
                }else{
                    $("#errMsg").text("登录失败！请联系管理员！");
                }
            }
        }
    })
</script>
</html>
