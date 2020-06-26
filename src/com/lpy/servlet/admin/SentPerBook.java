package com.lpy.servlet.admin;

import com.lpy.bean.history;
import com.lpy.dao.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/SentPerBook")
public class SentPerBook extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String reader_number = request.getParameter("reader_number");
        String book_isbn = request.getParameter("book_isbn");
        AdminDao ad = new AdminDao();
        if(ad.SendBook(reader_number,book_isbn)){
            List<history> list = ad.SentAllBook();
            request.setAttribute("list",list);
            request.setAttribute("del","true");
            request.getRequestDispatcher("Admin_Rent_Book.jsp").forward(request,response);
        }else {
            List<history> list = ad.SentAllBook();
            request.setAttribute("list",list);
            request.setAttribute("del","false");
            request.getRequestDispatcher("Admin_Rent_Book.jsp").forward(request,response);
        }
    }
}
