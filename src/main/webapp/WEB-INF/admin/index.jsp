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
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/logout">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/findAllUser">用户列表</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">帖子管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">帖子列表</a></dd>
                        <dd><a href="javascript:;">图片管理</a></dd>
                        <dd><a href="javascript:;">回复列表</a></dd>
                    </dl>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <c:if test="${userList!=null}">
        <table class="table table-bordered">
            <tr><th>头像</th><th>ID</th><th>用户名</th><th>状态</th><th>性别</th><th>手机号</th><th>地址</th><th>注册时间</th><th>个性签名</th><th>操作</th></tr>
            <c:forEach items="${userList}" var="user">
            <tr><td><img src="${user.image}" style="width: 40px;height: 40px;"></td>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>
                    <c:if test="${user.type==0}">正常</c:if>
                    <c:if test="${user.type==2}">禁言中</c:if>
                    <c:if test="${user.type==3}">已封号</c:if>
                </td>
                <td>${user.sex}</td>
                <td>${user.phone}</td>
                <td>${user.address}</td>
                <td><fmt:formatDate value="${user.registerTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
                <td>${user.introduce}</td>
                <td>
                    <c:if test="${user.type==2}"><button name="${user.id}" type="button" class="layui-btn layui-btn-xs layui-btn-warm" onclick="jiechu(userId=this.name);" >解禁</button></c:if>
                    <c:if test="${user.type!=2}"><button name="${user.id}" type="button" class="layui-btn layui-btn-xs layui-btn-warm" onclick="jinyan(userId=this.name);" >禁言</button></c:if>
                    <c:if test="${user.type==3}"><button name="${user.id}" type="button" class="layui-btn layui-btn-xs layui-btn-normal" style="margin-left: 0px;" onclick="jiechu(userId=this.name);">解封</button><br></c:if>
                    <c:if test="${user.type!=3}"><button name="${user.id}" type="button" class="layui-btn layui-btn-xs layui-btn-normal" style="margin-left: 0px;" onclick="fenghao(userId=this.name);">封号</button><br></c:if>
                    <a href="javascript:;" type="button" class="layui-btn layui-btn-xs" style="margin-left: 0px;margin-top: 2px">修改</a>
                </td>
            </tr>
            </c:forEach>
        </table>
        </c:if>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
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
    function jinyan(userId) {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/updateType",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("type="+2+"&userId="+userId);
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    layer.ready(function(){
                        layer.msg('已禁言！');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='error'){
                    layer.ready(function(){
                        layer.msg('禁言失败！');
                    });
                }
            }
        }
    }
    function fenghao(userId) {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/updateType",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("type="+3+"&userId="+userId);
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    layer.ready(function(){
                        layer.msg('已封号！');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='error'){
                    layer.ready(function(){
                        layer.msg('封号失败！');
                    });
                }
            }
        }
    }
    
    function jiechu(userId) {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/updateType",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("type="+0+"&userId="+userId);
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    layer.ready(function(){
                        layer.msg('已成功解除处罚');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='error'){
                    layer.ready(function(){
                        layer.msg('解除失败');
                    });
                }
            }
        }
    }
</script>
</html>