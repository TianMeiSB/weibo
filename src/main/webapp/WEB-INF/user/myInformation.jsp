<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的信息</title>
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
</head>

<style>

</style>
<body style="background-color: #AAD2EB;width: 98.5%;background-image: url(${ctx}/static/images/background/11.png);background-repeat:no-repeat;background-size: 100%;">
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
                <a class="navbar-brand" href="/index" style="text-decoration:none">帅鹏博客</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/index" style="text-decoration:none">首页 <span class="sr-only">(current)</span></a></li>
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
                    <li><a href="#" style="text-decoration:none">关于本站</a></li>
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
    <div style="width: 930px;height: 290px;background-color: aliceblue;margin: auto;margin: auto;margin-top: 7%;text-align: center;background-image: url(${ctx}/static/images/background/22.png);background-size:100% 100%;">
        <div style="margin-left: 45%;margin-right: 45%;margin-top: 6%;float: left;">
            <p style="width:100px;height: 100px">
                <a href="#" id="a">
                    <input type="file" name="image" class="hidden" value="" style="display:none;"/>
                    <img src="${user.image}" alt="..." class="img-circle" style="width: 100%;height: 100%;border: 1px solid #9F9F9F">
                </a>
            </p>
        </div>
        <p style="font-size: 28px;">${user.username}</p>
        <p>${user.introduce}</p>
    </div>
    <div class="layui-tab" lay-filter="test" style="width: 930px; margin: auto;background-color: #F8F8F8; margin-bottom: 1%;">
        <div style="margin-left: 25%;">
            <ul class="layui-tab-title">
                <li lay-id="22"><a href="/user/myIndex" style="text-decoration:none">我的主页</a></li>
                <li></li>
                <li lay-id="33"><a  style="text-decoration:none" href="/user/myAlbum">相册</a></li>
                <li></li>
                <li lay-id="44"><a  style="text-decoration:none" href="/user/myCollect">收藏</a></li>
                <li></li>
                <li lay-id="55" class="layui-this"><a  href="/user/myInformation" style="text-decoration:none">个人资料</a></li>
            </ul>
        </div>
    </div>

    <div style="width: 930px;margin: auto;">
        <div style="width: 33%;height: 100%;float: left;">
            <div style="width: 98%;height: 66px;margin: 3px;background-color: #F8F8F8;">
                <div style="width: 33%;height: 100%;text-align: center;float: left;border-right: 1px solid #DDDDDD"><div STYLE="margin-top: 12%"><a href="javascript:;" style="text-decoration:none" onclick="guanzhu();">${guanzhu.size()}</a><p>关注</p></div></div>
                <div style="width: 34%;height: 100%;text-align: center;float: left;border-right: 1px solid #DDDDDD"><div STYLE="margin-top: 12%"><a href="javascript:;" style="text-decoration:none" onclick="fensi();">${fensi.size()}</a><p>粉丝</p></div></div>
                <div style="width: 33%;height: 100%;text-align: center;float: left;"><div STYLE="margin-top: 12%"><a href="javascript:;" style="text-decoration:none">${blogList.size()}</a><p>微博</p></div></div>
            </div>

            <div style="width: 98%;height: 230px;margin: 3px;background-color: #F8F8F8;margin-top: 10px" id="test">
                <div style="width: 100%;height: 70%;border-bottom: 1px solid #DDDDDD">
                    <table class="table">
                        <tr><td>用户名</td><td>${user.username}</td></tr>
                        <tr><td>性别</td><td>${user.sex}</td></tr>
                        <tr> <td>地址</td><td>${user.address}</td></tr>
                        <tr><td>注册时间</td><td><fmt:formatDate value="${user.registerTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td></tr>
                    </table>
                </div>
                <div style="width: 100%;height: 30%;">
                    <div style="margin-top: 7%;float: left;text-align: center;width: 100%;">
                        <a href="/user/myInformation" style="">前往修改<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a>
                    </div>
                </div>
            </div>
        </div>

        <div style="width: 65%;height: 530px;float: right;">
            <div style="width: 49%;height:180px;text-align: center;background-color: #F8F8F8;float: left">
                <form>
                    <input type="hidden" id="userId" value="${user.id}"></input>
                    <div class="layui-form-item" style="margin-top: 15px;width: 100%">
                        <label class="layui-form-label">原密码</label>
                        <div class="layui-input-inline" >
                            <input name="password" class="layui-input" type="password" placeholder="请输入原密码" autocomplete="off" id="passwd1" style="width: 100%">
                        </div>
                    </div>
                    <div class="layui-form-item" style="width: 100%">
                        <label class="layui-form-label">新密码</label>
                        <div class="layui-input-inline">
                            <input name="password" class="layui-input" type="password" placeholder="请输入新密码" autocomplete="off" id="passwd2" style="width: 100%">
                        </div>
                    </div>
                    <div class="layui-input-block" style="float: left;margin-left: 80px;">
                        <input class="layui-btn" lay-submit lay-filter="formDemo" value="提交" id="addBlog" type="button">
                        <button class="layui-btn layui-btn-primary" type="reset">重置</button>
                    </div>
                </form>
            </div>

            <div style="width: 49%;height:180px;text-align: center;background-color: #F8F8F8;float: right">
                <div class="layui-upload">
                    <button class="layui-btn" id="test1" type="button" style="width: 100%">上传头像</button>
                    <div class="layui-upload-list" style="width: 118px;height: 118px;margin: auto;margin-top: 2px">
                        <img class="layui-upload-img" id="demo1" style="width: 100%;height: 100%">
                        <p id="demoText"></p>
                    </div>
                </div>
            </div>

            <div style="width: 100%;height: 350px;background-color: #F8F8F8;float: left;margin-top: 10px;text-align: center">
                <h3 style="margin-top: 6px;">修改个人信息</h3>
                <div style="width: 80%;height: 80%;margin: auto;margin-top: 20px;">
                    <form class="layui-form" action="#">
                        <div class="layui-form-item">
                            <label class="layui-form-label">地址</label>
                            <div class="layui-input-block" style="margin-right: 20px;">
                                <input type="text" name="title" required  lay-verify="required" placeholder="请输入地址" autocomplete="off" class="layui-input" value="${user.address}" id="address">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">电话</label>
                            <div class="layui-input-block" style="margin-right: 18px;">
                                <input type="text" name="title" required  lay-verify="required" placeholder="请输入电话号码" autocomplete="off" class="layui-input" maxlength="11" value="${user.phone}" id="phone" maxlength="30">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">简介</label>
                            <div class="layui-input-block" style="margin-right: 20px;">
                                <input type="text" name="title" required  lay-verify="required" placeholder="一句话介绍一下自己吧，让别人更了解你" autocomplete="off" class="layui-input" maxlength="30"  value="${user.introduce}" id="introduce">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block">
                                <input type="radio" name="sex" value="男" title="男" <c:if test="${user.sex=='男'}">checked=""</c:if> class="sex">
                                <input type="radio" name="sex" value="女" title="女" <c:if test="${user.sex=='女'}">checked=""</c:if> class="sex">
                                <input type="radio" name="sex" value="保密" title="保密" <c:if test="${user.sex=='保密'}">checked=""</c:if>  class="sex">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input class="layui-btn" lay-filter="demo1" lay-submit="" value="立即提交" type="button" id="update">
                                <button class="layui-btn layui-btn-primary" type="reset">重置</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


