package com.user;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.contact.MySQLDBCon;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class UserRights {
	public List<String> getUserRights(String user_id){

		String JoinSql = 
				"SELECT s_users.user_id, s_rights.right_id "+
				"FROM "+
				"(s_users INNER JOIN s_right_role  "+
				"ON s_users.role_id=s_right_role.role_id)  "+
				"INNER JOIN s_rights  "+
				"ON s_right_role.right_id=s_rights.right_id "+
				"order by  s_users.user_id ";
		
		List<String> rights = new ArrayList<>();
		Connection conn = null;
		try {
            conn = (Connection) MySQLDBCon.getCon(); // 建立数据库连接
            
            Statement stmt0=(Statement) conn.createStatement();
            ResultSet rs=stmt0.executeQuery(JoinSql);
            while(rs.next()) {
            	if(rs.getString("user_id").equals(user_id)) {
            		rights.add(rs.getString("right_id"));
            	}
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
		return rights;
		
	}
}
