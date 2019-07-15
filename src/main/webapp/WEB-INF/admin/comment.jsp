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
            <li class="layui-nav-item"><a href="/logout">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd ><a href="/admin/findAllUser">用户列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">帖子管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/findAllBlog">帖子列表</a></dd>
                        <dd><a href="/admin/findAllPicture">图片管理</a></dd>
                        <dd  class="layui-this"><a href="/admin/findAllComment">回复列表</a></dd>
                        <dd><a href="/admin/findAllComment2">回复列表</a></dd>
                    </dl>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <table class="table table-bordered">
            <tr><th>ID</th><th>评论详情</th><th>所属用户</th><th>所属帖子</th><th>操作</th></tr>
            <c:forEach items="${commentList}" var="list">
                    <tr>
                        <td>${list.id}</td>
                        <td>${list.text}</td>
                        <td>${list.user1.username}</td>
                        <td>${list.blog.title}</td>
                        <td>
                            <a type="button" class="btn btn-default btn-xs" href="javascript:;" data-userid="${list.user1.id}" data-commentid="${list.id}" onclick="shanchu(this);">删除</a>
                        </td>
                    </tr>
            </c:forEach>
        </table>
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


    function shanchu(obj) {
        var userId = obj.dataset.userid;
        var commentId = obj.dataset.commentid;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/deleteComment",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("userId="+userId+"&commentId="+commentId);
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    layer.ready(function(){
                        layer.msg('已删除！');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='err'){
                    layer.ready(function(){
                        layer.msg('删除失败！');
                    });
                }
            }
        }
    }
</script>
</html>