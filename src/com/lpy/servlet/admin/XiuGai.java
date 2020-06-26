package com.lpy.servlet.admin;

import com.lpy.dao.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/XiuGai")
public class XiuGai extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String book_name = request.getParameter("book_name");
        String book_isbn = request.getParameter("book_isbn");
        String book_type = request.getParameter("book_type");
        String book_press = request.getParameter("book_press");
        String book_author = request.getParameter("book_author");
        String book_count = request.getParameter("book_count");
        AdminDao ad = new AdminDao();
        if(ad.XiuGai(book_isbn,book_name,book_press,book_type,book_author,book_count)){
            request.setAttribute("status","true");
            request.getRequestDispatcher("BookInfo?fl=admin").forward(request,response);
        }else {
            request.setAttribute("status","false");
            request.getRequestDispatcher("BookInfo?fl=admin").forward(request,response);
        }
    }
}
