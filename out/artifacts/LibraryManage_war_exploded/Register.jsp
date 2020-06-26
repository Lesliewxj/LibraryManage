<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/5/8
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Register</title>
</head>
<link href="layui/css/layui.css" rel="stylesheet">
<script src="js/jquery-3.3.1.js"></script>
<script src="layui/layui.all.js"></script>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 60px;margin-left: 50px;width: 50%;">
    <legend>读者添加</legend>
</fieldset>

<script type="text/javascript">
        var status = "<%=request.getAttribute("status")%>";
        if(status == "ok"){
            layer.alert('注册用户成功!',{
                icon:1,
                title:'提示'
            });
        }
        if(status == "no"){
            layer.alert('注册失败，用户编号已存在!',{
                icon:5,
                title:'提示'
            });
        }
</script>


<div class="layui-form" style="border: black solid 1px;margin-left: 50px;width: 50%;height: 80%;">
    <form name="Register" action="InsertReader" method="post" onsubmit="return Verify()">
        <div style="float: left;">
            <div class="layui-form-item" style="padding-top: 10px;">
                <label class="layui-form-label" style="font-size: 18px;">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="Name" class="layui-input" style="width: 100px;height: 35px;" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">性别</label>
                <div class="layui-input-block">
                    <input type="text" name="Sex" class="layui-input" style="width: 50px;height: 35px;" >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">生日</label>
                <div class="layui-input-inline">
                    <input type="text" name="Date" id="Date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">年龄</label>
                <div class="layui-input-block">
                    <input type="text" name="Age" class="layui-input" style="width: 50px;height: 35px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">编号</label>
                <div class="layui-input-block">
                    <input type="text" name="Id" class="layui-input" style="width: 150px;height: 35px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">院系</label>
                <div class="layui-input-block">
                    <input type="text" name="Dept" class="layui-input" style="width: 150px;height: 35px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">专业</label>
                <div class="layui-input-block">
                    <input type="text" name="Major" class="layui-input" style="width: 150px;height: 35px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">班级</label>
                <div class="layui-input-block">
                    <input type="text" name="Class" class="layui-input" style="width: 150px;height: 35px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">邮箱</label>
                <div class="layui-input-block">
                    <input type="text" name="Email" class="layui-input" style="width: 200px;height: 35px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">电话</label>
                <div class="layui-input-block">
                    <input type="text" name="Phone" class="layui-input" style="width: 150px;height: 35px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">密码</label>
                <div class="layui-input-block">
                    <input type="password" name="Pwd" id="Pwd" class="layui-input" style="width: 150px;height: 35px;">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">确认密码</label>
                <div class="layui-input-block">
                    <input type="password" name="ConfirmPwd" id="ConfirmPwd" class="layui-input" style="width: 150px;height: 35px;">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 20%;margin-top: 10%;">
                <button class="layui-btn layui-btn-danger" type="submit">添加</button>
                <button class="layui-btn layui-btn-primary" type="reset">重置</button>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        function Verify() {
            if(document.Register.Pwd.value!=document.Register.ConfirmPwd.value){
                layer.alert('请确保两次输入的密码一致',{
                    icon:5,
                    title:'提示'
                });
                return false;
            }
        }
    </script>


</div>
</body>
</html>
