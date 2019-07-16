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
<body>
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
            <form class="navbar-form navbar-left" action="/findByLike" method="get">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="全站搜索" value="${like}" name="like">
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

    <div style="width: 90%;min-height: 140px;margin: auto;margin-top: 60px;">
        <h3 style="color: deepskyblue;float: left;margin-top: 3px;margin-left: 25px;">帖子</h3>
        <hr/>
    <c:forEach items="${blogList}" var="blog">
        <div style="width: 39%;height: 100px;border: 1px solid #d6d6d6;float: left;margin-left: 60px;margin-right: 60px;margin-top: 10px;margin-bottom: 10px;">
            <div style="width: 30%;height: 100%;margin: 0;float: left;">
                <div style="width: 96%;height: 94%;margin: 3px;">
                    <c:set value="${blog.picture}" var="picture"/>
                    <c:if test="${blog.titlePage!=null}">
                        <a href="${ctx}/seeBlog?blogId=${blog.id}"><img src="${blog.titlePage}" alt="这是缩略图" style="width: 100%;height:100%;border: 1px solid #9F9F9F"></a>
                    </c:if>
                    <c:if test="${blog.titlePage==null}">
                        <c:set value="${blog.picture}" var="picture2"/>
                        <c:if test="${picture2.size()>0}">
                            <a href="${ctx}/seeBlog?blogId=${blog.id}"><img src="${picture[0].src}" alt="这是缩略图" style="width: 100%;height:100%;border: 1px solid #9F9F9F" id="1"></a>
                        </c:if>
                        <c:if test="${picture2.size()==0}">
                            <a href="${ctx}/seeBlog?blogId=${blog.id}" style="text-decoration:none;"><img src="${ctx}/images/fengmian/1.png" alt="" style="width: 100%;height: 100%;border: 1px solid #9F9F9F" id="2"></a>
                        </c:if>
                    </c:if>
                    <c:if test="${picture==null}">
                        <a href="${ctx}/seeBlog?blogId=${blog.id}"><img src="${ctx}/imgaes/fengmian/1.png" alt="这是缩略图" style="width: 100%;height:100%;border: 1px solid #9F9F9F"></a>
                    </c:if>

                </div>
            </div>
            <div style="height:100%;width: 70%; float: left;margin: 0">
                <div style="height: 50%;width: 100%">
                    <div style="width: 88%;height: 100%;float: left">
                        <a href="${ctx}/seeBlog?blogId=${blog.id}"><p style="font-size: 18px;float: left;margin-top: 10px;">${blog.title}</p></a>
                    </div>
                    <div  style="width: 12%;height: 100%;float: left">
                        <li class="dropdown" style="float: right;margin-top: 10px;">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                               aria-expanded="false" style="padding-bottom: 0px;padding-left: 0px;padding-top: 10px;">
                                <p style="float: right;">操作<span class="caret"></span></p>

                            </a>
                            <ul class="dropdown-menu">
                                <c:if test="${user.id==blog.user.id||user.type==1}">
                                    <li><a href="/updateblog?blogId=${blog.id}">编辑</a></li>
                                    <li><a href="javascript:;" data-userid="${user.id}" data-blogid="${blog.id}" onclick="deleteBlog(this);">删除</a></li>
                                </c:if>
                                <c:if test="${user.id!=blog.user.id}">
                                    <li><a href="#">举报</a></li>
                                </c:if>
                            </ul>
                        </li>
                    </div>
                </div>
                <div style="height: 50%;width: 100%">
                    <div style="height: 100%;width:100%;float: left;">
                        <div style="height: 47px;width: 47px;float: left;"><a href="/Index?userId=${blog.user.id}"><img src="${blog.user.image}" style="width: 100%;height:98%;border: 1px solid #9F9F9F;margin-bottom: 2px;float: left" class="img-circle"></a></div>
                        <div style="height: 100%;width: 25%;float: left;"><a href="/Index?userId=${blog.user.id}"><p style="font-size: 16px;color:#EB7350;float: left;margin-top: 16px;margin-left: 5px;">${blog.user.username}</p></a></div>
                        <div style="height: 100%;width: 60%;float: left;"><p style="font-size: 16px;color: deepskyblue;float: left;margin-top: 16px;"><fmt:formatDate value="${blog.publishTime}" pattern="yyyy-MM-dd hh:mm:ss"/></p></div>
                    </div>
                </div>
            </div>

        </div>
    </c:forEach>
    </div>

    <div style="width: 90%;min-height: 240px;float: left;margin-left: 67.453px;">
        <h3 style="color: deepskyblue;float: left;margin-top: 3px;margin-left: 25px;">用户</h3>
        <hr/>
        <c:forEach items="${userList}" var="user1">
            <div style="width: 30%;min-height: 10%;margin-top: 10px;float: left;margin-left: 24px;">
                <div style="width: 58px;height: 58px;float: left;">
                    <a href="/Index?userId=${user1.id}"><img src="${user1.image}" alt="" class="img-circle" style="width: 100%;height: 100%"></a>
                </div>
                <div style="width: 80%;min-height: 60px;float: right;">
                    <div style="width: 100%;min-height: 24px;">
                        <a href="/Index?userId=${user1.id}"><p style="color: #EB7350;font-size: 18px;float: left;margin-top: 2px;">${user1.username}</p></a>
                    </div>
                    <div style="width: 100%;min-height: 36px;white-space:normal">
                        <p style="color: #3c9cea;float: left;margin-top: 5px;white-space:normal">${user1.introduce}</p>
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

</script>
</html>
