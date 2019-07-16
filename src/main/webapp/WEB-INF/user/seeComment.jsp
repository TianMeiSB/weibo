<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>评论</title>
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <link rel="SHORTCUT ICON" href="${ctx}/images/logo/favicon.ico">
</head>

<style>

</style>
<body style="background-color: #AAD2EB;width: 98.5%;background-image: url(${ctx}/static/images/background/11.png);background-repeat:no-repeat;background-size: 100%;">
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
                <a class="navbar-brand" href="/index" style="text-decoration:none">帅鹏博客</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/index" style="text-decoration:none">首页 <span class="sr-only">(current)</span></a></li>
                    <c:if test="${not empty user}">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">发表内容<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/addweibo">微博</a></li>
                                <li><a href="/addblog">博客</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
                <form class="navbar-form navbar-left" action="/findByLike" method="get">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="全站搜索" name="like">
                    </div>
                    <button type="submit" class="btn btn-default">GO</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <c:if test="${empty user}">
                        <li><a href="/login">登陆</a></li>
                    </c:if>
                    <li><a href="#" style="text-decoration:none">关于本站</a></li>
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
                                    <li><a href="/backstage">后台管理</a></li>
                                </c:if>
                                <li><a href="/user/myIndex">我的主页</a></li>
                                <li><a href="/user/seeComment">
                                    我的消息
                                    <c:if test="${comments.size()!=0||comments2.size()!=0}">
                                    <span class="layui-badge">${comments.size()+comments2.size()}
                                    </span></c:if></a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="/logout">退出登录</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

    <div style="width: 630px;margin: auto;min-height:100%;background-color: #F8F8F8;margin-top: 60px;margin-bottom: 30px;">
        <c:forEach items="${commentList}" var="list">
            <div style="width: 95%;height: 80px;background-color: #FFFFFF;margin: auto;margin-top: 5px;">
                <div style="width: 95%;height: 80%;margin-left: 15px;float: left;margin-top: 8px;">
                    <div style="height: 100%;width: 12%;float: left;margin-right: 5px;">
                        <img src="${list.user1.image}" alt="..." class="img-circle" style="width: 100%;height: 100%">
                    </div>
                    <div style="width: 87%;height: 40%;float: left">
                        <div style="width: 30%;height: 100%;float: left;"><a style="color:#EB7350;font-size: 18px;text-decoration:none;" href="${ctx}/Index?userId=${list.user1.id}">${list.user1.username}</a></div>
                        <div style="width: 70%;height: 100%;float: left;">
                            <div  style="width: 85%;height: 100%;float: left;color: deepskyblue;font-size: 18px;">
                                <fmt:formatDate value="${list.replyTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
                            </div>
                            <div style="width: 15%;height: 100%;float: right;">
                                <li class="dropdown" style="float: right;margin-top: 10px;">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false" style="padding-bottom: 0px;padding-left: 0px;padding-top: 10px;">
                                        <p style="float: right;margin-right: 5px;">操作<span class="caret"></span></p>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">举报</a></li>
                                    </ul>
                                </li>
                                <c:if test="${list.type==1}"><span class="layui-badge-dot" style="float: right;margin-left: 1px;"></span></c:if>
                            </div>
                        </div>
                    </div>
                    <div style="width: 87%;height: 60%;float: left">
                        <a href="${ctx}/seeBlog?blogId=${list.blog.id}" style="font-size: 20px;text-decoration:none;float: left;margin-top: 5px;">${list.text}</a>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:forEach items="${commentList2}" var="list2">
            <div style="width: 95%;height: 80px;background-color: #FFFFFF;margin: auto;margin-top: 5px;">
                <div style="width: 95%;height: 80%;margin-left: 15px;float: left;margin-top: 8px;">
                    <div style="height: 100%;width: 12%;float: left;margin-right: 5px;">
                        <img src="${list2.user1.image}" alt="..." class="img-circle" style="width: 100%;height: 100%">
                    </div>
                    <div style="width: 87%;height: 40%;float: left">
                        <div style="width: 30%;height: 100%;float: left;"><a style="color:#EB7350;font-size: 18px;text-decoration:none;" href="${ctx}/Index?userId=${list2.user1.id}">${list2.user1.username}</a></div>
                        <div style="width: 70%;height: 100%;float: left;">
                            <div  style="width: 85%;height: 100%;float: left;color: deepskyblue;font-size: 18px;">
                                <fmt:formatDate value="${list2.replyTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
                            </div>
                            <div style="width: 15%;height: 100%;float: right;">
                                <li class="dropdown" style="float: right;margin-top: 10px;">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false" style="padding-bottom: 0px;padding-left: 0px;padding-top: 10px;">
                                        <p style="float: right;margin-right: 5px;">操作<span class="caret"></span></p>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">举报</a></li>
                                    </ul>
                                </li>
                                <c:if test="${list2.type==1}"><span class="layui-badge-dot" style="float: right;margin-left: 1px;"></span></c:if>
                            </div>
                        </div>
                    </div>
                    <div style="width: 87%;height: 60%;float: left">
                        <a href="${ctx}/seeBlog?blogId=${list2.blog.id}" style="font-size: 20px;text-decoration:none;float: left;margin-top: 5px;">${list2.text}</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>


</body>
<script src="${ctx}/static/js/jquery-3.3.1.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

    });
    layui.use('layer',function () {
        layer.photos({
            photos: '.layer-photos-demo'
            , anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
        });
    });
    $('#a').on('click', function(e) {
        e.preventDefault();
        $(this).closest('input[type=file]').trigger('click');
    })
    layui.use('layer',function () {
        var layer = layui.layer;
    });
</script>
</html>
