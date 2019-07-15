<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>帅鹏博客</title>
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
</head>

<style>

</style>
<body style="background-color: #EFEFEF;width: 98.5%;">
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
                            <li><a href="addweibo">微博</a></li>
                            <li><a href="addblog">博客</a></li>
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
                                <li><a href="backstage">后台管理</a></li>
                            </c:if>
                            <li><a href="/user/myIndex">我的主页</a></li>
                            <li><a href="/user/seeComment">
                                我的消息
                                <c:if test="${comments.size()!=0||comments2.size()!=0}">
                                    <span class="layui-badge">${comments.size()+comments2.size()}
                                    </span></c:if></a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="logout">退出登录</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

    <div class="row" style="margin-top: 65px;">
        <div class="col-sm-2">
            <div style="position: fixed;width: 15%;">
                <div class="list-group" >
                    <c:forEach items="${typeList}" var="type">
                        <button type="button" class="list-group-item <c:if test="${type.id==typeId}">active</c:if>" onclick="window.location.href='${ctx}/findByType?typeId=${type.id}'">${type.classification}</button>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="col-sm-7">

            <div class="layui-carousel" id="test1">
                <div carousel-item>
                    <div><img src="${ctx}/images/background/l1.jpg" alt="" style="width: 100%;height: 100%"></div>
                    <div><img src="${ctx}/images/background/l2.jpg" alt="" style="width: 100%;height: 100%"></div>
                    <div><img src="${ctx}/images/background/l3.jpg" alt="" style="width: 100%;height: 100%"></div>
                    <div><img src="${ctx}/images/fengmian/1.png" alt="" style="width: 100%;height: 100%"></div>
                </div>
            </div>

            <c:forEach items="${blogList}" var="blog">
                <div style="width: 100%;height: 100px;margin-top: 16px;border: 1px solid #d6d6d6;margin-bottom: 16px;background-color: aliceblue">

                    <div style="width: 20%;height: 100%;margin: 0;float: left;">
                        <div style="width: 96%;height: 94%;margin: 3px;">
                            <c:set value="${blog.picture}" var="picture"/>
                            <c:if test="${blog.titlePage!=null}">
                                <a href="${ctx}/seeBlog?blogId=${blog.id}"><img src="${blog.titlePage}" alt="这是缩略图" style="width: 100%;height:100%;border: 1px solid #9F9F9F"></a>
                            </c:if>
                            <c:if test="${blog.titlePage==null}">
                                <c:set value="${blog.picture}" var="picture2"/>
                                <c:if test="${picture2!=null}">
                                    <a href="${ctx}/seeBlog?blogId=${blog.id}"><img src="${picture[0].src}" alt="这是缩略图" style="width: 100%;height:100%;border: 1px solid #9F9F9F" id="1"></a>
                                </c:if>
                                <c:if test="${picture2==null}">
                                    <a href="${ctx}/seeBlog?blogId=${blog.id}" style="text-decoration:none;"><img src="images/fengmian/1.png" alt="" style="width: 100%;height: 100%;border: 1px solid #9F9F9F" id="2"></a>
                                </c:if>
                            </c:if>
                            <c:if test="${picture==null}">
                                <a href="${ctx}/seeBlog?blogId=${blog.id}"><img src="${ctx}/imgaes/fengmian/1.png" alt="这是缩略图" style="width: 100%;height:100%;border: 1px solid #9F9F9F"></a>
                            </c:if>

                        </div>
                    </div>
                    <div style="height:100%;width: 80%; float: left;margin: 0">
                        <div style="height: 50%;width: 100%">
                            <div style="width: 90%;height: 100%;float: left">
                                <a href="${ctx}/seeBlog?blogId=${blog.id}"><p style="font-size: 18px;float: left;margin-top: 10px;">${blog.title}</p></a>
                            </div>
                            <div  style="width: 10%;height: 100%;float: left">
                                <li class="dropdown" style="float: right;margin-top: 10px;">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false" style="padding-bottom: 0px;padding-left: 0px;padding-top: 10px;">
                                            <p style="float: right;margin-right: 5px;">操作<span class="caret"></span></p>

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
                            <div style="height: 100%;width: 50%;float: left;">
                                <div style="height: 100%;width: 15%;float: left;"><a href="/Index?userId=${blog.user.id}"><img src="${blog.user.image}" style="width: 100%;height:98%;border: 1px solid #9F9F9F;margin-bottom: 2px;float: left" class="img-circle"></a></div>
                                <div style="height: 100%;width: 25%;float: left;"><a href="/Index?userId=${blog.user.id}"><p style="font-size: 16px;color:#EB7350;float: left;margin-top: 16px;margin-left: 5px;">${blog.user.username}</p></a></div>
                                <div style="height: 100%;width: 60%;float: left;"><p style="font-size: 16px;color: deepskyblue;float: left;margin-top: 16px;"><fmt:formatDate value="${blog.publishTime}" pattern="yyyy-MM-dd hh:mm:ss"/></p></div>
                            </div>
                            <div style="height: 100%;width: 50%;float: right;">
                                <div style="height: 100%;width: 30%;float: right;"><a href="javascript:;" style="text-decoration:none;float: left;margin-top: 16px;margin-left: 20px;"><i class="layui-icon layui-icon-share"></i> 分享</a></div>
                                <div style="height: 100%;width: 30%;float: right;"><a href="${ctx}/seeBlog?blogId=${blog.id}" style="text-decoration:none;float: left;margin-top: 16px;margin-left: 20px;"><i class="layui-icon layui-icon-dialogue"></i> 评论</a></div>
                                <div style="height: 100%;width: 30%;float: right;"><a href="javascript:;" style="text-decoration:none;float: left;margin-top: 16px;margin-left: 20px;"><i class="layui-icon layui-icon-praise"></i> 点赞</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- Optional: clear the XS cols if their content doesn't match in height -->
        <div class="clearfix visible-xs-block"></div>
        <div class="col-sm-3">
            <c:if test="${empty user}">
                <div style="border: 1px solid #FFFFFF;background-color:#FFFFFF;width: 90%;height: 230px;margin-bottom: 20px;" id="a1">
                    <div style="width: 90%;height: 18%;text-align: center;margin: auto;">
                        <h3 style="margin-top: 8px;">用户登录</h3>
                    </div>
                    <div style="width: 100%;height: 82%;">
                        <form class="layui-form" action="#<%--login--%>" method="post" lay-filter="example">
                            <div class="layui-form-item" style="width: 90%;margin: auto;">
                                <input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input" id="username">
                            </div>
                            <div class="layui-form-item" style="width: 90%;margin: auto;margin-top: 10px;">
                                <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input" id="password">
                            </div>
                            <div class="layui-form-item" style="width: 90%;margin: auto;margin-top: 10px;">
                                    <input class="layui-btn" id="login" lay-submit="" lay-filter="demo1" style="width: 100%;" value="立即登陆" type="button">
                            </div>
                                <div class="layui-form-item" style="width: 90%;margin: auto;margin-top: 4px;">
                                    <p style="color:red;" id="errMsg"></p>
                                </div>
                            <div class="layui-form-item" style="width: 90%;margin: auto;margin-top: 4px;">
                                <h4>没有账号？<a href="/register" style="color: red">跳转注册！</a></h4>
                            </div>
                        </form>
                    </div>
                </div>
            </c:if>
            <div style="border: 1px solid #FFFFFF;width: 90%;min-height: 145px;margin-bottom: 20px;">
                <div style="width: 100%;min-height: 136px;">
                    <div style="width: 100%;height: 36px;background-color: #F8F8F8;margin-bottom: 2%;text-align: center;">
                        <p style="font-size: 20px;">新鲜事</p>
                    </div>

                    <c:forEach begin="0" end="3" var="i">
                        <c:set var="blogTime" value="${blogByTime[i]}" />
                        <div style="width: 100%;height: 84px;margin-top: 2%;border: 1px solid #d6d6d6;background-color:#F8F8F8;margin-bottom: 2% ">
                            <div style="width: 50%;height: 90%;float: left;margin: 4px;margin-right: 0px;">
                                <div style="width: 100%;height: 50%;"><a href="${ctx}/seeBlog?blogId=${blogTime.id}" style="text-decoration:none;">${blogTime.title}</a></div>
                                <div style="width: 100%;height: 50%;"><fmt:formatDate value="${blogTime.publishTime}" pattern="yyyy-MM-dd hh:mm:ss"/></div>
                            </div>

                            <div style="width: 45%;height: 90%;float: right;margin: 4px;margin-left: 0px;">
                                <c:if test="${blogTime.titlePage==null}">
                                    <c:set value="${blogTime.picture2}" var="picture2"/>
                                    <c:if test="${blogTime.picture2!=null}">
                                        <a href="${ctx}/seeBlog?blogId=${blogTime.id}" style="text-decoration:none;"><img src="${picture2.src}" alt="" style="width: 100%;height: 100%;border: 1px solid #9F9F9F"></a>
                                    </c:if>
                                    <c:if test="${blogTime.picture2==null}">
                                        <a href="${ctx}/seeBlog?blogId=${blogTime.id}" style="text-decoration:none;"><img src="images/fengmian/1.png" alt="" style="width: 100%;height: 100%;border: 1px solid #9F9F9F"></a>
                                    </c:if>
                                </c:if>
                                <c:if test="${blogTime.titlePage!=null}">
                                    <a href="${ctx}/seeBlog?blogId=${blogTime.id}" style="text-decoration:none;"><img src="${blogTime.titlePage}" alt="" style="width: 100%;height: 100%;border: 1px solid #9F9F9F"></a>
                                </c:if>

                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div style="width: 100%;height: 24px;text-align: center;border-top: 1px solid #FFFFFF;background-color: #F8F8F8;">
                    <a href="#" style="">查看更多<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
                </div>
            </div>
            <div style="border: 1px solid #FFFFFF;width: 90%;min-height: 145px;margin-bottom: 20px;">
                <div style="width: 100%;height: 36px;background-color: #F8F8F8;margin-bottom: 2%;text-align: center;">
                    <p style="font-size: 20px;">热门文章</p>
                </div>
                    <c:forEach begin="0" end="3" var="i">
                        <c:set var="blogType" value="${blogByType[i]}" />
                        <c:if test="${blogType.title!=null}">
                            <div style="width: 100%;height: 84px;background-color:#F8F8F8;margin-top: 2%;border: 1px solid #d6d6d6;">
                                <div style="width: 35%;height: 90%;float: left;margin: 4px;margin-right: 0px;">
                                    <c:set value="${blogType.picture}" var="picture"/>
                                    <c:if test="${blogType.titlePage!=null}">
                                        <a href="${ctx}/seeBlog?blogId=${blogType.id}"><img src="${blogType.titlePage}" alt="这是缩略图" style="width: 100%;height:100%;border: 1px solid #9F9F9F"></a>
                                    </c:if>
                                    <c:if test="${blog.titlePage==null}">
                                        <a href="${ctx}/seeBlog?blogId=${blogType.id}"><img src="${picture[0].src}" alt="这是缩略图" style="width: 100%;height:100%;border: 1px solid #9F9F9F"></a>
                                    </c:if>
                                    <c:if test="${picture==null}">
                                        <a href="${ctx}/seeBlog?blogId=${blogType.id}"><img src="${ctx}/imgaes/fengmian/1.png" alt="这是缩略图" style="width: 100%;height:100%;border: 1px solid #9F9F9F"></a>
                                    </c:if>
                                </div>

                                <div style="width: 60%;height: 90%;float: right;margin: 4px;margin-left: 0px;">
                                    <div style="width: 100%;height: 50%;"><a href="${ctx}/seeBlog?blogId=${blogType.id}" style="text-decoration:none;">${blogType.title}</a></div>
                                    <div style="width: 100%;height: 50%;"><fmt:formatDate value="${blogType.publishTime}" pattern="yyyy-MM-dd hh:mm:ss"/></div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                <div style="width: 100%;height: 24px;text-align: center;border-top: 1px solid #FFFFFF;background-color: #F8F8F8;margin-top: 2%;">
                    <a href="#" style="">查看更多<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
                </div>
            </div>
        </div>
    </div>

