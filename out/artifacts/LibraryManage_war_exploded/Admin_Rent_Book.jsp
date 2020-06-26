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
    <title>Admin_Rent_Book</title>
</head>
<link href="layui/css/layui.css" rel="stylesheet">
<script src="js/jquery-3.3.1.js"></script>
<script src="layui/layui.all.js"></script>
<body>




<div style="margin-top: 10px;margin-left: 10px;margin-bottom: 20px;">
    搜索借书读者ID：
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

<script>
    var del = "<%=request.getAttribute("del")%>";

    if(del==null){

    }
    if(del=="true"){
        layer.alert('还书成功！',{
            icon:1,
            title:"提示"
        });
    }
    if(del=="false"){
        layer.alert('还书失败！',{
            icon:5,
            title:"提示"
        });
    }
</script>

<table class="layui-table" id="table">
    <colgroup>
        <col width="100">
        <col width="100">
        <col width="200">
        <col width="200">
        <col width="150">
        <col width="200">
        <col width="200">
        <col width="200">
        <col width="150">
        <col width="100">
        <col width="200">
        <col width="70">
    </colgroup>
    <thead>
    <tr>
        <th>姓名</th>
        <th>读者ID</th>
        <th>院系</th>
        <th>专业</th>
        <th>电话</th>
        <th>图书名</th>
        <th>ISBN出版号</th>
        <th>出版社</th>
        <th>类型</th>
        <th>作者</th>
        <th>借阅时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="l">
    <form class="layui-form" action="SentPerBook?reader_number=${l.reader_number}&&book_isbn=${l.book_isbn}" method="post">
    <tr>
        <td>${l.reader_name}</td>
        <td>${l.reader_number}</td>
        <td>${l.reader_dept}</td>
        <td>${l.reader_major}</td>
        <td>${l.reader_phone}</td>
        <td>${l.book_name}</td>
        <td>${l.book_isbn}</td>
        <td>${l.book_press}</td>
        <td>${l.book_type}</td>
        <td>${l.book_author}</td>
        <td>${l.reader_rent_date}</td>
        <td>
            <button type="submit" class="layui-btn layui-btn-danger layui-btn-xs" >还书</button>
        </td>
    </tr>
    </form>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
