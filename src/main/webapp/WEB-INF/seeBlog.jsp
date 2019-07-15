<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <title>查看帖子</title>
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
</head>
<style>

</style>
<body style="background: #D3E2EE;background-attachment:fixed">
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
<div style="width: 700px;min-height:100%;background-color: #FFFFFF;margin: auto;margin-top: 4%; background-attachment:fixed">
    <div style="background-color: #FFFFFF">
        <div style="width: 99%;background-color: #FFFFFF;margin: 3px;margin-top: 10px;margin-bottom: 0;">
            <div style="width: 70px;height: 70px;margin-left: 1%;margin-top: 2%;float: left;">
                <a href="/Index?userId=${blog.user.id}"><img src="${blog.user.image}" alt="..." class="img-circle" style="width: 100%;height:100%;border: 1px solid #9F9F9F"></a>
            </div>
            <div style="width: 87%;float: left;margin-left: 1%;margin-top: 2%;">
                <div style="width: 100%;">
                    <div style="width: 90%;float: left">
                        <div style="width: 100%">
                            <a href="/Index?userId=${blog.user.id}"><p style="margin-bottom: 3px;width: 90%;color: #EB7350">${blog.user.username}</p></a>
                        </div>
                    </div>
                    <div style="width: 10%;float: right">
                        <li class="dropdown" style="float: left">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">操作<span class="caret"></span></a>
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
                    <br/>
                    <div style="float: left;width: 100%"><p style="margin-bottom: 3px;color: deepskyblue"><fmt:formatDate value="${blog.publishTime}" pattern="yyyy-MM-dd hh:mm:ss"/></p></div>
                    <div style="float: left"><c:if test="${blog.blogType==0}"><a href="#">#微博#</a></c:if><c:if test="${blog.blogType==1}"><a href="#">#博客#</a></c:if></div>
                    <p style="float: left;font-size: 14px">&nbsp;${blog.title}</p>
                    <br/>
                    <div style="width: 100%;font-size: 18px;word-wrap:break-word;<c:if test="${blog.blogType==0}">margin-bottom: 10px;float: left;margin-top: 3px;</c:if><c:if test="${blog.blogType==1}">margin-bottom: 20px;float: left;margin-top: 20px;</c:if>">${blog.text}</div>
                </div>
                <c:set value="${blog.picture}" var="picture"/>
                <c:if test="${blog.blogType==0}">
                    <div style="width: 450px;min-height:120px;overflow :hidden;">
                        <div  class="layer-photos-demo" style="width: 100%;">
                            <c:forEach items="${picture}" var="picture2">
                                <img layer-pid="" layer-src="${picture2.src}" src="${picture2.src}"  style="width: 130px;height: 100px; margin-right: 15px;margin-bottom: 15px;">
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <div style="width: 100%;height: 45px;">
            <div style="width: 25%;height: 100%;float: left;text-align: center;border: 1px solid #DDDDDD;border-right: none;background-color: #F8F8F8"><div style="margin-top: 7%;"><a href="javascript:;" style="text-decoration:none;" data-userid="${user.id}" data-blogid="${blog.id}" onclick="shoucang(this);">
                <c:if test="${collect!=null}">
                    <p style="color: #28a4c9;"><i class="layui-icon layui-icon-rate"></i> 已收藏</p>
                </c:if>
                <c:if test="${collect==null}">
                    <p><i class="layui-icon layui-icon-rate"></i> 收藏</p>
                </c:if>
            </a></div></div>
            <div style="width: 25%;height: 100%;float: left;text-align: center;border: 1px solid #DDDDDD;border-right: none;background-color: #F8F8F8"><div style="margin-top: 7%;"><a href="#" style="text-decoration:none"><i class="layui-icon layui-icon-share"></i> 分享</a></div></div>
            <c:set value="${blog.comment}" var="comm"/>
            <div style="width: 25%;height: 100%;float: left;text-align: center;border: 1px solid #DDDDDD;border-right: none;background-color: #F8F8F8"><div style="margin-top: 7%;"><a href="#" style="text-decoration:none"><i class="layui-icon layui-icon-dialogue"></i> 评论</a></div></div>
            <div style="width: 25%;height: 100%;float: left;text-align: center;border: 1px solid #DDDDDD;background-color: #F8F8F8"><div style="margin-top: 7%;"><a href="javascript:;" style="text-decoration:none" data-userid="${user.id}" data-blogid="${blog.id}" onclick="dianzan(this);">
                <c:if test="${like==null}">
                    <p><i class="layui-icon layui-icon-praise"></i> 点赞</p>
                </c:if>
                <c:if test="${like!=null}">
                    <p style="color: #28a4c9;"><i class="layui-icon layui-icon-praise"></i> ${likeList.size()}</p>
                </c:if>
            </a></div></div>
        </div>
    </div>
    <div style="width: 100%;min-height: 100%;float: left;background-color: #D3E2EE">
        <div style="width: 100%;min-height: 100%;background-color: #FFFFFF">
            <div style="width: 100%;height: 50px;background-color: #F8F8F8;border: 1px solid #DDDDDD;border-top: none;">
                <div style="width: 94%;height: 50px;background-color: #F8F8F8;margin: auto;border-bottom: 1px solid #DDDDDD;">
                    <div style="width: 8%;height: 89%;float: left;margin:3px;">
                        <img src="<c:if test="${user!=null}">${user.image}</c:if><c:if test="${user==null}">/images/touxiang/1.jpg</c:if>" alt="..." style="width: 100%;height: 100%;border: 1px solid #DDDDDD">
                    </div>
                    <form>
                        <div style="width: 80%;height: 100%;float: left">
                            <input type="hidden" id="blogId" value="${blog.id}">
                            <input type="hidden" id="masterId" value="${blog.user.id}">
                            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="文明用语，请勿散布谣言" class="layui-input" style="margin-top: 5px;" id="text">
                        </div>
                        <div style="height: 100%;width: 11%;float: left">
                            <input class="layui-btn" lay-submit="" lay-filter="demo1" style="margin-top: 5px;" value="评论" type="button" id="addComment">
                        </div>
                    </form>
                </div>
            </div>
            <c:forEach items="${comm}" var="comment">
                <c:if test="${comment.user1!=null}">
                    <%--<input type="hidden" class="commentId" value="">--%>
                <div style="width: 94%;min-height: 100px;background-color: #FFFFFF;margin: auto">
                    <div style="width: 100%;min-height: 60px;">
                        <div style="width: 50px;height: 45px;float: left;margin:3px;margin-top: 10px;">
                            <a href="/Index?userId=${comment.user1.id}"><img src="${comment.user1.image}" alt="..."  style="width: 100%;height: 100%;border: 1px solid #DDDDDD"></a>
                        </div>
                        <div style="width: 91%;min-height: 60px;float: right;word-wrap:break-word;margin-top: 10px;">
                            <a href="/Index?userId=${comment.user1.id}" style="color: #EB7350">${comment.user1.username}</a>：<br/>${comment.text}
                        </div>
                    </div>
                    <div style="width: 91%;margin-left: 60px;height: 32px;">
                        <div style="width: 50%;float: left;color: deepskyblue">
                            <fmt:formatDate value="${comment.replyTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
                        </div>
                        <div style="width: 48%;float: left">
                            <div style="float: right">
                                <c:if test="${user.id==comment.user1.id||user.type==1}">
                                    <a href="javascript:;" style="color: #985f0d" data-userid="${user.id}" data-commentid="${comment.id}" onclick="shanchu(this);">删除</a>
                                    &nbsp;
                                </c:if>
                            <a href="javascript:;"  style="color: #985f0d" data-name="${comment.id}" class="demo" onclick="dianji(this)" data-userid="${comment.user1.id}" data-commentid="${comment.id}">回复</a>
                            &nbsp;
                            <a href="#" style="color: #985f0d">举报</a>
                            </div>
                        </div>
                    </div>
                    <div class="error">
                        <div class="${comment.id}">

                        </div>
                    </div>
                    <c:set value="${comment.comments}" var="comm2"/>
                    <c:forEach items="${comm2}" var="comment2">
                        <div style="width: 80%;min-height: 50px;word-wrap:break-word;background-color: #FFFFFF;margin-left: 58px;margin-top: 1px;">
                                <div style="width: 100%;min-height: 50px;">
                                    <div style="width: 100%;min-height: 25px;margin: auto;word-wrap:break-word;">
                                        <a href="${ctx}/Index?userId=${comment2.user1.id}" style="color: #EB7350;">${comment2.user1.username}</a>回复：${comment2.text}
                                    </div>
                                    <div style="width: 100%;height: 24px;margin: auto;border-bottom: 1px solid #DDDDDD">
                                        <div style="width: 50%;height: 100%;float: left;color: deepskyblue">
                                            <fmt:formatDate value="${comment2.replyTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
                                        </div>
                                        <div style="width: 50%;float: right">
                                            <div style="float: right">
                                                <c:if test="${user.id==comment2.user1.id||user.type==1}">
                                                    <a href="javascript:;" style="color: #985f0d" data-userid="${user.id}" data-commentid="${comment2.id}" onclick="shanchu2(this);">删除</a>
                                                    &nbsp;
                                                </c:if>
                                                <a href="javascript:;" style="color: #985f0d" data-name="${comment2.id}" class="demo" onclick="dianji(this)" data-userid="${comment2.user1.id}" data-commentid="${comment.id}" data-commid="${comment2.id}">回复</a>
                                                &nbsp;
                                                <a href="#"style="color: #985f0d">举报</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <div class="error">
                            <div class="${comment2.id}">

                            </div>
                        </div>
                    </c:forEach>
                </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

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

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');
    });
    layui.use('layer',function () {
        layer.photos({
            photos: '.layer-photos-demo'
            , anim: 2 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
        });
    });
    layui.use('layer',function () {
        var layer = layui.layer;
    });
    var commentId,userId;
    function dianji(obj) {
        var coment = obj.dataset.name;
        userId = obj.dataset.userid;
        commentId = obj.dataset.commentid;
        var commId = obj.dataset.commid;
        $(".error div").empty();
        $("."+coment).html('<from><div style="width: 80%;min-height: 50px;word-wrap:break-word;margin-left: 58px;margin-top: 1px;">\n' +
            '                                    <div style="width: 88%;float: left">\n' +
            '                                        <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="文明用语，请勿散布谣言" class="layui-input" style="margin-top: 5px;" id="test">\n' +
            '                                    </div>\n' +
            '                                    <div style="width: 11%;float: left">\n' +
            '                                        <input class="layui-btn" lay-submit="" lay-filter="demo1" style="margin-top: 5px;" value="回复" type="button" id="add">\n' +
            '                                    </div>\n' +
            '                                </div></from>');
        $("#add").click(function(){
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("POST","${ctx}/addComment2",true);
            xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlhttp.send("blogId="+$("#blogId").val()+"&text="+$("#test").val()+"&masterId="+userId+"&commentId="+commentId+"&commId="+commId);
            xmlhttp.onreadystatechange=function(){
                if (xmlhttp.readyState==4 && xmlhttp.status==200){
                    if(xmlhttp.responseText=='ok'){
                        layer.ready(function(){
                            layer.msg('评论成功！');
                        });
                        window.setTimeout(index,2000);
                        function index() {
                            location.reload();
                        }
                    }else if(xmlhttp.responseText=='err1'){
                        layer.ready(function(){
                            layer.msg('回复失败，需要登陆才能评论哦！');
                        });
                    }else if(xmlhttp.responseText=='err2'){
                        layer.ready(function(){
                            layer.msg('回复失败，请填写完整评论信息！');
                        });
                    }else if(xmlhttp.responseText=='err3'){
                        layer.ready(function(){
                            layer.msg('回复失败，您已被禁言！');
                        });
                    }else{
                        layer.ready(function(){
                            layer.msg('回复失败，请联系管理员！');
                        });
                    }
                }
            }
        });
    };
    function shoucang(obj){
        var userId = obj.dataset.userid;
        var blogId = obj.dataset.blogid;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/addCollection",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("blogId="+blogId+"&userId="+userId);
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok1'){
                    layer.ready(function(){
                        layer.msg('收藏成功！');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='err'){
                    layer.ready(function(){
                        layer.msg('收藏失败，需要登陆才能收藏哦！');
                    });
                }else if(xmlhttp.responseText=='ok2'){
                    layer.ready(function(){
                        layer.msg('取消收藏成功！');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='err1'){
                    layer.ready(function(){
                        layer.msg('收藏失败');
                    });
                }else if(xmlhttp.responseText=='err2'){
                    layer.ready(function(){
                        layer.msg('取消收藏失败');
                    });
                }
            }
        }
    }
    function dianzan(obj){
        var userId = obj.dataset.userid;
        var blogId = obj.dataset.blogid;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/addLike",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("blogId="+blogId+"&userId="+userId);
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok1'){
                    layer.ready(function(){
                        layer.msg('点赞成功！');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='err'){
                    layer.ready(function(){
                        layer.msg('点赞失败，需要登陆才能点赞哦！');
                    });
                }else if(xmlhttp.responseText=='ok2'){
                    layer.ready(function(){
                        layer.msg('取消点赞成功！');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='err1'){
                    layer.ready(function(){
                        layer.msg('点赞失败');
                    });
                }else if(xmlhttp.responseText=='err2'){
                    layer.ready(function(){
                        layer.msg('取消点赞失败');
                    });
                }
            }
        }
    }
    $("#addComment").click(function(){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/addComment",true);
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("blogId="+$("#blogId").val()+"&text="+$("#text").val()+"&masterId="+$("#masterId").val());
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    layer.ready(function(){
                        layer.msg('评论成功！');
                    });
                    window.setTimeout(index,2000);
                    function index() {
                        location.reload();
                    }
                }else if(xmlhttp.responseText=='err1'){
                    layer.ready(function(){
                        layer.msg('评论失败，需要登陆才能评论哦！');
                    });
                }else if(xmlhttp.responseText=='err2'){
                    layer.ready(function(){
                        layer.msg('评论失败，请填写完整评论信息！');
                    });
                }else if(xmlhttp.responseText=='err3'){
                    layer.ready(function(){
                        layer.msg('评论失败，您已被禁言！');
                    });
                }else{
                    layer.ready(function(){
                        layer.msg('评论失败，请联系管理员！');
                    });
                }
            }
        }
    });
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
    function shanchu2(obj) {
        var userId = obj.dataset.userid;
        var commentId = obj.dataset.commentid;
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST","${ctx}/deleteComment2",true);
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
