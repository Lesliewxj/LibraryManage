package com.lpy.servlet;

import com.lpy.dao.AdminDao;
import com.lpy.dao.ReaderDao;
import com.lpy.util.MD5;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password1 = request.getParameter("password");

        String identify = request.getParameter("identify");
        System.out.println(identify);
        AdminDao adminDao = new AdminDao();
        ReaderDao readerDao = new ReaderDao();
        if(identify.equals("Reader")){
            String password = MD5.md5(password1);
            if(readerDao.Login(id,password,username)){
                session.setAttribute("username",username);
                session.setAttribute("id",id);
                session.setAttribute("identify",identify);
                request.getRequestDispatcher("Reader.jsp").forward(request,response);
            }else {
                request.setAttribute("flag","false");
                request.getRequestDispatcher("Login.jsp").forward(request,response);
            }
        }
        if(identify.equals("Admin")){
            if(adminDao.Login(id,password1,username)){
                session.setAttribute("username",username);
                session.setAttribute("id",id);
                session.setAttribute("identify",identify);
                request.getRequestDispatcher("Admin.jsp").forward(request,response);
            }else {
                request.setAttribute("flag","false");
                request.getRequestDispatcher("Login.jsp").forward(request,response);
            }
        }
    }
}
