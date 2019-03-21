package com.customer;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.contact.ContactDao;
import com.contact.MySQLDBCon;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class CustomerDao {
	private static CustomerDao instance = null;

    public static CustomerDao getInstance() {
        if (instance == null) {
            instance = new CustomerDao();
        }
        return instance;
    }
    
    public Map<String,String> getCustomerInfo(String cus_id) {
    	Map<String,String> customerInfo = new HashMap<String,String>();
    	Connection conn = null;
    	
    	String cus_code = "";
    	String user_id = "";
    	int cus_totalPrice = 0;
    	int cus_count = 0;
        try {
            conn = (Connection) MySQLDBCon.getCon(); // 建立数据库连接
            String sql1 = "select* from project.s_customers where cus_id = ";
            	sql1 += cus_id;
            	System.out.println(sql1);
            Statement stmt=(Statement) conn.createStatement();                                                                                             // SQL语句=
            ResultSet rs=stmt.executeQuery(sql1); // 创建用户操作执行SQL语句的PreparedStatement对象
            customerInfo.put("CustomerId", cus_id);
            while(rs.next()) {
	            //System.out.println(rs.getString("user_name"));
            	customerInfo.put("CustomerName", rs.getString("cus_name"));
            	customerInfo.put("CustomerCode", rs.getString("cus_code"));
            	customerInfo.put("CustomerPhone", rs.getString("cus_phone"));
            	customerInfo.put("CustomerRank", rs.getString("cus_rank"));
            	customerInfo.put("CustomerVIP", rs.getString("cus_VIP"));
            	customerInfo.put("UserId", rs.getString("user_id"));
            	System.out.println("dao:"+rs.getString("cus_name"));
            	cus_code = rs.getString("cus_code");
            	cus_count = getCount(cus_code);
            	customerInfo.put("cus_count", Integer.toString(cus_count));
            	cus_totalPrice = getTotal(cus_code);
            	customerInfo.put("cus_totalPrice", Integer.toString(cus_totalPrice));
            	user_id = rs.getString("user_id");
            }rs.last();
            
            System.out.println(cus_id);
            
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customerInfo;
        
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
    
    public int getTotal(String cus_code) {
    	int count = 0;
    	Connection conn = null;
        try {
            conn = (Connection) MySQLDBCon.getCon(); // 建立数据库连接
            String sql2 = "SELECT SUM(price)FROM\r\n" + 
            		"(\r\n" + 
            		"select s_customers.cus_id,s_customers.cus_code,s_contacts.contact_id,s_lots.price \r\n" + 
            		"from \r\n" + 
            		"(s_customers inner join s_contacts\r\n" + 
            		"on s_customers.cus_id = s_contacts.cus_id)\r\n" + 
            		"inner join s_lots \r\n" + 
            		"on s_contacts.lot_id = s_lots.lot_id\r\n" + 
            		"where s_customers.cus_code='"+cus_code+"') as total" ;
            Statement stmt2=(Statement) conn.createStatement();                                                                                             // SQL语句=
            ResultSet rs2=stmt2.executeQuery(sql2);
            rs2.last();     
            count = rs2.getInt(1);
            System.out.println(count);
            
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
}
