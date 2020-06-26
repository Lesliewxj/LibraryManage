<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/5/9
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="layui/css/layui.css" rel="stylesheet">
<script src="js/jquery-3.3.1.js"></script>
<script src="layui/layui.all.js"></script>
<body>

<div style="margin-top: 10px;margin-left: 10%;">
    搜索图书名称：
    <div class="layui-inline">
        <input class="layui-input" name="id" id="demoReload" onkeyup="search()" autocomplete="off"> <!--autocomplete自动填充-->
    </div>
</div>

<!--查找信息-->
<script type="text/javascript">

    function search() {
        var input, filter, table, tr, td, i;
        input = document.getElementById("demoReload");
        filter = input.value.toUpperCase();
        table = document.getElementById("table");
        tr = table.getElementsByTagName("tr");

        for (i = 1; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

</script>


<div style="width: 80%;margin-left: 10%;">
    <table class="layui-table" id="table">
        <colgroup>
            <col width="100">
            <col width="200">
            <col width="200">
            <col width="200">
            <col width="150">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="200">
        </colgroup>
        <thead>
            <tr>
                <th>图书ID</th>
                <th>图书名称</th>
                <th>ISBN出版号</th>
                <th>出版社</th>
                <th>图书类型</th>
                <th>作者</th>
                <th>库存量</th>
                <th>剩余库存量</th>
                <th>图书价格</th>
                <th>图片预览</th>
            </tr>
        </thead>
        <c:forEach items="${list}" var="l">
        <tbody>
            <tr align="center">
                <td>${l.book_id}</td>
                <td>${l.book_name}</td>
                <td>${l.book_isbn}</td>
                <td>${l.book_press}</td>
                <td>${l.book_type}</td>
                <td>${l.book_author}</td>
                <td>${l.book_count}</td>
                <td>${l.book_remain_count}</td>
                <th>${l.book_money}</th>
                <td><img alt="此处为图片"></td>
            </tr>
        </tbody>
        </c:forEach>
    </table>
</div>
</body>
</html>
