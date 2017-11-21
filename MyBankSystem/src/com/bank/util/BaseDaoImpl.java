package com.bank.util;

import java.sql.*;
import javax.sql.DataSource;
import org.apache.commons.dbutils.ResultSetHandler;
import com.bank.dao.BaseDao;

public class BaseDaoImpl implements BaseDao {
	DataSource ds = C3p0Utils.getDataSource();
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// 优化查询
	public Object query(String sql, ResultSetHandler<?> rsh, Object[] params) {

		try {
			conn = ds.getConnection();
			ps = conn.prepareStatement(sql);
			for (int i = 0; params != null && i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}
			rs = ps.executeQuery();
			Object obj = rsh.handle(rs);
			return obj;
		}catch(SQLException e) {
		e.printStackTrace();
		}finally {
			release(rs, ps, conn);
		}
		return rs;
	}

	// 增、删、改
	public int executeAll(String sql, Object[] params) {
		try {
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			for (int i = 0; params != null && i < params.length; i++) {
				ps.setObject(i + 1, params[i]);
			}
			int a = ps.executeUpdate();
			conn.commit();
			return a;
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			release(null, ps, conn);
		}
		return 0;
	}

	// 释放资源
	public void release(ResultSet rs, Statement stmt, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			rs = null;
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			stmt = null;
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn = null;
		}
	}
}
