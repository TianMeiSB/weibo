<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台首页</title>
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <link rel="SHORTCUT ICON" href="${ctx}/images/logo/favicon.ico">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">帅鹏博客后台首页</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${user.image}" class="layui-nav-img">
                    ${user.username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/">前往首页</a></dd>
                    <dd><a href="${ctx}/user/myIndex">我的首页</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${ctx}/logout">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/findAllUser">用户列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">帖子管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/findAllBlog">帖子列表</a></dd>
                        <dd><a href="/admin/findAllPicture">图片管理</a></dd>
                        <dd><a href="j/admin/findAllComment">回复列表</a></dd>
                        <dd><a href="/admin/findAllComment2">回复列表</a></dd>
                    </dl>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div style="overflow: auto; height: 500px;width: 100%">
            <ol class="breadcrumb">
                <li><a href="${ctx}/admin">主页</a></li>
            </ol>
            <h1>帅鹏博客后台管理首页</h1>
            <h3>欢迎登录后台管理系统！</h3>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © bzerhia.cn
    </div>
</div>

</body>
<script src="${ctx}/static/js/jquery-3.3.1.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    layui.use('layer',function () {
        var layer = layui.layer;
    })
</script>
</html>