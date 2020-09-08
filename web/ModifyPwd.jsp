<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="layui/css/layui.css" rel="stylesheet">
    <script src="js/jquery-3.3.1.js"></script>
    <script src="layui/layui.all.js"></script>
</head>
<body>

//修改密码
<script type="text/javascript">

    var status = "<%=request.getAttribute("status")%>";
    console.log(status);
    if (status == null){

    }
    if(status == "true"){
        layer.alert('修改成功!',{
           icon:1,
           title:'提示'
        });
    }
    if(status == "false"){
        layer.alert('修改失败！',{
            icon:5,
            title:'提示'
        });
    }


    function onsub() {
        if(document.update.newpassword.value!=document.update.re_newpassword.value){
            layer.alert('两次密码输入不一致请确认密码是否有误',{
                icon:5,
                title:'提示'
            });
            return false;
        }

        if(document.update.newpassword.value==""||document.update.re_newpassword.value=="") {
            layer.alert('密码不能为空',{
                icon:5,
                title:'提示'
            });
            return false;
        }

        if(document.update.newpassword.value.length>16||document.update.newpassword.value.length<6){
            layer.alert('密码必须在6-16位数字或字母之间!',{
                icon:5,
                title:'提示'
            });
            return false;
        }

        if(document.update.re_newpassword.value.length>16||document.update.re_newpassword.value.length<6){
            layer.alert('密码必须在6-16位数字或字母之间!',{
                icon:5,
                title:'提示'
            });
            return false;
        }
        return true;
    }
</script>











<div  style="margin-top: 100px;margin-left: 33%;margin-right: 33%;">
    <form class="layui-form layui-form-pane" action="ModifyPwd?identify=<%=session.getAttribute("identify")%>" method="post" name="update">
        <div class="layui-form-item" style="margin-left: 35%;"><h2>密码修改</h2></div>
        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">
                <i class="layui-icon layui-icon-username" style="size: 40px;color: #009688;"></i>
            </label>
            <div class="layui-input-inline">
                <input type="text" name="ID" class="layui-input" placeholder="请输入ID" value="<%=session.getAttribute("id")%>" readonly>
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 15%;">
            <label class="layui-form-label">
                <i class="layui-icon layui-icon-password" style="size: 40px;color: #009688;"></i>
            </label>
            <div class="layui-input-inline">
                <input type="password" name="oldpassword" class="layui-input" placeholder="请输入原密码">
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">
                <i class="layui-icon layui-icon-password" style="size: 40px;color: #009688;"></i>
            </label>
            <div class="layui-input-inline">
                <input type="password" name="newpassword" class="layui-input" placeholder="请输入6-16位新密码">
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 15%">
            <label class="layui-form-label">
                <i class="layui-icon layui-icon-password" style="size: 40px;color: #009688;"></i>
            </label>
            <div class="layui-input-inline">
                <input type="password" name="re_newpassword" class="layui-input" placeholder="确认新密码">
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 22%;">
            <button type="submit" class="layui-btn layui-btn-normal" onclick="return onsub()">确认</button>
            <button type="reset" class="layui-btn layui-btn-danger" style="margin-left: 16%;">重置</button>
        </div>
    </form>
</div>
</body>
</html>
