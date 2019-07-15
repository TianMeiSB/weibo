<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的收藏</title>
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
        <div style="margin-left: 25%;">
            <ul class="layui-tab-title">
                <li lay-id="22"><a href="/user/myIndex" style="text-decoration:none">我的主页</a></li>
                <li></li>
                <li lay-id="33"><a  style="text-decoration:none" href="/user/myAlbum">相册</a></li>
                <li></li>
                <li lay-id="44" class="layui-this"><a  style="text-decoration:none" href="/user/myCollect">收藏</a></li>
                <li></li>
                <li lay-id="55"><a  href="/user/myInformation" style="text-decoration:none">个人资料</a></li>
            </ul>
        </div>
    </div>

    <div style="width: 930px;margin: auto;height: 530px;background-color: #F8F8F8;overflow:auto">
        <c:forEach items="${collectList}" var="collect">
        <div style="width: 95%;height: 100px;margin-top: 8px;border: 1px solid #d6d6d6;margin-bottom: 8px;background-color: aliceblue;float: left;margin-left: 23px;">

            <div style="width: 20%;height: 100%;margin: 0;float: left;">
                <div style="width: 96%;height: 94%;margin: 3px;">
                    <c:set value="${collect.blog.picture}" var="picture"/>
                    <c:if test="${collect.blog.titlePage!=null}">
                        <a href="${ctx}/seeBlog?blogId=${collect.blog.id}"><img src="${collect.blog.titlePage}" alt="这是缩略图" style="width: 100%;height:100%;border: 1px solid #9F9F9F"></a>
                    </c:if>
                    <c:if test="${collect.blog.titlePage==null}">
                        <c:set value="${collect.blog.picture}" var="picture2"/>
                        <c:if test="${picture2!=null}">
                            <a href="${ctx}/seeBlog?blogId=${collect.blog.id}"><img src="${picture[0].src}" alt="这是缩略图" style="width: 100%;height:100%;border: 1px solid #9F9F9F" id="1"></a>
                        </c:if>
                        <c:if test="${picture2==null}">
                            <a href="${ctx}/seeBlog?blogId=${collect.blog.id}" style="text-decoration:none;"><img src="images/fengmian/1.png" alt="" style="width: 100%;height: 100%;border: 1px solid #9F9F9F" id="2"></a>
                        </c:if>
                    </c:if>
                    <c:if test="${picture==null}">
                        <a href="${ctx}/seeBlog?blogId=${collect.blog.id}"><img src="${ctx}/imgaes/fengmian/1.png" alt="这是缩略图" style="width: 100%;height:100%;border: 1px solid #9F9F9F"></a>
                    </c:if>
                </div>
            </div>
            <div style="height:100%;width: 80%; float: left;margin: 0">
                <div style="height: 50%;width: 100%">
                    <div style="width: 90%;height: 100%;float: left">
                        <a href="${ctx}/seeBlog?blogId=${collect.blog.id}"><p style="font-size: 18px;float: left;margin-top: 10px;">${collect.blog.title}</p></a>
                    </div>
                    <div  style="width: 10%;height: 100%;float: left">
                        <li class="dropdown" style="float: right;margin-top: 10px;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false" style="padding-bottom: 0px;padding-left: 0px;padding-top: 10px;">
                                <p style="float: right;margin-right: 5px;">操作<span class="caret"></span></p>

                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="javascript:;" data-userid="${user.id}" data-blogid="${collect.blog.id}" onclick="shoucang(this)">取消收藏</a></li>
                            </ul>
                        </li>
                    </div>
                </div>
                <div style="height: 50%;width: 100%">
                    <div style="height: 100%;width: 50%;float: left;">
                        <div style="height: 100%;width: 15%;float: left;"><a href="/Index?userId=${collect.blog.user.id}"><img src="${collect.blog.user.image}" style="width: 100%;height:98%;border: 1px solid #9F9F9F;margin-bottom: 2px;float: left" class="img-circle"></a></div>
                        <div style="height: 100%;width: 25%;float: left;"><a href="/Index?userId=${collect.blog.user.id}"><p style="font-size: 16px;color:#EB7350;float: left;margin-top: 16px;margin-left: 5px;">${collect.blog.user.username}</p></a></div>
                        <div style="height: 100%;width: 60%;float: left;"><p style="font-size: 16px;color: deepskyblue;float: left;margin-top: 16px;"><fmt:formatDate value="${collect.blog.publishTime}" pattern="yyyy-MM-dd hh:mm:ss"/></p></div>
                    </div>
                    <div style="height: 100%;width: 50%;float: right;">
                        <div style="height: 100%;width: 30%;float: right;"><a href="javascript:;" style="text-decoration:none;float: left;margin-top: 16px;margin-left: 20px;"><i class="layui-icon layui-icon-share"></i> 分享</a></div>
                        <div style="height: 100%;width: 30%;float: right;"><a href="${ctx}/seeBlog?blogId=${collect.blog.id}" style="text-decoration:none;float: left;margin-top: 16px;margin-left: 20px;"><i class="layui-icon layui-icon-dialogue"></i> 评论</a></div>
                        <div style="height: 100%;width: 30%;float: right;"><a href="javascript:;" style="text-decoration:none;float: left;margin-top: 16px;margin-left: 20px;"><i class="layui-icon layui-icon-praise"></i> 点赞</a></div>
                    </div>
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
            photos: '#layer-photos-demo'
            , anim: 2 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
        });
    });
    $('#a').on('click', function(e) {
        e.preventDefault();
        $(this).closest('input[type=file]').trigger('click');
    });
    layui.use('flow', function(){
        var flow = layui.flow;
        //当你执行这样一个方法时，即对页面中的全部带有lay-src的img元素开启了懒加载（当然你也可以指定相关img）
        flow.load({
            elem:'.layer-photos-demo'
        });
        flow.lazyimg();
    });
    layui.use('layer',function () {
        var layer = layui.layer;
    });
    function shoucang(obj){
        var userId = obj.dataset.userid;
        var blogId = obj.dataset.blogid;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/addCollection",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("blogId="+blogId+"&userId="+userId);
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok1'){
                    layer.ready(function(){
                        layer.msg('收藏成功！');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='err'){
                    layer.ready(function(){
                        layer.msg('收藏失败，需要登陆才能收藏哦！');
                    });
                }else if(xmlhttp.responseText=='ok2'){
                    layer.ready(function(){
                        layer.msg('取消收藏成功！');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='err1'){
                    layer.ready(function(){
                        layer.msg('收藏失败');
                    });
                }else if(xmlhttp.responseText=='err2'){
                    layer.ready(function(){
                        layer.msg('取消收藏失败');
                    });
                }
            }
        }
    }
</script>
</html>
