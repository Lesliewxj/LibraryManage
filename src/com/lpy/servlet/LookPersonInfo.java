package com.lpy.servlet;

import com.lpy.bean.Reader;
import com.lpy.dao.ReaderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/LookPersonInfo")
public class LookPersonInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("ID");
        String fl = request.getParameter("fl");
        ReaderDao rd = new ReaderDao();
        if(fl.equals("reader")){
            List<Reader> list = rd.AllInfo(id);
            request.setAttribute("list",list);
            request.getRequestDispatcher("PersonInfo.jsp").forward(request,response);
        }
        else if(fl.equals("admin")){
            String readerId = request.getParameter("ReaderId");
            List<Reader> list = rd.AllInfo(readerId);
            if(list==null){
                request.setAttribute("Exit","no");
                request.getRequestDispatcher("ReaderInfo.jsp").forward(request,response);
            }
            request.setAttribute("list",list);
            request.getRequestDispatcher("ReaderInfo.jsp").forward(request,response);
        }
    }
}
