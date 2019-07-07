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

<style>
   #a1{

    }
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
                                <li><a href="backstage">后台管理</a></li>
                            </c:if>
                            <li><a href="user/myIndex">我的主页</a></li>
                            <li><a href="#">我的消息</a></li>
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
                    <button type="button" class="list-group-item">热门</button>
                    <button type="button" class="list-group-item">头条</button>
                    <button type="button" class="list-group-item">新鲜事</button>
                    <button type="button" class="list-group-item">搞笑</button>
                    <button type="button" class="list-group-item">社会</button>
                    <button type="button" class="list-group-item">时尚</button>
                    <button type="button" class="list-group-item">电影</button>
                    <button type="button" class="list-group-item">美女</button>
                    <button type="button" class="list-group-item">体育</button>
                    <button type="button" class="list-group-item">动漫</button>
                </div>
            </div>
        </div>

        <div class="col-sm-7">

            <div class="layui-carousel" id="test1">
                <div carousel-item>
                    <div>条目1</div>
                    <div>条目2</div>
                    <div>条目3</div>
                    <div>条目4</div>
                    <div>条目5</div>
                    <div>条目6</div>
                </div>
            </div>

            <div style="background-color: #00FF00;width: 100%;height: 100px;margin-top: 16px;border: 1px solid #F8F8F8;">
                <div style="background-color: #0000FF;width: 20%;height: 100%;margin: 0;float: left;">
                    <img src="#" alt="这是缩略图">
                </div>

                <div style="background-color: #a96297;height:100%;width: 80%; float: left;margin: 0">
                    <div style="background-color: #00FF00;height: 50%;width: 100%">
                        这里是标题
                    </div>
                    <div style="background-color: #00F7DE;height: 50%;width: 100%">
                        <div style="background-color: #9acfea;height: 100%;width: 50%;float: left;">
                            <div style="background-color: #8fff5f;height: 100%;width: 15%;float: left;">头像</div>
                            <div style="background-color: #00FFFF;height: 100%;width: 40%;float: left;">用户名</div>
                            <div style="background-color: #2aabd2;height: 100%;width: 40%;float: left;">时间</div>
                        </div>
                        <div style="background-color: #df68ea;height: 100%;width: 50%;float: right;">
                            <div style="background-color: #ffb67e;height: 100%;width: 30%;float: right;">分享</div>
                            <div style="background-color: #00FFFF;height: 100%;width: 30%;float: right;">评论</div>
                            <div style="background-color: #2aabd2;height: 100%;width: 30%;float: right;">点赞</div>
                        </div>
                    </div>
                </div>
            </div>

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
                                <h4>没有账号？<a href="/register">跳转注册！</a></h4>
                            </div>
                        </form>
                    </div>
                </div>
            </c:if>
            <div style="border: 1px solid #FFFFFF;width: 90%;height: 430px;margin-bottom: 20px;">
                <div style="width: 100%;height: 94%;">
                    <div style="width: 100%;height: 9%;background-color: #F8F8F8;margin-bottom: 2%;text-align: center;">
                        <p style="font-size: 20px;">新鲜事</p>
                    </div>
                    <div style="width: 100%;height: 21%;background-color:#F8F8F8;margin-bottom: 2%;">
                        <div style="background-color: #EFEFEF;width: 50%;height: 90%;float: left;margin: 4px;margin-right: 0px;">
                            <div style="width: 100%;height: 50%;">标题</div>
                            <div style="width: 100%;height: 50%;">时间</div>
                        </div>

                        <div style="background-color: #EFEFEF;width: 45%;height: 90%;float: right;margin: 4px;margin-left: 0px;">
                            <img src="#" alt="缩略图">
                        </div>
                    </div>
                    <div style="width: 100%;height: 21%;background-color:#F8F8F8;margin-bottom: 2%;">
                        <div style="background-color: #EFEFEF;width: 50%;height: 90%;float: left;margin: 4px;margin-right: 0px;">
                            <div style="width: 100%;height: 50%;">标题</div>
                            <div style="width: 100%;height: 50%;">时间</div>
                        </div>

                        <div style="background-color: #EFEFEF;width: 45%;height: 90%;float: right;margin: 4px;margin-left: 0px;">
                            <img src="#" alt="缩略图">
                        </div>
                    </div>
                    <div style="width: 100%;height: 21%;background-color:#F8F8F8;margin-bottom: 2%;">
                        <div style="background-color: #EFEFEF;width: 50%;height: 90%;float: left;margin: 4px;margin-right: 0px;">
                            <div style="width: 100%;height: 50%;">标题</div>
                            <div style="width: 100%;height: 50%;">时间</div>
                        </div>

                        <div style="background-color: #EFEFEF;width: 45%;height: 90%;float: right;margin: 4px;margin-left: 0px;">
                            <img src="#" alt="缩略图">
                        </div>
                    </div>
                    <div style="width: 100%;height: 21%;background-color:#F8F8F8;margin-bottom: 2%;">
                        <div style="background-color: #EFEFEF;width: 50%;height: 90%;float: left;margin: 4px;margin-right: 0px;">
                            <div style="width: 100%;height: 50%;">标题</div>
                            <div style="width: 100%;height: 50%;">时间</div>
                        </div>

                        <div style="background-color: #EFEFEF;width: 45%;height: 90%;float: right;margin: 4px;margin-left: 0px;">
                            <img src="#" alt="缩略图">
                        </div>
                    </div>

                </div>
                <div style="width: 100%;height: 6%;text-align: center;border-top: 1px solid #FFFFFF;background-color: #F8F8F8;">
                    <a href="#" style="">查看更多<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
                </div>
            </div>

            <div style="border: 1px solid #FFFFFF;width: 90%;height: 430px;margin-bottom: 20px;">
                <div style="width: 100%;height: 9%;background-color: #F8F8F8;margin-bottom: 2%;text-align: center;">
                    <p style="font-size: 20px;">热门文章</p>
                </div>




                <div style="width: 100%;height: 6%;text-align: center;border-top: 1px solid #FFFFFF;background-color: #F8F8F8;">
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
            ,indicator:'none'
        });
    });

    //给登录按钮绑定点击事件
    $("#login").click(function(){
        //利用ajax进行登录请求
        //1、创建XMLHttpRequest 对象
        var xmlhttp = new XMLHttpRequest();
        //2、建立请求
        xmlhttp.open("POST","${ctx}/login",true);
        //3、发送请求
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("username="+$("#username").val()+"&password="+$("#password").val());
        //4、处理响应
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    $("#errMsg").text("登录成功！");
                    window.setTimeout(index,1000);
                    function index() {
                        location.href="${ctx}/";
                    }
                }else if(xmlhttp.responseText=='err1'){
                    $("#errMsg").text("登录失败！用户名或密码不能为空！");
                }else if(xmlhttp.responseText=='err2'){
                    $("#errMsg").text("登录失败！用户名或密码错误！");
                }else if(xmlhttp.responseText=='err3'){
                    $("#errMsg").text("用户名不存在！");
                }else{
                    $("#errMsg").text("登录失败！请联系管理员！");
                }
            }
        }
    })
</script>
</html>
