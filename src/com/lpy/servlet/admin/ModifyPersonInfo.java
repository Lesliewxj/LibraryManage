package com.lpy.servlet.admin;

import com.lpy.bean.Reader;
import com.lpy.dao.ReaderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ModifyPersonInfo")
public class ModifyPersonInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("Id");
        String name = request.getParameter("Name");
        String sex = request.getParameter("Sex");
        String date = request.getParameter("Date");
        String age = request.getParameter("Age");
        String dept = request.getParameter("Dept");
        String major = request.getParameter("Major");
        String email = request.getParameter("Email");
        String phone = request.getParameter("Phone");
        ReaderDao rd = new ReaderDao();
        if(rd.ModifyPersonInfo(id,name,sex,date,age,dept,major,email,phone)){
            List<Reader> list = rd.AllInfo(id);
            request.setAttribute("list",list);
            request.setAttribute("status","true");
            request.getRequestDispatcher("PersonInfo.jsp").forward(request,response);
        }else {
            request.setAttribute("status","false");
            request.getRequestDispatcher("PersonInfo.jsp").forward(request,response);
        }
    }
}
