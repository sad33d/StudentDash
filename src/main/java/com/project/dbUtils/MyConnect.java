package com.project.dbUtils;

import java.sql.Connection;
import java.sql.DriverManager;

final public class MyConnect {
	
	private static Connection con;
	private static String url="jdbc:mysql://localhost:3306/studentapp";
	private static String dbun="root";
	private static String dbpwd="root";

	public static Connection connect(){
		try {


			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url,dbun,dbpwd);
		} catch (Exception e) {

			e.printStackTrace();

		}
		return con;
	}
}
