package cn.xt.sms.test;

import cn.xt.sms.util.Render;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @Auther: xietao
 * @Date: 2018/7/19
 * @Description:
 */
public class SqlTest {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        String URL="jdbc:mysql://127.0.0.1:3306/supplier_manager?useUnicode=true&amp;characterEncoding=utf-8&allowMultiQueries=true";
        String USER="root";
        String PASSWORD="root";
        //1.加载驱动程序
        Class.forName("com.mysql.jdbc.Driver");
        //2.获得数据库链接
        Connection conn=DriverManager.getConnection(URL, USER, PASSWORD);
        //3.通过数据库的连接操作数据库，实现增删改查（使用Statement类）
        Statement st=conn.createStatement();
        //查询出所有ID
        ResultSet resultSet = st.executeQuery("SELECT `id` FROM `table_supplier` ORDER BY `enter_date`;");
        int no = 1;
        String noStr = "1";
        StringBuffer buffer = new StringBuffer("");
        try {
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                System.out.println(Render.renderInfo("当前执行ID：" + id));
                noStr = LocalDateTime.now().getYear() + String.format("%04d", no ++);
                System.out.println(Render.renderInfo("当前执行编号：" + noStr));
                buffer.append("UPDATE `table_supplier` SET `no` = " + noStr + " WHERE `id` = " + id + ";");
            }
            resultSet.close();
            //根据ID修改NO
            st.executeUpdate(buffer.toString());
            System.out.println(Render.renderSuccess("执行成功！"));
        } finally {
            st.close();
            conn.close();
        }

    }
}
