<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/5/9
  Time: 13:44
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
    <title>RentInfo</title>
</head>
<link href="layui/css/layui.css" rel="stylesheet">
<script src="js/jquery-3.3.1.js"></script>
<script src="layui/layui.all.js"></script>
<body style="margin-top: -15px;">
    <table class="layui-table">
        <colgroup>
            <col width="100">
            <col width="100">
            <col width="200">
            <col width="200">
            <col width="200">
            <col width="150">
            <col width="100">
            <col width="200">
        </colgroup>
        <thead>
            <tr>
                <th>姓名</th>
                <th>读者ID</th>
                <th>图书名</th>
                <th>ISBN出版号</th>
                <th>出版社</th>
                <th>类型</th>
                <th>作者</th>
                <th>借阅时间</th>
            </tr>
        </thead>
        <c:forEach items="${list}" var="l">
        <tbody>
            <tr>
                <td>${l.reader_name}</td>
                <td>${l.reader_number}</td>
                <td>${l.book_name}</td>
                <td>${l.book_isbn}</td>
                <td>${l.book_press}</td>
                <td>${l.book_type}</td>
                <td>${l.book_author}</td>
                <td>${l.reader_rent_date}</td>
            </tr>
        </tbody>
        </c:forEach>
    </table>


</body>
</html>
