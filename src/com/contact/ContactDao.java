package com.contact;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.user.UserDao;

public class ContactDao {
	private static ContactDao instance = null;

    public static ContactDao getInstance() {
        if (instance == null) {
            instance = new ContactDao();
        }
        return instance;
    }
    
    public Map<String,String> getContactInfo(String contact_id) {
    	Map<String,String> contactInfo = new HashMap<String,String>();
    	Connection conn = null;
    	String cus_id = "";
    	String lot_id = "";
    	String user_id = "";
        try {
            conn = (Connection) MySQLDBCon.getCon(); // 建立数据库连接
            String sql1 = "select* from project.s_contacts where contact_id = ";
            	sql1 += contact_id;
            System.out.println("ContactDAO_32 ： "+sql1);
            	Statement stmt=(Statement) conn.createStatement();                                                                                             // SQL语句=
            ResultSet rs=stmt.executeQuery(sql1); // 创建用户操作执行SQL语句的PreparedStatement对象
            contactInfo.put("contactId", contact_id);
            while(rs.next()) {
	            //System.out.println(rs.getString("user_name"));
            	contactInfo.put("CreateDate", rs.getString("create_date"));
            	contactInfo.put("EffectiveDate", rs.getString("effective_date"));
            	contactInfo.put("LotId", rs.getString("lot_id"));
            	contactInfo.put("CustomerId", rs.getString("cus_id"));
            	contactInfo.put("UserId", rs.getString("user_id"));
            	contactInfo.put("Star", rs.getString("star"));
            	cus_id = rs.getString("cus_id");
            	lot_id = rs.getString("lot_id");
            	user_id = rs.getString("user_id");
            }rs.last();
            
            System.out.println("ContactDao : "+cus_id);
            
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return contactInfo;
        
    }
}
