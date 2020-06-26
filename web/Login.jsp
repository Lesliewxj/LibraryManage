
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  session.invalidate();
%>
<html>
<head>
  <base href="<%=basePath%>">
  <title>图书管理系统登录</title>
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
  if(flag==null){

  }
  if(flag=="false"){
    layer.alert('登录失败，请检查ID，用户名和密码是否正确！',{
      icon:5,
      title:'提示'
    });
  }
</script>


<script type="text/javascript">
  function Onlogin() {
    if (document.Login.id.value==""){
      layer.alert('用户ID不能为空',{
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
      layer.alert('密码不能为空',{
        icon:5,
        title:"提示"
      });
      return false;
    }
    if(document.Login.identify.value==""){
      layer.alert('请选择登录的身份',{
        icon:5,
        title:"提示"
      });
      return false;
    }
  }
</script>


<div class="layui-container">
  <div style="width: 30%;height: 10%;margin-left: 30%;margin-top: 30%;">
    <h1 align="center" style="margin-left: -30%;margin-bottom: 40%;font-size: 50px;margin-top: -40%;">图&nbsp;&nbsp;书&nbsp;&nbsp;管&nbsp;&nbsp;理&nbsp;&nbsp;系&nbsp;&nbsp;统&nbsp;&nbsp;登&nbsp;&nbsp;录</h1>
    <form class="layui-form" name="Login" action="Login" method="post" onsubmit="return Onlogin()">
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
        <label class="layui-form-label" style="font-size:20px;">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
        <div class="layui-input-block">
          <input type="password" name="password" class="layui-input" placeholder="请输入密码">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label" style="font-size: 20px;">身&nbsp;&nbsp;&nbsp;&nbsp;份：</label>
        <div class="layui-input-block">
          <select name="identify">
            <option value="">请选择身份</option>
            <option value="Reader">读者</option>
            <option value="Admin">管理员</option>
          </select>
        </div>
      </div>
      <div style="margin-left: 70%;">
        <a href="FindPwd.jsp" class="layui-form-label">找回密码</a>
      </div>
      <div class="layui-form-item" style="margin-top: 6%;margin-left: 43%;">
        <button class="layui-btn" type="submit" style="margin-right: 7%;">登录</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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