package com.right;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.contact.MySQLDBCon;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class DeptRight {
	private static DeptRight instance = null;

    public static DeptRight getInstance() {
        if (instance == null) {
            instance = new DeptRight();
        }
        return instance;
    }
    
 public StringBuilder getContactTable(String dept_id,String user_id) {
    	
    	Connection conn = null;
    	StringBuilder active_contact = new StringBuilder(); 
        try {
            conn = (Connection) MySQLDBCon.getCon(); // 建立数据库连接
            String sql1 = "SELECT * \r\n" + 
            		"FROM \r\n" + 
            		"(s_contacts INNER JOIN s_customers\r\n" + 
            		"ON s_contacts.cus_id=s_customers.cus_id)\r\n" + 
            		"INNER JOIN s_users\r\n" + 
            		"ON s_users.user_id=s_customers.user_id\r\n" + 
            		"where  s_users.dept_id='"+dept_id+"';";
            //System.out.println(sql1);
            Statement stmt=(Statement) conn.createStatement();                                                                                             // SQL语句=
            ResultSet rs=stmt.executeQuery(sql1); // 创建用户操作执行SQL语句的PreparedStatement对象
            
            String contact_id = "";
            String lot_id = "";
            while(rs.next()) {
	            //System.out.println(rs.getString("user_name"));
            	contact_id=rs.getString("contact_id");
            	lot_id = rs.getString("lot_id");
            	
            	active_contact.append("<tr>\r\n" + 
            			"<td>"+rs.getString("contact_id")+"</td>\r\n" + 
            			"<td>"+rs.getString("effective_date")+"</td>\r\n" + 
            			"<td>"+rs.getString("cus_id")+"</td>\r\n" + 
            			"<td>"+rs.getString("star")+"</td>\r\n" + 
            			"<td>\r\n" + 
            			"<a type=\"button\" class=\"btn btn-default\" href=\"detail-contact.jsp?pid="+user_id+"&contact_id="+contact_id+"&lot_id="+lot_id+"\"> 查看详情</a>\r\n" + 
            			"</td>\r\n" + 
            			"</tr>");
            	System.out.println(contact_id);
            }rs.last();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
       
		return active_contact;
        
    }
    public int getCount(String cus_code) {
    	int count = 0;
    	Connection conn = null;
        try {
            conn = (Connection) MySQLDBCon.getCon(); // 建立数据库连接
            String sql2 = "SELECT s_contacts.contact_id,s_customers.cus_id ,s_customers.cus_code\r\n" + 
         		"FROM \r\n" + 
         		"s_contacts INNER JOIN s_customers \r\n" + 
         		"ON s_contacts.cus_id=s_customers.cus_id\r\n" + 
         		"where s_customers.cus_code='"+cus_code+"';" ;
            Statement stmt2=(Statement) conn.createStatement();                                                                                             // SQL语句=
            ResultSet rs2=stmt2.executeQuery(sql2);
            rs2.last();     
            count = rs2.getRow(); 
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    	return count;
    }
    public StringBuilder getCusTable(String dept_id,String user_id) {
    	Connection conn = null;
    	StringBuilder customer = new StringBuilder(); 
        try {
            conn = (Connection) MySQLDBCon.getCon(); // 建立数据库连接
            String sql1 = "SELECT * \r\n" + 
            		"FROM \r\n" + 
            		"(s_contacts INNER JOIN s_customers\r\n" + 
            		"ON s_contacts.cus_id=s_customers.cus_id)\r\n" + 
            		"INNER JOIN s_users\r\n" + 
            		"ON s_users.user_id=s_customers.user_id\r\n" + 
            		"where  s_users.dept_id='"+dept_id+"';";
            System.out.println(sql1);
            Statement stmt=(Statement) conn.createStatement();                                                                                             // SQL语句=
            ResultSet rs=stmt.executeQuery(sql1); // 创建用户操作执行SQL语句的PreparedStatement对象
            
            String cus_code = "";
            int cus_count = 0;
            String cus_id = "";
            while(rs.next()) {
	            //System.out.println(rs.getString("user_name"));
            	cus_id = rs.getString("cus_id");
            	cus_code = rs.getString("cus_code");
            	cus_count = getCount(cus_code);
            	customer.append("<tr>\r\n" + 
            			"<td>"+rs.getString("cus_id")+"</td>\r\n" + 
            			"<td>"+rs.getString("cus_name")+"</td>\r\n" + 
            			"<td>"+rs.getString("cus_phone")+"</td>\r\n" + 
            			"<td>"+cus_count+"</td>\r\n" +
            			"</tr>");
            }rs.last();
        
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
       
		return customer;
        
    }
}
