package com.lpy.dao;

import com.lpy.bean.Reader;
import com.lpy.util.DUtil;
import com.lpy.bean.history;
import com.lpy.bean.book;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReaderDao {

    /**登录验证*/
    public boolean Login(String reader_number, String reader_pwd, String reader_name){
        boolean flag = false;
        DUtil.databean();
        String sql = "select * from reader where reader_number='"+reader_number+"' and reader_pwd='"+reader_pwd+"' and reader_name='"+reader_name+"'";
        ResultSet rs = DUtil.executeQuery(sql);
        try {
            if(rs.next()){
                flag = true;
            }
            DUtil.close();
        }catch (Exception e){
            System.out.println("查询失败，位置ReaderDAO，登录");
            flag = false;
        }
        return flag;
    }


    /**修改密码*/
    public boolean ModifyPwd(String id,String old_pwd,String new_pwd){
        boolean flag = false;
        DUtil.databean();
        String sql = "select * from reader where reader_number='"+id+"' and reader_pwd='"+old_pwd+"'";
        String sqll = "update reader set reader_pwd='"+new_pwd+"' where reader_number='"+id+"'";
        ResultSet rs = DUtil.executeQuery(sql);
        try{
            if(rs.next()){
                int i = DUtil.executeUpdate(sqll);
                if(i>0){
                    flag = true;
                }else {
                    flag = false;
                    System.out.println("用户ID输入有误");
                }
            }else {
                flag = false;
                System.out.println("用户ID输入有误或旧密码错误");
            }
            DUtil.close();
        }catch (Exception e){
            System.out.println("修改个人密码失败，位置ReaderDAo，修改密码");
        }
        return flag;
    }

    /**获取图书信息*/
    public List<book> GetBookInfo(){
        List<book> list = new ArrayList<book>();
        DUtil.databean();
        String sql = "select * from book";
        ResultSet rs = DUtil.executeQuery(sql);
        try{
            while (rs.next()){
                book b = new book();
                b.setBook_id(rs.getString("book_id"));
                b.setBook_author(rs.getString("book_author"));
                b.setBook_isbn(rs.getString("book_isbn"));
                b.setBook_name(rs.getString("book_name"));
                b.setBook_press(rs.getString("book_press"));
                b.setBook_type(rs.getString("book_type"));
                b.setBook_count(rs.getString("book_count"));
                b.setBook_money(rs.getString("book_money"));
                b.setBook_remain_count(rs.getString("book_remain_count"));
                list.add(b);
            }
            DUtil.close();
        }catch (Exception e){
            System.out.println("查询图书信息失败，位置ReaderDAO，查询图书信息");
        }
        return list;
    }

    /**借阅信息*/
    public List<history> GetRentInfo(String id){
        List<history> list = new ArrayList<history>();
        DUtil.databean();
        String sql = "select * from history,book where reader_number='"+id+"' and history.book_isbn=book.book_isbn";
        ResultSet rs = DUtil.executeQuery(sql);
        try{
            while (rs.next()){
                history h = new history();
                h.setReader_number(rs.getString("reader_number"));
                h.setReader_name(rs.getString("reader_name"));
                h.setBook_name(rs.getString("book_name"));
                h.setBook_author(rs.getString("book_author"));
                h.setBook_isbn(rs.getString("book_isbn"));
                h.setBook_press(rs.getString("book_press"));
                h.setBook_type(rs.getString("book_type"));
                h.setReader_rent_date(rs.getString("reader_rent_date"));
                list.add(h);
            }
            DUtil.close();
        }catch (Exception e){
            System.out.println("查看个人借阅信息失败，位置ReaderDAO，查看借阅");
        }
        return list;
    }

    /**获取用户信息*/
    public List<Reader> AllInfo(String id){
        List<Reader> list = new ArrayList<Reader>();

        DUtil.databean();
        String sql = "select * from reader where reader_number='"+id+"'";
        ResultSet rs= DUtil.executeQuery(sql);
        try{
            if (rs.next()){
                Reader reader = new Reader();
                reader.setReader_name(rs.getString("reader_name"));
                reader.setReader_sex(rs.getString("reader_sex"));
                reader.setReader_birthday(rs.getString("reader_birthday"));
                reader.setReader_age(rs.getString("reader_age"));
                reader.setReader_number(rs.getString("reader_number"));
                reader.setReader_dept(rs.getString("reader_dept"));
                reader.setReader_major(rs.getString("reader_major"));
                reader.setReader_email(rs.getString("reader_email"));
                reader.setReader_phone(rs.getString("reader_phone"));
                list.add(reader);
            }else {
                list = null;
            }
            DUtil.close();
        }catch (Exception e){
            System.out.println("获取用户个人信息失败，位置ReaderDAO，用户信息获取");
        }
        return list;
    }

    /**修改个人信息*/
    public boolean ModifyPersonInfo (String id,String name,String sex,String date,String age,String dept,String major,String email,String phone){
        boolean flag = false;
        DUtil.databean();
        String sql = "update reader set reader_name='"+name+"',reader_sex='"+sex+"',reader_birthday='"+date+"',reader_age='"+age+"',reader_dept='"+dept+"',reader_major='"+major+"',reader_email='"+email+"',reader_phone='"+phone+"' where reader_number='"+id+"' ";
        System.out.println(sql);
        try{
            int i = DUtil.executeUpdate(sql);
            if(i>0){
                flag = true;
            }
        }catch (Exception e){
            System.out.println("修改个人信息失败，位置ReaderDAO，修改信息");
        }
        return flag;
    }


    public boolean FindPwd(String id,String username,String new_pwd){
        boolean flag = false;
        DUtil.databean();
        String sql = "select * from reader where reader_number='"+id+"' and reader_name='"+username+"'";
        String sqll = "update reader set reader_pwd='"+new_pwd+"' where reader_number='"+id+"'";
        ResultSet rs = DUtil.executeQuery(sql);
        try{
            if(rs.next()){
                int i = DUtil.executeUpdate(sqll);
                if(i>0){
                    flag = true;
                }else {
                    flag = false;
                    System.out.println("用户ID输入有误");
                }
            }else {
                flag = false;
                System.out.println("用户ID输入有误或姓名错误");
            }
            DUtil.close();
        }catch (Exception e){
            System.out.println("重置个人密码失败，位置ReaderDAo，修改密码");
        }
        return flag;
    }

}
