package com.bank.dao;

import java.sql.*;
import org.apache.commons.dbutils.ResultSetHandler;

public interface BaseDao {
	public Object query(String sql,ResultSetHandler<?> rsh,Object[] params) throws SQLException;
	public int executeAll(String sql, Object[] params);
	public void release(ResultSet rs,Statement stmt,Connection conn);
}
