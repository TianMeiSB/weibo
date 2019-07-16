<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <title>修改博客</title>
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
</head>
<body style="background: #D3E2EE;">
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

<div style="width: 60%;height:90%;background-color: #F8F8F8;margin: auto;margin-top: 4%;">
    <form class="layui-form layui-form-pane" action="#" method="post">

        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" required="" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input layui-form-danger" id="title" maxlength="30" value="${blog.title}">
            </div>
        </div>
        <input type="hidden" value="${blog.id}" name="blogId" id="blogId"/>
        <div class="layui-form-item" >
            <label class="layui-form-label">类型</label>
            <div class="layui-input-block">
                <c:forEach items="${typeList}" var="list">
                    <input type="radio" name="type" value="${list.id}" title="${list.classification}" <c:if test="${list.id==blog.typeId}">checked=""</c:if> <c:if test="${list.id==1||list.id==2}">disabled=""</c:if> class="type">
                </c:forEach>
            </div>
        </div>
        <div class="layui-upload">
            <button type="button" class="layui-btn" id="test2">上传图片</button>
            <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                <div class="layui-upload-list" id="demo2"></div>
            </blockquote>
        </div>
        <div class="layui-form-item layui-form-text">
            <div class="layui-input-block">
                <textarea placeholder="请输入你想说的话" class="layui-textarea" id="text">${blog.text}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <input class="layui-btn" lay-submit="" lay-filter="formDemoPane" id="register" value="立即提交" type="button" style="float: right;margin-right: 30px;">
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
    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;
        //多图片上传
        upload.render({
            elem: '#test2'
            ,url: '${ctx}/weiBo?userId=${user.id}&blogId=${blog.id}'
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
        xmlhttp.open("POST","${ctx}/updateWeibo",true);
        //3、发送请求
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("title="+$("#title").val()+"&text="+$("#text").val()+"&typeId="+$("input[type='radio']:checked").val()+"&blogId="+$("#blogId").val());
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
                }else if(xmlhttp.responseText=='err3'){
                    layer.ready(function(){
                        layer.msg('发布失败，您已被禁言！');
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
