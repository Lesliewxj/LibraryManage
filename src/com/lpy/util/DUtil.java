package com.lpy.util;
import java.sql.*;

public class DUtil {
    static Connection con = null;
    static ResultSet rs = null;
    static PreparedStatement stmt = null;

    public static void databean(){
        String user = "root";
        String pwd = "123456";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bookmanger?characterEncoding=utf-8&useUnicode=true",user,pwd);
            System.out.println("连接数据库成功！");
        }catch (Exception ex){
            ex.printStackTrace();
            System.out.println("连接数据库失败！");
        }
    }


    public static ResultSet executeQuery(String s){
        try{
            stmt = con.prepareStatement(s);
            rs = stmt.executeQuery(s);
        }catch (Exception ex){
            ex.printStackTrace();
            System.out.println("查询信息失败！");
        }
        return rs;
    }


    public static int executeUpdate(String s){
        int result = 0;
        try{
            PreparedStatement stmt = con.prepareStatement(s);
            result = stmt.executeUpdate(s);
        }catch (Exception ex){
            ex.printStackTrace();
            System.out.println("更新插入信息失败！");
        }
        return result;
    }

    public static void close(){
        try{
            con.close();
        }catch (Exception ex){
            ex.printStackTrace();
            System.out.println("关闭数据库连接失败！");
        }
    }

}
