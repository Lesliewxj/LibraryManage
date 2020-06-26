<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LPY
  Date: 2019/5/9
  Time: 13:30
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
    <title>Admin_Book_Info</title>
</head>
<link href="layui/css/layui.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<script src="layui/layui.js"></script>
<script src="layui/layui.all.js"></script>
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>
<body>

<script type="text/javascript">
    var status = "<%=request.getAttribute("status")%>";
    var ins = "<%=request.getAttribute("ins")%>";
    var flag = "<%=request.getAttribute("flag")%>";

    console.log("status:"+status);
    console.log("ins:"+ins);
    console.log("flag:"+flag)

    if(status=="true"){
        layer.alert('修改图书信息成功！',{
            icon:1,
            title:"提示"
        });
    }
    if(status=="false"){
        layer.alert('修改图书信息失败！',{
            icon:5,
            title:"提示"
        });
    }

    if(ins=="true"){
        layer.alert('借阅图书成功！',{
            icon:1,
            title:"提示"
        });
    }
    if(ins=="false"){
        layer.alert('借阅图书失败！已借阅过该图书或借阅图书书目大于一本!',{
            icon:5,
            title:"提示"
        });
    }
    if(flag=="true"){
        layer.alert('添加图书成功！',{
            icon:1,
            title:"提示"
        });
    }
    if(flag=="false"){
        layer.alert('添加图书失败！',{
            icon:5,
            title:"提示"
        });
    }
</script>



<div style="margin-left: 10px;margin-top: 10px;padding-right: 5px;">
    <button type="button" class="layui-btn layui-btn-danger" onclick="Insert_Book()">添加图书</button>
</div>

<div style="margin-top: 10px;margin-left: 10px;">
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

    function Insert_Book () {
        layer.open({
            type:1,
                title:"添加图书",
                content:$("#Insert_Book").html()
            });
        }


</script>



<table class="layui-table" id="table">
    <colgroup>
        <col width="100">
        <col width="200">
        <col width="200">
        <col width="200">
        <col width="200">
        <col width="80">
        <col width="80">
        <col width="80">
        <col width="80">
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
        <th>操作</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${list}" var="l">
    <tr>
        <td>${l.book_id}</td>
        <td>${l.book_name}</td>
        <td>${l.book_isbn}</td>
        <td>${l.book_press}</td>
        <td>${l.book_type}</td>
        <td>${l.book_author}</td>
        <td>${l.book_count}</td>
        <td>${l.book_remain_count}</td>
        <td>
            <button  data-toggle="modal" data-target="#XiuGai" type="button" onclick="Xiugai('${l.book_name}','${l.book_isbn}','${l.book_press}','${l.book_type}','${l.book_author}','${l.book_count}','${l.book_remain_count}')" class="layui-btn layui-btn-danger layui-btn-xs">修改</button>
            <button data-toggle="modal" data-target="#Rent" type="button" onclick="rent('${l.book_name}','${l.book_isbn}')" class="layui-btn layui-btn-warm layui-btn-xs">借阅</button>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>

<script>
    function Xiugai(book_name,book_isbn,book_press,book_type,book_author,book_count,book_remain_count) {
        document.getElementById("book_name").value = book_name;
        document.getElementById("book_isbn").value = book_isbn;
        document.getElementById("book_press").value = book_press;
        document.getElementById("book_type").value = book_type;
        document.getElementById("book_author").value = book_author;
        document.getElementById("book_count").value = book_count;
        document.getElementById("book_remain_count").value = book_remain_count;
    }

    function rent(reader_book_name,reader_book_isbn) {
        var t = new Date();
        var year = t.getFullYear();
        var month = t.getMonth();
        var day = t.getDate();
        var week = t.getDay()
        var hour = t.getHours();
        var minute = t.getMinutes();
        var second = t.getSeconds();
        var showtime = year+"-"+month+"-"+day+" "+hour+((minute<10)?":0":":")+minute+((second<10)?":0":":")+second;


        document.getElementById("reader_book_name").value = reader_book_name;
        document.getElementById("reader_book_isbn").value = reader_book_isbn;
        document.getElementById("reader_rent_date").value = showtime;
    }
</script>


