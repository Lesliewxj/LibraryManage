
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>AdminManage</title>
</head>
<link href="layui/css/layui.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="layui/css/main.css" rel="stylesheet">
<script src="js/jquery-3.3.1.js"></script>
<script src="js/bootstrap.js"></script>
<script src="layui/layui.all.js"></script>
<script src="layui/layui.js"></script>
<body>

<script>
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

        //监听导航点击
        element.on('nav(demo)', function(elem){
            layer.msg(elem.text());
        });
    });
</script>


<div class="layui-layout layui-layout-admin">
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <p style="color: white; font-size: 30px; padding-top: 5px;">图书管理系统</p>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item"><span class="badge badge-primary" style="margin-top: 15px; height: 30px;padding-top: 8px;"><a href="JavaScript:;">当前用户：<%=session.getAttribute("username")%></a></span></li>
                <li class="layui-nav-item" style="margin-left: 20px"><span class="badge badge-danger" style="margin-top: 15px; height: 30px;padding-top: 8px;"><a href="Login.jsp">退出</a></span></li>
            </ul>
        </div>
    </div>
</div>

<div class="pageContainer">
    <div class="pageSidebar">
        <ul class="layui-nav layui-nav-tree">
            <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
            <li class="layui-nav-item">
                <a href="JavaScript:;" target="mainFrame">用户信息管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="Register.jsp" target="mainFrame">读者添加</a></dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd><a href="ReaderInfo.jsp" target="mainFrame">读者信息</a></dd>
                </dl>
                <dl class="layui-nav-child">
                    <dd><a href="ModifyPwd.jsp" target="mainFrame">密码修改</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item ">
                <a href="JavaScript:;">图书借阅管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="BookInfo?fl=admin" target="mainFrame">管理图书信息</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="JavaScript:;">借阅信息</a>
                <dl class="layui-nav-child">
                    <dd><a href="SentBook" target="mainFrame">借阅图书管理</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="Login.jsp" target="_self">退出系统</a>
            </li>
        </ul>
        <div style="color:white;">
            <p class="text-center">
                版权所有&copy;
            </p>
        </div>
    </div>


    <div class="splitter"></div>

    <div class="layui-body">
        <iframe src="Introduce.jsp" id="mainFrame" name="mainFrame" frameborder="0" style="width: 100%;height: 99%;overflow: auto;"></iframe>
    </div>

</div>
</body>
</html>
