package com.lpy.dao;

import com.lpy.bean.book;
import com.lpy.bean.history;
import com.lpy.util.DUtil;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {

    /**管理员登录*/
    public boolean Login(String id,String password,String username){
        boolean flag = false;
        DUtil.databean();
        String sql = "select * from admin where admin_id='"+id+"' and admin_name='"+username+"' and admin_pwd='"+password+"'";
        ResultSet rs = DUtil.executeQuery(sql);
        try {
            if(rs.next()){
                flag = true;
            }
        }catch (Exception e){
            System.out.println("管理员登录失败，位置AdminDao，登录");
        }
        DUtil.close();
        return flag;
    }

    /**管理员修改密码*/
    public boolean AdminModifyPwd(String id,String old_pwd,String new_pwd){
        boolean flag = false;
        DUtil.databean();
        String sql = "select * from admin where admin_id='"+id+"' and admin_pwd='"+old_pwd+"'";
        String sqll = "update admin set admin_pwd='"+new_pwd+"' where admin_id='"+id+"'";
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
            System.out.println("修改个人密码失败，位置AdminDAo，修改密码");
        }
        return flag;
    }

    /**注册读者*/
    public boolean Register(String name,String sex,String date,String age,String id,String dept,String major,String Class,String email,String phone,String pwd){
        boolean flag = false;
        DUtil.databean();
        String sql = "select * from reader where reader_number='"+id+"'";
        System.out.println(sql);
        String sqll = "insert into reader(reader_name,reader_sex,reader_birthday,reader_age,reader_number,reader_dept,reader_major,reader_class,reader_email,reader_phone,reader_pwd) values('"+name+"','"+sex+"','"+date+"','"+age+"','"+id+"','"+dept+"','"+major+"','"+Class+"','"+email+"','"+phone+"','"+pwd+"')";
        ResultSet rs = DUtil.executeQuery(sql);
        int i = DUtil.executeUpdate(sqll);
        try{
            if(rs.next()){
                flag = false;
            }else {
                if (i>0){
                    flag = true;
                }else {
                    flag = false;
                }
            }
            DUtil.close();
        }catch (Exception e){
            System.out.println("注册失败，位置AdminDAO，注册");
        }
        return flag;
    }

    public boolean InsertBook(String id,String name,String isbn,String author,String press,String type,String money,String count,String remain_count){
        boolean flag = false;
        DUtil.databean();
        String sql = "insert into book values('"+id+"','"+isbn+"','"+name+"','"+author+"','"+press+"','"+type+"','"+count+"','"+remain_count+"','"+money+"')";
        int n = DUtil.executeUpdate(sql);
        try{
            if (n>0){
                flag = true;
            }
        }catch (Exception e){
            System.out.println("添加失败！AdminDao");
            flag = false;
        }
        return flag;
    }

    /**修改图书信息*/
   public boolean XiuGai(String book_isbn,String book_name,String book_press,String book_type,String book_author,String book_count){
        boolean flag = false;
        DUtil.databean();
        String sql = "update book set book_name='"+book_name+"',book_press='"+book_press+"',book_type='"+book_type+"',book_author='"+book_author+"',book_count='"+book_count+"' where book_isbn='"+book_isbn+"'";
        try{
            int i = DUtil.executeUpdate(sql);
            if(i>0){
                flag = true;
            }else {
                flag = false;
            }
            DUtil.close();
        }catch (Exception e){
            System.out.println("修改图书信息失败，位置AdminDao");
        }
        return flag;
   }


   /**借阅*/
    public boolean Rent(String reader_name,String reader_number,String reader_book_name,String reader_book_isbn,String reader_rent_date){
        boolean flag = false;
        DUtil.databean();
//        group by '"+reader_number+"' having count(*)>1
        String sql = "select * from history where reader_number='"+reader_number+"' ";
//        String sq = "select reader_number from history group by '"+reader_number+"' having count(*)>=2";
        String ins = "insert into history(reader_number,reader_name,book_name,book_isbn,reader_rent_date) values('"+reader_number+"','"+reader_name+"','"+reader_book_name+"','"+reader_book_isbn+"','"+reader_rent_date+"')";
        String in = "update reader set book_isbn='"+reader_book_isbn+"' where reader_number='"+reader_number+"' ";
        String reduce = "update book set book_remain_count=book_remain_count-1 where book_isbn='"+reader_book_isbn+"'";
        System.out.println(ins);
        ResultSet rs = DUtil.executeQuery(sql);
//        ResultSet res = DUtil.executeQuery(sq);

        try{
            if(rs.next()){
                flag = false;
            }else {
                int i = DUtil.executeUpdate(ins);
                int m = DUtil.executeUpdate(in);
                int n = DUtil.executeUpdate(reduce);
                if (i>0&&n>0&&m>0){
                    flag = true;
                }else {
                    flag = false;
                }
            }
        }catch (Exception e){
            flag = false;
            System.out.println("借阅失败。位置AdminDao");
        }
        return flag;
    }

    /**借阅信息*/
    public List<history> SentAllBook(){
        List<history> list = new ArrayList<history>();
        String sql = "select * from history,book,reader where history.reader_number=reader.reader_number and history.book_isbn = book.book_isbn ";
        DUtil.databean();
        ResultSet rs = DUtil.executeQuery(sql);
        try{
            while (rs.next()){
                history h = new history();
                h.setReader_name(rs.getString("history.reader_name"));
                h.setReader_number(rs.getString("history.reader_number"));
                h.setReader_dept(rs.getString("reader.reader_dept"));
                h.setReader_major(rs.getString("reader.reader_major"));
                h.setReader_phone(rs.getString("reader.reader_phone"));
                h.setBook_name(rs.getString("history.book_name"));
                h.setBook_isbn(rs.getString("history.book_isbn"));
                h.setBook_press(rs.getString("book.book_press"));
                System.out.println(rs.getString("history.book_name"));
                h.setBook_type(rs.getString("book.book_type"));
                h.setBook_author(rs.getString("book.book_author"));
                h.setReader_rent_date(rs.getString("history.reader_rent_date"));
                list.add(h);
                for(int n=1;n<list.size();n++){
                    System.out.println(list.get(n));
                }
            }
            DUtil.close();
        }catch (Exception e){
            System.out.println("借阅信息查询失败。位置AdminDao");
            list = null;
        }
        return list;
    }

    public boolean SendBook(String reader_number,String book_isbn){
        boolean flag = false;
        String sql = "delete from history where reader_number='"+reader_number+"' and book_isbn='"+book_isbn+"'";
        String ins = "update book set book_remain_count = book_remain_count+1 where book_isbn='"+book_isbn+"'";
        DUtil.databean();
        int i = DUtil.executeUpdate(sql);
        int m = DUtil.executeUpdate(ins);
        try{
            if (i>0&&m>0){
                flag = true;
            }else {
                flag = false;
            }
        }catch (Exception e){
            System.out.println("还书失败");
            flag = false;
        }
        return flag;
    }

}
