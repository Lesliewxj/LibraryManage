package com.lpy.servlet;

import com.lpy.dao.ReaderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/FindPwd")
public class FindPwd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        String name = request.getParameter("username");
        String pwd = request.getParameter("password");
        ReaderDao rd = new ReaderDao();
        if(rd.FindPwd(id,name,pwd)){
            request.setAttribute("flag","true");
            request.getRequestDispatcher("FindPwd.jsp").forward(request,response);
        }else {
            request.setAttribute("flag","false");
            request.getRequestDispatcher("FindPwd.jsp").forward(request,response);
        }
    }
}
