package com.lpy.servlet.admin;

import com.lpy.dao.AdminDao;
import com.lpy.util.MD5;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/InsertReader")
public class InsertReader extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String Name = request.getParameter("Name");
        String Sex = request.getParameter("Sex");
        String Date = request.getParameter("Date");
        String Age = request.getParameter("Age");
        String Id = request.getParameter("Id");
        System.out.println(Id);
        String Dept = request.getParameter("Dept");
        String Major = request.getParameter("Major");
        String Class = request.getParameter("Class");
        String Email = request.getParameter("Email");
        String Phone = request.getParameter("Phone");
        String Pwd1 = request.getParameter("Pwd");
        String Pwd = MD5.md5(Pwd1);
        AdminDao ad = new AdminDao();
        if(ad.Register(Name,Sex,Date,Age,Id,Dept,Major,Class,Email,Phone,Pwd)){
            request.setAttribute("status","ok");
            request.getRequestDispatcher("Register.jsp").forward(request,response);
        }else {
            request.setAttribute("status","no");
            request.getRequestDispatcher("Register.jsp").forward(request,response);
        }
    }
}
