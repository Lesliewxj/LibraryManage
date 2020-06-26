package com.lpy.servlet;

import com.lpy.bean.book;
import com.lpy.dao.ReaderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/BookInfo")
public class BookInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        ReaderDao rd = new ReaderDao();
        String flag = request.getParameter("fl");
        System.out.println(flag);
        if(flag.equals("reader")){
            List<book> list = rd.GetBookInfo();
            request.setAttribute("list",list);
            request.getRequestDispatcher("BookInfo.jsp").forward(request,response);
        }
        if(flag.equals("admin")){
            List<book> list = rd.GetBookInfo();
            request.setAttribute("list",list);
            request.getRequestDispatcher("Admin_Book_Info.jsp").forward(request,response);
        }
    }
}
