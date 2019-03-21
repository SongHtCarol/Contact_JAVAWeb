package com.contact;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.user.UserDao;

public class advancingContact {
	private static advancingContact instance = null;

    public static advancingContact getInstance() {
        if (instance == null) {
            instance = new advancingContact();
        }
        return instance;
    }
    
 public StringBuilder getOnlyAdvancingContacts(String user_id) {
    	
    	Connection conn = null;
    	StringBuilder active_contact = new StringBuilder(); 
    	String start = "";
    	String end = "";
        try {
            conn = (Connection) MySQLDBCon.getCon(); // 建立数据库连接
            String sql_curdate = "select current_date();\r\n" ;
            Statement stmt00=(Statement) conn.createStatement();
            ResultSet rs00=stmt00.executeQuery(sql_curdate); 
            while(rs00.next()) {
            	start = rs00.getString(1);
            	
            }
            String sql_date ="select date_add(current_date(), interval 10 day);";
            Statement stmt0=(Statement) conn.createStatement();
            ResultSet rs0=stmt0.executeQuery(sql_date); 
            while(rs0.next()) {
            	end = rs0.getString(1);
            	
            }
           
            
            String sql1 = "SELECT * \r\n" + 
            		"FROM \r\n" + 
            		" s_contacts INNER JOIN s_lots\r\n" + 
            		"ON s_contacts.lot_id=s_lots.lot_id\r\n" + 
            		"WHERE (s_lots.pick_date BETWEEN '"+
            		start+"' AND '"+end+"')AND(user_id='"+user_id+"')"+
            		"order by s_lots.pick_date;";
            System.out.println(sql1);
            Statement stmt=(Statement) conn.createStatement();                                                                                             // SQL语句=
            ResultSet rs=stmt.executeQuery(sql1); // 创建用户操作执行SQL语句的PreparedStatement对象
            
            String contact_id = "";
            String lot_id = "";
            String picker_email = "";
            while(rs.next()) {
	            //System.out.println(rs.getString("user_name"));
            	contact_id=rs.getString("contact_id");
            	lot_id = rs.getString("lot_id");
            	picker_email = rs.getString("picker_email");
            	active_contact.append("<tr>\r\n" + 
            			"<td>"+rs.getString("contact_id")+"</td>\r\n" + 
            			"<td>"+rs.getString("lot_id")+"</td>\r\n" + 
            			"<td>"+rs.getString("pick_date")+"</td>\r\n" + 
            			"<td>"+rs.getString("picker")+"</td>\r\n" + 
            			"<td>\r\n" + 
            			"<a href=\"Mailto:"+picker_email+"?&Subject=Hello&Body=你好\" >通知提货</a>\r\n" + 
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
}
