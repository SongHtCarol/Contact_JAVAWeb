package com.contact;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLDBCon {
    private static Connection conn = null;

    public static Connection getCon() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String user = "root";
            String pwd = "19951228.";
            String url = "jdbc:mysql://localhost:3306/project?characterEncoding=utf8&useSSL=true";
            conn = DriverManager.getConnection(url, user, pwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}