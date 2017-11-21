package com.bank.util;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3p0Utils {
	public static DataSource ds = null;
	//private final static String driverClass = "oracle.jdbc.driver.OracleDriver";
	private final static String driverClass = "com.mysql.jdbc.Driver";
	//private final static String URL = "jdbc:oracle:thin:localhost:1521:orcl";
	private final static String URL = "jdbc:mysql://bdm245434416.my3w.com/bdm245434416_db";
	private final static String user = "bdm245434416";
	private final static String pwd = "15738529080";
	static {
		ComboPooledDataSource cpds = new ComboPooledDataSource("sss");
		try{
			cpds.setDriverClass(driverClass);
			cpds.setJdbcUrl(URL);
			cpds.setUser(user);
			cpds.setPassword(pwd);
			cpds.setInitialPoolSize(2);
			cpds.setMaxPoolSize(5);
			ds = cpds;
		}catch (Exception e){
			throw new ExceptionInInitializerError(e);
		}
	}
	public static DataSource getDataSource(){
		return ds;
	}
}
