package com.user;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.contact.MySQLDBCon;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class UserDao {
	private static UserDao instance = null;

    public static UserDao getInstance() {
        if (instance == null) {
            instance = new UserDao();
        }
        return instance;
    }
    
    public Map<String,String> getUserInfo(String user_id) {
    	Map<String,String> userInfo = new HashMap<String,String>();
    	Connection conn = null;
    	String dept_id = "";
    	String role_id = "";
        try {
            conn = (Connection) MySQLDBCon.getCon(); // 建立数据库连接
            String sql1 = "select* from project.s_users where user_id = ";
            	sql1 += user_id;
            Statement stmt=(Statement) conn.createStatement();                                                                                             // SQL语句=
            ResultSet rs=stmt.executeQuery(sql1); // 创建用户操作执行SQL语句的PreparedStatement对象
            userInfo.put("userId", user_id);
            while(rs.next()) {
	            //System.out.println(rs.getString("user_name"));
	            userInfo.put("userName", rs.getString("user_name"));
	            userInfo.put("userPwd", rs.getString("user_pwd"));
	            userInfo.put("userPhone", rs.getString("user_phone"));
	            userInfo.put("userCode", rs.getString("user_code"));
	            dept_id = rs.getString("dept_id");
	            userInfo.put("dept_id", dept_id);
	            
	            role_id = rs.getString("role_id");
	            char check_role = role_id.charAt(0);
	            char nextCheck = role_id.charAt(1);
	            if(check_role=='C') {//cai wu bu
	            	userInfo.put("lookStar", "no");
	            	
	            	userInfo.put("lookContactRight", "all");
	            	userInfo.put("deleteContactRight", "no");
	            	userInfo.put("updateContactRight", "no");
	            	
	            	userInfo.put("lookCusRight", "all");
	            	userInfo.put("deleteCusRight", "no");
	            	userInfo.put("updateCusRight", "no");
	            	
	            }else if((check_role=='Y')&&(nextCheck=='M')) {// zhu guan
	            	userInfo.put("lookStar", "yes");
	            	
	            	userInfo.put("lookContactRight", "all-dept");
	            	userInfo.put("deleteContactRight", "only");
	            	userInfo.put("updateContactRight", "only");
	            	
	            	userInfo.put("lookCusRight", "all-dept");
	            	userInfo.put("deleteCusRight", "only");
	            	userInfo.put("updateCusRight", "only");
	            }else if((check_role=='Y')&&(nextCheck=='E')) {
	            	userInfo.put("lookStar", "yes");
	            	
	            	userInfo.put("lookContactRight", "only");
	            	userInfo.put("deleteContactRight", "only");
	            	userInfo.put("updateContactRight", "only");
	            	
	            	userInfo.put("lookCusRight", "only");
	            	userInfo.put("deleteCusRight", "only");
	            	userInfo.put("updateCusRight", "only");
	            }
            }rs.last();
            
            System.out.println(dept_id);
            String sql2 = "select * from project.s_depts where dept_id = '";
        	sql2 += dept_id+"'";
        	Statement stmt2=(Statement) conn.createStatement(); 
        	ResultSet rs2=stmt2.executeQuery(sql2);
        	while(rs2.next()) {
        		System.out.println(rs2.getString("dept_name"));
        		userInfo.put("userDept", rs2.getString("dept_name"));
        	}rs2.last();
            
            String sql3 = "select * from project.s_roles where role_id = '";
        	sql3 += role_id+"'";
        	Statement stmt3=(Statement) conn.createStatement(); 
        	ResultSet rs3=stmt3.executeQuery(sql3);
        	while(rs3.next()) {
        		userInfo.put("userRole", rs3.getString("role_name"));
        	}rs3.last();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return userInfo;
        
    }

}
