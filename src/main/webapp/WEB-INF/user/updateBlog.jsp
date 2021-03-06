<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"  language="java"  isELIgnored="false" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <title>修改博客</title>
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
    <link rel="SHORTCUT ICON" href="${ctx}/images/logo/favicon.ico">
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

<div style="width: 810px;height:620px;background-color: #F8F8F8;margin: auto;margin-top: 4%;">
    <form class="layui-form" action="#<%--register--%>" method="post" lay-filter="example" style="margin-top: 30px;" enctype="multipart/form-data">
        <input type="hidden" value="${user.id}" id="userId"/>
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-block" id="type">
                <input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" style="width: 50%" id="title" maxlength="30" value="${blog.title}">
            </div>
        </div>
        <div class="layui-upload" style="width: 100%;height: 100px;">
            <button type="button" class="layui-btn" id="test1" style="float: left;margin-top: 30px;">&nbsp;&nbsp;&nbsp;&nbsp;封面&nbsp;&nbsp;&nbsp;&nbsp;</button>
            <input class="layui-upload-file" type="file" accept="" name="file">
            <div class="layui-upload-list" style="float: left;width: 120px;height: 80px;border: 2px solid #8c8c8c;margin-left: 20px;">
                <img class="layui-upload-img" id="demo1" style="width: 100%;height: 100%;">
                <p id="demoText"></p>
            </div>
        </div>

        <div class="layui-form-item" >
            <label class="layui-form-label">类型</label>
            <div class="layui-input-block">
                <c:forEach items="${typeList}" var="list">
                    <input type="radio" name="type" value="${list.id}" <c:if test="${list.id==blog.typeId}">checked=""</c:if> <c:if test="${list.id==1||list.id==2}">disabled=""</c:if> title="${list.classification}">
                </c:forEach>
            </div>
        </div>
        <div id="editor"></div>
        <textarea id="demo" style="display: none;" class="text" lay-verify="content"></textarea>

        <div class="layui-form-item" style="margin-right: 21px;">
            <div class="layui-input-block" style="margin: 0;float: right">
                <input class="layui-btn" lay-submit lay-filter="formDemo" value="提交" id="addBlog" type="button">
            </div>
        </div>
    </form>

</div>
</body>
<script src="${ctx}/static/js/jquery-3.3.1.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    var content;


    layui.use('layedit', function(){
        var layedit = layui.layedit;
        layedit.set({
            uploadImage: {
                url: '${ctx}/picture' //接口url
                ,type: 'post' //默认post
            }
        });
        build = layedit.build('demo'); //建立编辑器
        layedit.setContent(build,'${blog.text}');
    });

    <%--$("#demo").text('${blog.text}');--%>
    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: '${ctx}/blog?blogId=${blog.id}'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    });

    var text2 ;
        $("#addBlog").click(function(){
        layui.use('layedit',function () {
            var layedit = layui.layedit;
            text2 = layedit.getContent(build);
        })
        var xmlhttp = new XMLHttpRequest();
        //2、建立请求
        xmlhttp.open("POST","${ctx}/updateBlog",true);
        //3、发送请求
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("title="+$("#title").val()+"&text="+text2+"&blogId=${blog.id}&typeId="+$("input[type='radio']:checked").val());
        //4、处理响应
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    layer.ready(function(){
                        layer.msg('修改成功！');
                    });
                    window.setTimeout(index,3000);
                    function index() {
                        location.href="${ctx}/";
                    }
                }else if(xmlhttp.responseText=='err1'){
                    layer.ready(function(){
                        layer.msg('修改失败，请编辑完整内容！');
                    });
                }else if(xmlhttp.responseText=='err2'){
                    layer.ready(function(){
                        layer.msg('修改失败，请点击保存再发布！');
                    });
                }else if(xmlhttp.responseText=='err3'){
                    layer.ready(function(){
                        layer.msg('修改失败，请编辑完整内容！');
                    });
                }else if(xmlhttp.responseText=='err4'){
                    layer.ready(function(){
                        layer.msg('修改失败，您已被禁言！');
                    });
                }else{
                    layer.ready(function(){
                        layer.msg('修改失败，请联系管理员！');
                    });
                }
            }
        }
    })
</script>
</html>
