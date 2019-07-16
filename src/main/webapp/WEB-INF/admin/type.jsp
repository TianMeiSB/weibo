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
    <link rel="SHORTCUT ICON" href="${ctx}/images/logo/favicon.ico">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">帅鹏博客后台首页</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <div style="width: 350px;height: 100%;float: right;margin-right: 250px;">
            <input type="text" name="title" autocomplete="off" placeholder="添加类型" class="layui-input" style="width: 79%;margin-top: 10px;float: left;" id="type">
            <input class="layui-btn" style="width: 20%;margin-top: 10px;float: left;" value="添加" type="button" id="button">
        </div>
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
                        <dd><a href="/admin/findAllComment">回复列表</a></dd>
                        <dd><a href="/admin/findAllComment2">回复列表</a></dd>
                        <dd class="layui-this"><a href="/admin/findAllType">类型管理</a></dd>
                    </dl>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <table class="table table-bordered">
            <tr><th>ID</th><th>类型</th><th>管理</th></tr>
            <c:forEach items="${typeList}" var="list">
                    <tr>
                        <td>${list.id}</td>
                        <td>${list.classification}</td>
                        <td><input type="button" class="layui-btn layui-btn-danger layui-btn-xs" value="删除" onclick="shanchu(this);" data-typeid="${list.id}"></td>
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
        var typeId = obj.dataset.typeid;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/admin/deleteType",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("typeId="+typeId);
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok2'){
                    layer.ready(function(){
                        layer.msg('已删除！');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='error2'){
                    layer.ready(function(){
                        layer.msg('删除失败！');
                    });
                }
            }
        }
    }
    $("#button").click(function () {
        var type = $("#type").val();
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/admin/addType",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("type="+type);
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok1'){
                    layer.ready(function(){
                        layer.msg('添加成功！');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='err'){
                    layer.ready(function(){
                        layer.msg('添加失败！类型不能为空！');
                    });
                }else if(xmlhttp.responseText=='err1'){
                    layer.ready(function(){
                        layer.msg('添加失败！');
                    });
                }
            }
        }
    })
</script>
</html>