</body>
<script src="${ctx}/static/js/jquery-3.3.1.js"></script>
<script src="${ctx}/static/layui/layui.js"></script>
<script src="${ctx}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;
    })
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element //Tab的切换功能，切换事件监听等，需要依赖element模块
            ,carousel = layui.carousel
            ,form = layui.form
            ,layer = layui.layer;

    });
    layui.use('layer',function () {
        var layer = layui.layer;
    });
    $('#a').on('click', function(e) {
        e.preventDefault();
        $(this).closest('input[type=file]').trigger('click');
    });
    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: '${ctx}/touxiang'
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

    $("#addBlog").click(function(){
        //利用ajax进行登录请求
        //1、创建XMLHttpRequest 对象
        var xmlhttp = new XMLHttpRequest();
        //2、建立请求
        xmlhttp.open("POST","${ctx}/updatePasswd",true);
        //3、发送请求
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("passwd1="+$("#passwd1").val()+"&passwd2="+$("#passwd2").val()+"&userId="+$("#userId").val());
        //4、处理响应
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                        layer.msg('修改密码成功！');
                    window.setTimeout(index,3000);
                    function index() {
                        location.href="${ctx}/index";
                    }
                }else if(xmlhttp.responseText=='error'){
                        layer.msg('修改失败，原密码不正确！');
                }else if(xmlhttp.responseText=='error2'){
                        layer.msg('修改失败，请联系管理员！');
                }else if(xmlhttp.responseText=='error3'){
                        layer.msg('修改失败，新密码不能为空！');
                }else{
                        layer.msg('修改失败，请联系管理员！');
                }
            }
        }
    })

    $("#update").click(function(){
        //利用ajax进行登录请求
        //1、创建XMLHttpRequest 对象
        var xmlhttp = new XMLHttpRequest();
        //2、建立请求
        xmlhttp.open("POST","${ctx}/userUpdate",true);
        //3、发送请求
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("address="+$("#address").val()+"&phone="+$("#phone").val()+"&userId="+$("#userId").val()+"&sex="+$(".sex").val()+"&introduce="+$("#introduce").val());
        //4、处理响应
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    layer.msg('修改资料成功！');
                    window.setTimeout(index,2000);
                    function index() {
                        location.href="${ctx}/user/myInformation";
                    }
                }else if(xmlhttp.responseText=='error'){
                    layer.msg('修改失败，请填写完整信息！');
                }else if(xmlhttp.responseText=='error2'){
                    layer.msg('修改失败，请联系管理员！');
                }else{
                    layer.msg('修改失败，请联系管理员！');
                }
            }
        }
    })

    function fensi() {
        $("#test").empty();
        $("#test").html('<div style="width: 100%;height: 15%;border-bottom: 1px solid #DDDDDD;float: left;text-align: center">\n' +
            '                    <p style="color: #3c9cea;margin-top: 2%">我的粉丝</p>\n' +
            '                </div>\n' +
            '                <div style="width: 100%;height: 85%;float: left;overflow-y: auto;">\n' +
            '                    <c:forEach items="${fensi}" var="fensi">\n' +
            '                        <c:forEach items="${fensi.followUser}" var="user">\n' +
            '                            <div style="width: 90%;min-height: 30%;margin-top: 5px;float: left;margin-left: 20px;">\n' +
            '                                <div style="width: 58px;height: 58px;float: left;">\n' +
            '                                    <a href="/Index?userId=${user.id}"><img src="${user.image}" alt="" class="img-circle" style="width: 100%;height: 100%"></a>\n' +
            '                                </div>\n' +
            '                                <div style="width: 76%;min-height: 60px;float: right;">\n' +
            '                                    <div style="width: 100%;min-height: 24px;">\n' +
            '                                        <a href="/Index?userId=${user.id}"><p style="color: #EB7350;font-size: 18px;float: left;margin-top: 2px;">${user.username}</p></a>\n' +
            '                                    </div>\n' +
            '                                    <div style="width: 100%;min-height: 36px;">\n' +
            '                                        <p style="color: #3c9cea;float: left;margin-top: 5px;">${user.introduce}</p>\n' +
            '                                    </div>\n' +
            '                                </div>\n' +
            '                            </div>\n' +
            '                        </c:forEach>\n' +
            '                    </c:forEach>\n' +
            '                </div>');
    }

    function guanzhu() {
        $("#test").empty();
        $("#test").html('<div style="width: 100%;height: 15%;border-bottom: 1px solid #DDDDDD;float: left;text-align: center">\n' +
            '                    <p style="color: #3c9cea;margin-top: 2%">我的关注</p>\n' +
            '                </div>\n' +
            '                <div style="width: 100%;height: 85%;float: left;overflow-y: auto;">\n' +
            '                    <c:forEach items="${guanzhu}" var="guanzhu">\n' +
            '                        <c:forEach items="${guanzhu.user}" var="user">\n' +
            '                            <div style="width: 90%;min-height: 30%;margin-top: 5px;float: left;margin-left: 20px;">\n' +
            '                                <div style="width: 58px;height: 58px;float: left;">\n' +
            '                                    <a href="/Index?userId=${user.id}"><img src="${user.image}" alt="" class="img-circle" style="width: 100%;height: 100%"></a>\n' +
            '                                </div>\n' +
            '                                <div style="width: 76%;min-height: 60px;float: right;">\n' +
            '                                    <div style="width: 100%;min-height: 24px;">\n' +
            '                                        <a href="/Index?userId=${user.id}"><p style="color: #EB7350;font-size: 18px;float: left;margin-top: 2px;">${user.username}</p></a>\n' +
            '                                    </div>\n' +
            '                                    <div style="width: 100%;min-height: 36px;">\n' +
            '                                        <p style="color: #3c9cea;float: left;margin-top: 5px;">${user.introduce}</p>\n' +
            '                                    </div>\n' +
            '                                </div>\n' +
            '                            </div>\n' +
            '                        </c:forEach>\n' +
            '                    </c:forEach>\n' +
            '                </div>');
    }
</script>
</html>
