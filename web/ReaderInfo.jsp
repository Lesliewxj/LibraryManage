<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/5/10
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ReadInfo</title>
</head>
<link href="layui/css/layui.css" rel="stylesheet">
<script src="js/jquery-3.3.1.js"></script>
<script src="layui/layui.all.js"></script>
<body>

<form name="search" style="margin-top: 10px;margin-left: 10px;" method="post" action="LookPersonInfo?fl=admin" >
    <div class="layui-form-item">
        <label class="layui-form-label">搜索读者：</label>
        <div class="layui-inline">
            <input class="layui-input" id="ReaderId" name="ReaderId" autocomplete="off" placeholder="请输入读者编号"> <!--autocomplete自动填充-->
        </div>
        <button type="submit" class="layui-btn layui-btn-danger" onclick="return oncheck()">查找</button>
    </div>
</form>

<script>
    function oncheck() {
        console.log(document.search.ReaderId.value);
        if(document.search.ReaderId.value==""){
            layer.alert('请输入要搜索的读者编号！',{
                icon:7,
                title:'提示'
            });
            return false;
        }
    }
</script>

<script type="text/javascript">
    var Exit = "<%=request.getAttribute("Exit")%>";
    if(Exit == "no"){
        layer.alert('未找到此用户，请核查编号是否正确',{
            icon:5,
            title:'提示'
        });
    }
</script>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 60px;margin-left: 50px;width: 50%;">
    <legend>读者信息</legend>
</fieldset>

<div class="layui-form" style="margin-left: 50px;width: 50%;height: 60%;">
    <c:forEach items="${list}" var="l">
    <form>
        <div style="float: left;">
            <div class="layui-form-item" style="padding-top: 10px;">
                <label class="layui-form-label" style="font-size: 18px;">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="Name" class="layui-input" style="width: 100px;height: 35px;" value="${l.reader_name}" disabled>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">性别</label>
                <div class="layui-input-block">
                    <input type="text" name="Sex" class="layui-input" style="width: 50px;height: 35px;" value="${l.reader_sex}" disabled>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">生日</label>
                <div class="layui-input-inline">
                    <input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" value="${l.reader_birthday}" disabled >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">年龄</label>
                <div class="layui-input-block">
                    <input type="text" name="Age" class="layui-input" style="width: 50px;height: 35px;" value="${l.reader_age}" disabled >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">编号</label>
                <div class="layui-input-block">
                    <input type="text" name="Id" class="layui-input" style="width: 150px;height: 35px;" value="${l.reader_number}" disabled >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">院系</label>
                <div class="layui-input-block">
                    <input type="text" name="Dept" class="layui-input" style="width: 150px;height: 35px;" value="${l.reader_dept}" disabled >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">专业</label>
                <div class="layui-input-block">
                    <input type="text" name="Major" class="layui-input" style="width: 150px;height: 35px;" value="${l.reader_major}" disabled >
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">邮箱</label>
                <div class="layui-input-block">
                    <input type="text" name="Email" class="layui-input" style="width: 200px;height: 35px;" value="${l.reader_email}" disabled>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px;">电话</label>
                <div class="layui-input-block">
                    <input type="text" name="Major" class="layui-input" style="width: 150px;height: 35px;" value="${l.reader_phone}" disabled>
                </div>
            </div>
        </div>
        <%--<div style="float: right;width: 120px;height: 200px;border: black solid 1px;margin-top: 10px;margin-right: 20px;">
            <img src="" alt="用户头像">
        </div>--%>

    </form>
    </c:forEach>
</div>


</body>
</html>
