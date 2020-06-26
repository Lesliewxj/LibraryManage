<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/5/6
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    session.invalidate();
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>找回密码</title>
</head>
<link href="layui/css/layui.css" rel="stylesheet">
<script src="layui/layui.all.js"></script>
<%--<script src="layui/layui.js"></script>--%>
<script src="layui/jquery-3.3.1.js"></script>
<style type="text/css">
    body{
        background-image: linear-gradient(to right, #b8cbb8 0%, #b8cbb8 0%, #b465da 0%, #cf6cc9 33%, #ee609c 66%, #ee609c 100%);  }
</style>
<body>

<script type="text/javascript">
    var flag = "<%=request.getAttribute("flag")%>";
    console.log(flag)
    if(flag==null){

    }
    if(flag == "true"){
        layer.alert('重置成功！',{
            icon:1,
            title:"提示"
        });
    }
    if(flag=="false"){
        layer.alert('重置失败，请检查ID，用户名是否正确！',{
            icon:5,
            title:'提示'
        });
    }
</script>


<script type="text/javascript">
    function Onlogin() {
        if (document.Login.id.value==""){
            layer.alert('编号不能为空',{
                icon:5,
                title:"提示"
            });
            return false;
        }
        if (document.Login.username.value==""){
            layer.alert('用户名不能为空',{
                icon:5,
                title:"提示"
            });
            return false;
        }

        if(document.Login.password.value==""){
            layer.alert('新密码不能为空',{
                icon:5,
                title:"提示"
            });
            return false;
        }

    }
</script>


<div class="layui-container">
    <div style="width: 30%;height: 10%;margin-left: 30%;margin-top: 30%;">
        <h1 align="center" style="margin-left: -25%;margin-bottom: 20%;font-size: 50px;margin-top: -40%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;找&nbsp;&nbsp;回&nbsp;&nbsp;密&nbsp;&nbsp;码</h1>
        <form class="layui-form" name="Login" action="FindPwd" method="post" onsubmit="return Onlogin()">
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 20px;">用户名：</label>
                <div class="layui-input-block">
                    <input type="text" name="username" class="layui-input" placeholder="请输入用户名">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 20px;">用户ID：</label>
                <div class="layui-input-block">
                    <input type="text" name="id" class="layui-input" placeholder="请输入用户ID">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size:20px;">新密码：</label>
                <div class="layui-input-block">
                    <input type="password" name="password" class="layui-input" placeholder="请输入密码">
                </div>
            </div>
            <div style="margin-left: 70%;">
                <a href="Login.jsp" class="layui-form-label">用户登录</a>
            </div>
            <div class="layui-form-item" style="margin-top: 6%;margin-left: 40%;">
                <button class="layui-btn" type="submit" style="margin-right: 10%;">确定</button>
                <button type="reset" class="layui-btn layui-btn-primary">清空</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    layui.use('form', function(){
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        form.render();
    });
</script>

</body>
</html>