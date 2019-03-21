package com.user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.Lot.LotInfo;
import com.contact.ContactInfo;
import com.contact.MySQLDBCon;
import com.customer.CustomerInfo;
import com.mysql.jdbc.Statement;

public class AddDao {
	private static AddDao instance = null;

    public static AddDao getInstance() {
        if (instance == null) {
            instance = new AddDao();
        }
        return instance;
    }

    // 保存用户注册信息
    public boolean addContact(ContactInfo contact,LotInfo lot,CustomerInfo cus,String user_id,String star) {
        Connection conn = null;
        try {
            conn = MySQLDBCon.getCon(); // 建立数据库连接
            
            String sql = 
            		"SELECT * FROM project.s_customers;";
            
            String sql1 = 
            		"INSERT INTO `project`.`s_customers` "+
            				"(`cus_name`, `cus_phone`, `user_id`,`cus_code`) "+
            				"VALUES (?, ?, ?,?);"; // insert
            String sql2 = 
            		"INSERT INTO `project`.`s_contacts` "+
            				"(`create_date`, `effective_date`, `lot_id`, `user_id`, `cus_id`, `star`) "+
            				"VALUES (?,?,?,?,?,?);"; // insert
            String sql3 = 
            		"UPDATE `project`.`s_lots` SET "+
            				"`price`='"+lot.getPrice()+
            				"', `pay_method`='"+lot.getPayMethod()+
            				"', `picker`='"+lot.getPicker()+
            				"', `situation`='成交"+
            				"', `picker_phone`='"+lot.getPickerPhone()+
            				"', `picker_email`='"+lot.getPickerEmail()+
            				"', `pick_date`='"+lot.getPickerDate()+
            				"' WHERE `lot_id`='"+lot.getLotId()+"'";
            
            Integer this_cus_id = null;
            // SQL语句=
            PreparedStatement pstmt1 = conn.prepareStatement(sql1); // 创建用户操作执行SQL语句的PreparedStatement对象
            pstmt1.setString(1, cus.getCustomerName());
            //System.out.println(cus.getCustomerName());
            pstmt1.setString(2, cus.getCustomerPhone());
            pstmt1.setString(3, user_id);
            pstmt1.setString(4, cus.getCustomerCode());
            
            Statement  stmt0 = (Statement) conn.createStatement();  
            //使用Connection来创建一个Statment对象  
            ResultSet rs0 =stmt0.executeQuery(sql); 
           
            int insert_cus = 1;
            while (rs0.next()){  
                //System.out.println("addDao->getCustomerCode = "+cus.getCustomerCode());
                //System.out.println("addDao->getCus_Code = "+rs0.getString("cus_code"));
                String CustomerCode = cus.getCustomerCode();
                String cus_code = rs0.getString("cus_code");
                if( CustomerCode.equals(cus_code) ) {
                	insert_cus = 0;
                	this_cus_id = rs0.getInt("cus_id");
                	break;
                }
            }  rs0.close();
            //System.out.println("insert_cus = "+insert_cus);
            //System.out.println("this_cus_id = "+this_cus_id);
            if(insert_cus ==1) {
            	pstmt1.executeUpdate(); // 编译执行insert语句
            	
            	String sql4 = 
                		"SELECT MAX(cus_id) AS this_cus_id FROM s_customers";
                Statement  stmt = (Statement) conn.createStatement();  
                //使用Connection来创建一个Statment对象  
                ResultSet rs =stmt.executeQuery(sql4); 
                while (rs.next()){  
                    //System.out.println(rs.getInt(1) + "/t");
                    this_cus_id = rs.getInt(1);
                }  
            }
            //System.out.println("insert_cus = "+insert_cus);
            //System.out.println("this_cus_id = "+this_cus_id);
            
            PreparedStatement pstmt2 = conn.prepareStatement(sql2); // 创建用户操作执行SQL语句的PreparedStatement对象
            pstmt2.setString(1, contact.getCreateDate());
            pstmt2.setString(2, contact.getEffectiveDate());
            pstmt2.setInt(3, lot.getLotId());
            pstmt2.setString(4, user_id);
            pstmt2.setInt(5, this_cus_id);
            pstmt2.setString(6, star);
            pstmt2.executeUpdate(); // 编译执行insert语句
            //System.out.println(sql2);
            PreparedStatement pstmt3 = conn.prepareStatement(sql3); // 
            pstmt3.executeUpdate(); // 编译执行update语句

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