<%--修改--%>
<form class="form-horizontal" action="XiuGai" method="post">
    <div class="modal fade" id="XiuGai" tabindex="-1" role="dialog" aria-labelledby="updateLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h4 class="text-center"  id="updateLabel">图书信息修改</h4>
                </div>

                <div class="modal-body">
                    <%--表单--%>

                    <div class="form-group">
                        <label for="" class="col-sm-3 control-label">图书名称</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="book_name" name="book_name"> <label class="layui-form-label" for="book_name" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 control-label">ISBN出版号</label>
                        <div class="layui-input-inline">
                            <input style="color:red;" type="text" class="layui-input" id="book_isbn" name="book_isbn" readonly> <label class="layui-form-label" for="book_isbn" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 control-label">出版社</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="book_press" name="book_press"> <label class="layui-form-label" for="book_press" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-3 control-label">图书类型</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="book_type" name="book_type"> <label class="layui-form-label" for="book_type" style="display: none"></label>
                        </div>
                    </div>

                     <div class="form-group">
                         <label for="" class="col-sm-3 control-label">作者</label>
                         <div class="layui-input-inline">
                             <input type="text" class="layui-input" id="book_author" name="book_author"> <label class="layui-form-label" for="book_author" style="display: none"></label>
                         </div>
                     </div>

                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">库存量</label>
                            <div class="layui-input-inline">
                                <input type="text" class="layui-input" id="book_count" name="book_count"> <label class="layui-form-label" for="book_count" style="display: none"></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="" class="col-sm-3 control-label">剩余库存量</label>
                            <div class="layui-input-inline">
                                <input style="color: red;" type="text" class="layui-input" id="book_remain_count" name="book_remain_count" readonly> <label class="layui-form-label" for="book_remain_count" style="display: none"></label>
                            </div>
                        </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="layui-btn layui-btn-primary" data-dismiss>关闭</button>
                    <button type="submit" class="layui-btn layui-btn-normal" onclick="return equal()">修改</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    function equal() {
        if(document.getElementById("book_count").value<document.getElementById("book_remain_count").value){
            layui.alert('图书库存量不能剩余库存量',{
                icon:5,
                title:'提示'
            });
            return false;
        }
    }
</script>


<%--借阅--%>
<form class="form-horizontal" action="RentBook" method="post">
    <div class="modal fade" id="Rent" tabindex="-1" role="dialog" aria-labelledby="updateLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-title">
                    <h4 class="text-center"  id="RentLabel">图书借阅</h4>
                </div>

                <div class="modal-body">
                    <%--表单--%>
                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">读者姓名</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="reader_name" name="reader_name"> <label class="layui-form-label" for="reader_name" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">读者编号</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="reader_number" name="reader_number"> <label class="layui-form-label" for="reader_number" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">借阅书目名称</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="reader_book_name" name="reader_book_name" readonly><label class="layui-form-label" for="reader_book_name" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">借阅书目ISBN</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="reader_book_isbn" name="reader_book_isbn" readonly> <label class="layui-form-label" for="reader_book_isbn" style="display: none"></label>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="" class="col-sm-4 control-label">借阅日期</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" id="reader_rent_date" name="reader_rent_date"> <label class="layui-form-label" for="reader_rent_date" style="display: none"></label>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="layui-btn layui-btn-primary" data-dismiss>关闭</button>
                    <button type="submit" class="layui-btn layui-btn-normal" onclick="return count()">借阅</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    function count() {
        if(document.getElementById("book_remain_count")==0){
            layer.alert('禁止借阅，该图书无库存！',{
                icon:5,
                title:"提示"
            });
            return false;
        }
    }
</script>

<%--添加--%>
<div class="layui-row" id="Insert_Book" style="display: none">
    <form class="layui-form" style="margin-top: 10px;" method="post" action="InsertBook">
        <div class="layui-form-item">
            <label class="layui-form-label">图书ID</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="book_id">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">图书名称</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="book_name">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">图书ISBN</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="book_isbn">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">作者</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="book_author">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">出版社</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="book_press">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">图书类型</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="book_type">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">图书价格</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="book_money">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">库存量</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="book_count">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">剩余库存量</label>
            <div class="layui-input-inline">
                <input class="layui-input" type="text" name="book_remain_count">
            </div>
        </div>

        <div class="layui-form-item"  style="margin-left: 30%;">
            <button type="submit" class="layui-btn layui-btn-warm">添加</button>
            <button type="reset" class="layui-btn layui-btn-normal">重置</button>
        </div>
    </form>
</div>

</body>
</html>
