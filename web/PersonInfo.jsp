<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.lpy.dao.ReaderDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lpy.bean.Reader" %><%--
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
    <title>PersonInfo</title>
</head>
<link href="layui/css/layui.css" rel="stylesheet">
<script src="js/jquery-3.3.1.js"></script>
<script src="layui/layui.all.js"></script>
<body>

<script type="text/javascript">
    var status = "<%=request.getAttribute("status")%>";
    console.log(status);
    if(status==null){

    }
    if(status=="true"){
        layer.alert('修改信息成功！',{
            icon:1,
            title:'提示'
        });
    }
    if(status=="false"){
        layer.alert('修改信息失败！',{
            icon:5,
            title:'提示'
        });
    }
</script>


    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 60px;margin-left: 50px;width: 50%;">
        <legend>个人信息</legend>
    </fieldset>



<form>
    <c:forEach items="${list}" var="l">

    <div class="layui-form" style="border: black solid 1px;margin-left: 50px;width: 50%;height: 55%;">
        <div style="float: left;">
        <div class="layui-form-item" style="padding-top: 10px;">
            <label class="layui-form-label" style="font-size: 18px;">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="Name" class="layui-input" style="width: 100px;height: 35px;" value="${l.reader_name}" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="font-size: 18px;">性别</label>
            <div class="layui-input-block">
                <input type="text" name="Sex" class="layui-input" style="width: 50px;height: 35px;" value="${l.reader_sex}" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="font-size: 18px;">生日</label>
            <div class="layui-input-inline">
                <input type="text" name="Date" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" value="${l.reader_birthday}" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="font-size: 18px;">年龄</label>
            <div class="layui-input-block">
                <input type="text" name="Age" class="layui-input" style="width: 50px;height: 35px;" value="${l.reader_age}" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="font-size: 18px;">编号</label>
            <div class="layui-input-block">
                <input type="text" name="Id" class="layui-input" style="width: 150px;height: 35px;" value="${l.reader_number}" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="font-size: 18px;">院系</label>
            <div class="layui-input-block">
                <input type="text" name="Dept" class="layui-input" style="width: 150px;height: 35px;" value="${l.reader_dept}" readonly >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="font-size: 18px;">专业</label>
            <div class="layui-input-block">
                <input type="text" name="Major" class="layui-input" style="width: 150px;height: 35px;" value="${l.reader_major}" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="font-size: 18px;">邮箱</label>
            <div class="layui-input-block">
                <input type="text" name="Email" class="layui-input" style="width: 200px;height: 35px;" value="${l.reader_email}" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="font-size: 18px;">电话</label>
            <div class="layui-input-block">
                <input type="text" name="Phone" class="layui-input" style="width: 150px;height: 35px;" value="${l.reader_phone}" readonly>
            </div>
        </div>
        </div>
    </div>

    </c:forEach>
</form>
</body>
</html>
