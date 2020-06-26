package com.lpy.servlet.admin;

import com.lpy.bean.book;
import com.lpy.dao.AdminDao;
import com.lpy.dao.ReaderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/InsertBook")
public class InsertBook extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String book_id = request.getParameter("book_id");
        String book_name = request.getParameter("book_name");
        String book_isbn = request.getParameter("book_isbn");
        String book_author = request.getParameter("book_author");
        String book_press = request.getParameter("book_press");
        String book_type = request.getParameter("book_type");
        String book_money = request.getParameter("book_money");
        String book_count = request.getParameter("book_count");
        String book_remain_count = request.getParameter("book_remain_count");
        AdminDao ad = new AdminDao();
        ReaderDao rd = new ReaderDao();
        if(ad.InsertBook(book_id,book_name,book_isbn,book_author,book_press,book_type,book_money,book_count,book_remain_count)){
            List<book> list = rd.GetBookInfo();
            request.setAttribute("list",list);
            request.setAttribute("flag","true");
            request.getRequestDispatcher("Admin_Book_Info.jsp").forward(request,response);
        }else {
            List<book> list = rd.GetBookInfo();
            request.setAttribute("list",list);
            request.setAttribute("flag","false");
            request.getRequestDispatcher("Admin_Book_Info.jsp").forward(request,response);
        }
    }
}
