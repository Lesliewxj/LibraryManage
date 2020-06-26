package com.lpy.servlet.Reader;

import com.lpy.dao.AdminDao;
import com.lpy.dao.ReaderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ModifyPwd")
public class ModifyPwd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("ID");
        String identify = request.getParameter("identify");
        String old_pwd = request.getParameter("oldpassword");
        String new_pwd = request.getParameter("newpassword");
        ReaderDao rd = new ReaderDao();
        AdminDao ad = new AdminDao();
        if(identify.equals("Reader")){
            if(rd.ModifyPwd(id,old_pwd,new_pwd)){
                request.setAttribute("status","true");
                request.getRequestDispatcher("ModifyPwd.jsp").forward(request,response);
            }else {
                request.setAttribute("status","false");
                request.getRequestDispatcher("ModifyPwd.jsp").forward(request,response);
            }
        }
        if(identify.equals("Admin")){
            if(ad.AdminModifyPwd(id,old_pwd,new_pwd)){
                request.setAttribute("status","true");
                request.getRequestDispatcher("ModifyPwd.jsp").forward(request,response);
            }else {
                request.setAttribute("status","false");
                request.getRequestDispatcher("ModifyPwd.jsp").forward(request,response);
            }
        }

    }
}
