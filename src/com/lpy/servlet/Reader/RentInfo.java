package com.lpy.servlet.Reader;

import com.lpy.bean.history;
import com.lpy.dao.ReaderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
//登录之后的可以查看个人信息


@WebServlet("/RentInfo")
public class RentInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        ReaderDao rd = new ReaderDao();
        List<history> list = rd.GetRentInfo(id);
        request.setAttribute("list",list);
        request.getRequestDispatcher("RentInfo.jsp").forward(request,response);
    }
}
