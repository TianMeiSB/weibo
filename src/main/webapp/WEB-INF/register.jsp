<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <title>用户注册</title>
    <link href="${ctx}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/static/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
</head>
<body>
<div style="width: 40%;height: 400px;background-color: #F8F8F8;margin: auto;margin-top: 100px;">
    <div class="layui-form-item" style="width: 90%;margin: auto;text-align: center;">
        <h2>用户注册</h2>
    </div>
    <form class="layui-form" action="#<%--register--%>" method="post" lay-filter="example" style="margin-top: 30px;">
        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input" id="username">
            </div>
        </div>
        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input" id="password">
            </div>
        </div>
        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-block">
                <input type="text" name="address" lay-verify="title" autocomplete="off" placeholder="请输入地址" class="layui-input" id="address">
            </div>
        </div>
        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <label class="layui-form-label">电话号码</label>
            <div class="layui-input-block">
                <input type="text" name="phone" lay-verify="title" autocomplete="off" placeholder="请输入电话号码" class="layui-input" id="phone">
            </div>
        </div>
        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked="" class="sex">
                <input type="radio" name="sex" value="女" title="女" class="sex">
                <input type="radio" name="sex" value="保密" title="保密" class="sex">
            </div>
        </div>

        <div class="layui-form-item" style="width: 90%;margin: auto;">
            <div class="layui-input-block">
                <input class="layui-btn" lay-submit="" lay-filter="demo1" id="register" value="立即提交">
            </div>
        </div>
    </form>
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

    $("#register").click(function(){
        //利用ajax进行登录请求
        //1、创建XMLHttpRequest 对象
        var xmlhttp = new XMLHttpRequest();
        //2、建立请求
        xmlhttp.open("POST","${ctx}/register",true);
        //3、发送请求
        xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xmlhttp.send("username="+$("#username").val()+"&password="+$("#password").val()+"&address="+$("#address").val()+"&phone="+$("#phone").val()+"&sex="+$(".sex").val());
        //4、处理响应
        xmlhttp.onreadystatechange=function(){
            if (xmlhttp.readyState==4 && xmlhttp.status==200){
                if(xmlhttp.responseText=='ok'){
                    layer.ready(function(){
                        layer.msg('注册成功！即将为您跳转到首页');
                    });
                    window.setTimeout(index,3000);
                    function index() {
                        location.href="${ctx}/";
                    }
                    // alert("注册成功！");
                    <%--location.href="${ctx}/";//跳转到首页--%>
                }else if(xmlhttp.responseText=='err1'){
                    layer.ready(function(){
                        layer.msg('注册失败！请填写完整信息！');
                    });
                    // alert("注册失败！请填写完整信息！");
                }else if(xmlhttp.responseText=='err2'){
                    layer.ready(function(){
                        layer.msg('注册失败！该用户名已被注册！');
                    });
                    // alert("注册失败！该用户名已被注册！");
                }else if(xmlhttp.responseText=='err3'){
                    layer.ready(function(){
                        layer.msg('注册失败，请联系管理员！');
                    });
                    // alert("注册失败，请联系管理员！")
                }else{
                    layer.ready(function(){
                        layer.msg('注册失败，请联系管理员！');
                    });
                    // alert("注册失败，请联系管理员！")
                }
            }
        }
    })
</script>
</html>
