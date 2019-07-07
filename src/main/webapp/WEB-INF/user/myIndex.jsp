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
                <a class="navbar-brand" href="#" style="text-decoration:none">帅鹏博客</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#" style="text-decoration:none">首页 <span class="sr-only">(current)</span></a></li>
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
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="全站搜索">
                    </div>
                    <button type="submit" class="btn btn-default">GO</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#" style="text-decoration:none">关于本站</a></li>
                    <c:if test="${not empty user}">

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false" style="padding-bottom: 0px;padding-left: 0px;padding-top: 10px;">
                                <img src="${user.image}" alt="头像" class="img-circle"  style="width: 30px;height: 30px;">
                                    ${user.username}<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <c:if test="${user.type==1}">
                                    <li><a href="/backstage">后台管理</a></li>
                                </c:if>
                                <li><a href="/user/myIndex">我的主页</a></li>
                                <li><a href="#">我的消息</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="/logout">退出登录</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <div style="width: 930px;height: 290px;background-color: aliceblue;margin: auto;margin: auto;margin-top: 7%;text-align: center;background-image: url(${ctx}/static/images/background/22.png);background-size:100% 100%;">
        <div style="margin-left: 45%;margin-right: 45%;margin-top: 6%;float: left;">
            <p style="width:100px;height: 100px">
                <a href="#" id="a">
                    <input type="file" name="image" class="hidden" value="" style="display:none;"/>
                    <img src="${user.image}" alt="..." class="img-circle" style="width: 100%;height: 100%;border: 1px solid #9F9F9F">
                </a>
            </p>
        </div>
        <p style="font-size: 28px;">${user.username}</p>
        <p>${user.introduce}</p>
    </div>
    <div class="layui-tab" lay-filter="test" style="width: 930px; margin: auto;background-color: #F8F8F8; margin-bottom: 1%;">
        <div style="margin-left: 32%;">
                <ul class="layui-tab-title">
                    <li lay-id="22" class="layui-this"><a href="/user/myIndex" style="text-decoration:none">我的主页</a></li>
                    <li></li>
                    <li lay-id="33"><a  style="text-decoration:none" href="/user/myAlbum">相册</a></li>
                    <li></li>
                    <li lay-id="44"><a  href="/user/myInformation" style="text-decoration:none">个人资料</a></li>
                </ul>
        </div>
    </div>

    <div style="width: 930px;margin: auto;">
        <div style="width: 33%;height: 100%;float: left;">
            <div style="width: 98%;height: 66px;margin: 3px;background-color: #F8F8F8;">
                <div style="width: 33%;height: 100%;text-align: center;float: left;border-right: 1px solid #DDDDDD"><div STYLE="margin-top: 12%"><a href="#" style="text-decoration:none">1111</a><p>关注</p></div></div>
                <div style="width: 34%;height: 100%;text-align: center;float: left;border-right: 1px solid #DDDDDD"><div STYLE="margin-top: 12%"><a href="#" style="text-decoration:none">1111</a><p>粉丝</p></div></div>
                <div style="width: 33%;height: 100%;text-align: center;float: left;"><div STYLE="margin-top: 12%"><a href="#" style="text-decoration:none">1111</a><p>微博</p></div></div>
            </div>

            <div style="width: 98%;height: 230px;margin: 3px;background-color: #F8F8F8;margin-top: 10px">
                <div style="width: 100%;height: 70%;border-bottom: 1px solid #DDDDDD">
                    <table class="table">
                        <tr><td>用户名</td><td>${user.username}</td></tr>
                        <tr><td>性别</td><td>${user.sex}</td></tr>
                        <tr> <td>地址</td><td>${user.address}</td></tr>
                        <tr><td>注册时间</td><td><fmt:formatDate value="${user.registerTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td></tr>
                    </table>
                </div>
                <div style="width: 100%;height: 30%;">
                    <div style="margin-top: 7%;float: left;text-align: center;width: 100%;">
                        <a href="/user/myInformation" style="">前往修改<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
                    </div>
                </div>
            </div>
        </div>

        <div style="width: 65%;height: 100%;float:right;">
            <div style="width: 99%;height:50px;background-color: #F8F8F8;margin: 3px;">
                <div style="float: left;height: 100%;margin: 5px;">
                    <ul class="layui-tab-title">
                        <li class="layui-this" lay-id="22">全部</li>
                        <li lay-id="33">时间</li>
                    </ul>
                </div>
                <div style="float: right;">
                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="搜索我的微博">
                        </div>
                        <button type="submit" class="btn btn-default">GO</button>
                    </form>
                </div>
            </div>

            <div style="width: 99%;height: 200px;background-color: #FFFFFF;margin: 3px;margin-top: 10px;margin-bottom: 0;">
                <div style="width: 10%;height: 50%;margin-left: 1%;margin-top: 2%;float: left;">
                    <img src="/static/images/touxiang/1.jpg" alt="..." class="img-circle" style="width: 100%;border: 1px solid #9F9F9F">
                </div>
                <div style="width: 80%;height: 93%;float: left;margin-left: 1%;margin-top: 2%;">
                    <div style="width: 100%;height: 35%;">
                        <p>admin</p>
                        <p>6月21日 15:33</p>
                        <p>测试测试测试测试测试</p>
                    </div>
                    <div style="width: 450px;height: 100px;overflow :hidden">
                        <div id="layer-photos-demo" class="layer-photos-demo">
                            <img layer-pid="" layer-src="/static/images/1.jpg" src="/static/images/1.jpg"  style="width: 130px;height: 100px; margin-right: 15px;">
                            <img layer-pid="" layer-src="/static/images/2.png" src="/static/images/2.png"  style="width: 130px;height: 100px; margin-right: 15px;">
                            <img layer-pid="" layer-src="/static/images/3.jpg" src="/static/images/3.jpg"  style="width: 130px;height: 100px; margin-right: 15px;">
                            <img layer-pid="" layer-src="/static/images/2.png" src="/static/images/2.png"  style="width: 130px;height: 100px; margin-right: 15px;">
                            <img layer-pid="" layer-src="/static/images/2.png" src="/static/images/2.png"  style="width: 130px;height: 100px; margin-right: 15px;">
                            <img layer-pid="" layer-src="/static/images/2.png" src="/static/images/2.png"  style="width: 130px;height: 100px; margin-right: 15px;">
                            <img layer-pid="" layer-src="/static/images/2.png" src="/static/images/2.png"  style="width: 130px;height: 100px; margin-right: 15px;">
                        </div>

                    </div>

                </div>
                <div style="width: 8%;height: 93%;margin-top: 2%;float: left;">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">操作<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">修改</a></li>
                            <li><a href="#">删除</a></li>
                        </ul>
                    </li>
                </div>
            </div>
            <div style="width: 99%;height: 45px;background-color: #FFFFFF;margin: 3px;margin-top: 0;">
                <div style="width: 25%;height: 100%;float: left;text-align: center;border: 1px solid #DDDDDD;border-right: none;"><div style="margin-top: 7%;"><a href="#" style="text-decoration:none">推广</a></div></div>
                <div style="width: 25%;height: 100%;float: left;text-align: center;border: 1px solid #DDDDDD;border-right: none;"><div style="margin-top: 7%;"><a href="#" style="text-decoration:none"><i class="layui-icon layui-icon-share"></i> 分享</a></div></div>
                <div style="width: 25%;height: 100%;float: left;text-align: center;border: 1px solid #DDDDDD;border-right: none;"><div style="margin-top: 7%;"><a href="#" style="text-decoration:none"><i class="layui-icon layui-icon-dialogue"></i> 评论</a></div></div>
                <div style="width: 25%;height: 100%;float: left;text-align: center;border: 1px solid #DDDDDD"><div style="margin-top: 7%;"><a href="#" style="text-decoration:none"><i class="layui-icon layui-icon-praise"></i> 点赞</a></div></div>
            </div>
        </div>
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
            photos: '#layer-photos-demo'
            , anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
        });
    });
    $('#a').on('click', function(e) {
        e.preventDefault();
        $(this).closest('input[type=file]').trigger('click');
    })
</script>
</html>
