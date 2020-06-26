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

@WebServlet("/RentBook")
public class RentBook extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String reader_name = request.getParameter("reader_name");
        String reader_number = request.getParameter("reader_number");
        String reader_book_name = request.getParameter("reader_book_name");
        String reader_book_isbn = request.getParameter("reader_book_isbn");
        String reader_rent_date = request.getParameter("reader_rent_date");
        AdminDao ad = new AdminDao();
        if(ad.Rent(reader_name,reader_number,reader_book_name,reader_book_isbn,reader_rent_date)){
            request.setAttribute("ins","true");
            request.getRequestDispatcher("BookInfo?fl=admin").forward(request,response);
        }else {
            request.setAttribute("ins","false");
            request.getRequestDispatcher("BookInfo?fl=admin").forward(request,response);
        }
    }
}
