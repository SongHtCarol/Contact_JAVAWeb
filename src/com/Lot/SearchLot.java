package com.Lot;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.contact.MySQLDBCon;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;


public class SearchLot {
	private static SearchLot instance = null;

    public static SearchLot getInstance() {
        if (instance == null) {
            instance = new SearchLot();
        }
        return instance;
    }
    public Map<String,String> SearchLotInfo(String lot_id){
    	Map<String,String> lotInfo = new HashMap<String,String>();
    	Connection conn = null;
    	
        try {
            conn = (Connection) MySQLDBCon.getCon(); // 建立数据库连接
            String sql1 = "select* from project.s_lots where lot_id = ";
            	sql1 += lot_id;
            Statement stmt=(Statement) conn.createStatement();                                                                                             // SQL语句=
            ResultSet rs=stmt.executeQuery(sql1); // 创建用户操作执行SQL语句的PreparedStatement对象
            lotInfo.put("lotId", lot_id);
            while(rs.next()) {
	            //System.out.println(rs.getString("user_name"));
            	
	            lotInfo.put("lotName", rs.getString("lot_name"));
	            lotInfo.put("yearTime", rs.getString("year_time"));
	            lotInfo.put("postTime", rs.getString("post_time"));
	            lotInfo.put("sourceFrom", rs.getString("source_from"));
	            lotInfo.put("labelInfo", rs.getString("label"));
	            lotInfo.put("sizeInfo", rs.getString("size"));
	            
	            lotInfo.put("situation", rs.getString("situation"));
	            //System.out.println("searchLot->situation = "+rs.getString("situation"));
	            lotInfo.put("price", rs.getString("price"));
	            lotInfo.put("payMethod", rs.getString("pay_method"));
	            lotInfo.put("picker", rs.getString("picker"));
	            lotInfo.put("pickerEmail", rs.getString("picker_email"));
	            lotInfo.put("pickerPhone", rs.getString("picker_phone"));
	            lotInfo.put("pickDate", rs.getString("pick_date"));
	            
	            
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
        return lotInfo;
        
    }
    
    public StringBuilder SearchLotTable(){
    	StringBuilder lotTable = new StringBuilder();
    	Connection conn = null;
    	String lot_id = "";
    	String effective_date = "";
        try {
            conn = (Connection) MySQLDBCon.getCon(); // 建立数据库连接
            String sql1 = "select* from project.s_lots order by situation";
     
            Statement stmt=(Statement) conn.createStatement();                                                                                             // SQL语句=
            ResultSet rs=stmt.executeQuery(sql1); // 创建用户操作执行SQL语句的PreparedStatement对象
            
            while(rs.next()) {
	            //System.out.println(rs.getString("user_name"));
            	lot_id  = rs.getString("lot_id");
            	effective_date = getEffectiveDate(lot_id);
            	
            	lotTable.append("<div class=\"panel panel-success\">\r\n" + 
            			"<div class=\"panel-heading\">\r\n" + 
            			"<h3 class=\"panel-title\">ID: "+lot_id+"号拍品</h3>\r\n" + 
            			"</div>\r\n" + 
            			"<div class=\"panel-body\">\r\n" + 
            			"<div>\r\n" + 
            			"<table class=\"table table-bordered\" style=\"text-align:center;\">\r\n" + 
            			"<caption >拍品名称: "+rs.getString("lot_name")+"</caption>\r\n" + 
            			"<tbody >\r\n" + 
            			"<tr>\r\n" + 
            			"<td colspan=\"6\" >拍品规格</td>\r\n" + 
            			"</tr>\r\n" + 
            			"<tr>\r\n" + 
            			"<td>年代</td><td>"+rs.getString("year_time")+"</td>\r\n" + 
            			"<td>上拍时间</td><td>"+rs.getString("post_time")+"</td>\r\n" + 
            			"<td>传承</td><td>"+rs.getString("source_from")+"</td>\r\n" + 
            			"</tr>\r\n" + 
            			"<tr>\r\n" + 
            			"<td>款识</td><td colspan=\"2\">"+rs.getString("label")+"</td>\r\n" + 
            			"<td>尺寸</td><td colspan=\"2\">"+rs.getString("size")+"</td>\r\n" + 
            			"</tr>\r\n" + 
            			"<tr>\r\n" + 
            			"<td>成交状态</td><td colspan=\"2\">"+rs.getString("situation")+"</td>\r\n" + 
            			"<td>签约时间</td><td colspan=\"2\">"+effective_date+"</td>\r\n" + 
            			"</tr>\r\n" + 
            			"</tbody>\r\n" + 
            			"</table>\r\n" + 
            			"</div>\r\n" + 
            			"</div>\r\n" + 
            			"</div>");
            	
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
        return lotTable;
        
    }
    
    public String getEffectiveDate(String lot_id) {
    	String effective_date = "";
    	Connection conn = null;
    	try {
    		conn = (Connection) MySQLDBCon.getCon();
    		String sql1 = "select effective_date from s_contacts where lot_id = '"+lot_id+"';";
    		Statement stmt = (Statement)conn.createStatement();
    		ResultSet rs = stmt.executeQuery(sql1);
    		
    		while(rs.next()) {
    			effective_date = rs.getString(1);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			conn.close();
    		}catch(SQLException e) {
    			e.printStackTrace();
    		}
    	}
    	return effective_date;
    }
 
}
