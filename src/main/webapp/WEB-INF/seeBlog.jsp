<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <title>发表博客</title>
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
</head>
<body style="background:#F8F8F8">
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
<div style="width: 700px;height:91%;background-color: #F8F8F8;margin: auto;margin-top: 4%;">

        <div style="width: 99%;height: 400px;background-color: #FFFFFF;margin: 3px;margin-top: 10px;margin-bottom: 0;">
            <div style="width: 70px;height: 70px;margin-left: 1%;margin-top: 2%;float: left;">
                <img src="${blog.user.image}" alt="..." class="img-circle" style="width: 100%;height:100%;border: 1px solid #9F9F9F">
            </div>
            <div style="width: 79%;height: 93%;float: left;margin-left: 1%;margin-top: 2%;">
                <div style="width: 100%;height: 35%;">
                    <div style="width: 100%;height: 40%;">
                        <p>${blog.user.username}</p>
                        <p><fmt:formatDate value="${blog.publishTime}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
                        <div style="float: left"><c:if test="${blog.blogType==0}"><a href="#">#微博#</a></c:if><c:if test="${blog.blogType==1}"><a href="#">#博客#</a></c:if></div><p  style="float: left;font-size: 14px">&nbsp;${blog.title}</p>
                    </div>
                    <div style="width: 100%;height: 60%;font-size: 18px;word-wrap:break-word;">${blog.text}</div>
                </div>
                <div style="width: 450px;height: 100px;overflow :hidden;">
                    <div  class="layer-photos-demo">
                        <c:set value="${blog.picture}" var="picture"/>
                        <c:if test="${blog.blogType==0}">
                            <c:forEach items="${picture}" var="picture2">
                                <img layer-pid="" layer-src="${picture2.src}" src="${picture2.src}"  style="width: 130px;height: 100px; margin-right: 15px;">
                            </c:forEach>
                        </c:if>

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
        <div style="width: 99%;height: 45px;margin: 3px;margin-top: 0;">
            <div style="width: 25%;height: 100%;float: left;text-align: center;border: 1px solid #DDDDDD;border-right: none;"><div style="margin-top: 7%;"><a href="#" style="text-decoration:none">推广</a></div></div>
            <div style="width: 25%;height: 100%;float: left;text-align: center;border: 1px solid #DDDDDD;border-right: none;"><div style="margin-top: 7%;"><a href="#" style="text-decoration:none"><i class="layui-icon layui-icon-share"></i> 分享</a></div></div>
            <c:set value="${blog.comment}" var="comm"/>
            <div style="width: 25%;height: 100%;float: left;text-align: center;border: 1px solid #DDDDDD;border-right: none;"><div style="margin-top: 7%;"><a href="#" style="text-decoration:none"><i class="layui-icon layui-icon-dialogue"></i>${comm.size()}</a></div></div>
            <div style="width: 25%;height: 100%;float: left;text-align: center;border: 1px solid #DDDDDD"><div style="margin-top: 7%;"><a href="#" style="text-decoration:none"><i class="layui-icon layui-icon-praise"></i> 点赞</a></div></div>
        </div>

    <c:forEach items="${comm}" var="comment">
        ${comment.text}
    </c:forEach>
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
    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;
        //多图片上传
        upload.render({
            elem: '#test2'
            ,url: '${ctx}/upload'
            ,multiple: true
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="width: 70px;height: 70px;margin-left: 10px;">')
                });
            }
            ,done: function(res){
                //上传完毕
            }
        });
    });

    $("#register").click(function(){
        //利用ajax进行登录请求
        //1、创建XMLHttpRequest 对象
        var xmlhttp = new XMLHttpRequest();
        //2、建立请求
        xmlhttp.open("POST","${ctx}/addWeibo",true);
        //3、发送请求
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("title="+$("#title").val()+"&text="+$("#text").val()+"&type="+$(".type").val()+"&userId="+$("#userId").val());
        //4、处理响应
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    layer.ready(function(){
                        layer.msg('发布成功！');
                    });
                    window.setTimeout(index,3000);
                    function index() {
                        location.href="${ctx}/index";
                    }
                }else if(xmlhttp.responseText=='err1'){
                    layer.ready(function(){
                        layer.msg('发布失败，请填写完整内容！');
                    });
                }else if(xmlhttp.responseText=='err2'){
                    layer.ready(function(){
                        layer.msg('发布失败，请联系管理员！');
                    });
                }else{
                    layer.ready(function(){
                        layer.msg('发布失败，请联系管理员！');
                    });
                }
            }
        }
    })
</script>
</html>