</body>
<script src="${ctx}/static/js/jquery-3.3.1.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>

    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
            // ,indicator:'none'
        });
    });
    layui.use('layer',function () {
        var layer = layui.layer;
    });
    var xmlhttp = new XMLHttpRequest();
    //给登录按钮绑定点击事件
    $("#login").click(function(){
        xmlhttp.open("POST","${ctx}/login",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("username="+$("#username").val()+"&password="+$("#password").val());
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    $("#errMsg").text("登录成功！");
                    window.setTimeout(index,1000);
                    function index() {
                        location.href="${ctx}/findByType?typeId=1";
                    }
                }else if(xmlhttp.responseText=='err1'){
                    $("#errMsg").text("登录失败！用户名或密码不能为空！");
                }else if(xmlhttp.responseText=='err2'){
                    $("#errMsg").text("登录失败！用户名或密码错误！");
                }else if(xmlhttp.responseText=='err3'){
                    $("#errMsg").text("用户名不存在！");
                } else if(xmlhttp.responseText=='err4'){
                    $("#errMsg").text("登录失败！您的账户已被封禁！");
                }else{
                    $("#errMsg").text("登录失败！请联系管理员！");
                }
            }
        }
    })
    $(function(){

        setInterval (showTime, 300000);
        function showTime(){
            aa();
        }
        function aa() {
            var masterId=${user.id}
            xmlhttp.open("POST","${ctx}/timing",true);
            xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlhttp.send("masterId="+masterId);
        }
    });

    function deleteBlog(obj) {
        var userId = obj.dataset.userid;
        var blogId = obj.dataset.blogid;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/deleteBlog",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("userId="+userId+"&blogId="+blogId);
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
