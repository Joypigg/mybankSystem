package com.bank.dao;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.bank.po.Customer;
import com.bank.util.BaseDaoImpl;

public class CustomerDao {
	BaseDaoImpl baseDao = new BaseDaoImpl();

	// 取钱
	public boolean take(String idcard, double money) {
		String sql = "update customer set custmoney=custmoney-? where custidcard=?";
		Object[] params = new Object[] { money, idcard };
		int row = baseDao.executeAll(sql, params);
		if (row == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 存钱
	public boolean save(String idcard, double money) {
		String sql = "update customer set custmoney=custmoney+? where custidcard=?";
		Object[] params = new Object[] { money, idcard };
		int row = baseDao.executeAll(sql, params);
		if (row == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 余额
	public double balance(String idcard) {
		String sql = "select custmoney from customer where custidcard=?";
		Object[] params = new Object[] { idcard };
		double mMoney = (double) baseDao.query(sql, new ScalarHandler<>(), params);
		return mMoney;
	}

	// 改密码
	public boolean modifyPWD(String idcard, String newPWD) {
		String sql = "update customer set custpwd=? where custidcard=?";
		Object[] params = new Object[] { newPWD, idcard };
		int row = baseDao.executeAll(sql, params);
		if (row == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 转账
	public boolean transfer(String from_CustIdCard, double transferMoney, String to_CustIdCard) {
		double myMoney = this.balance(from_CustIdCard);
		if (myMoney >= transferMoney) {
			String sql_from = "update customer set custmoney=custmoney-? where custidcard=?";
			String sql_to = "update customer set custmoney=custmoney+? where custidcard=?";
			Object[] params_from = new Object[] { transferMoney, from_CustIdCard };
			Object[] params_to = new Object[] { transferMoney, to_CustIdCard };
			int from = baseDao.executeAll(sql_from, params_from);
			int to = baseDao.executeAll(sql_to, params_to);
			if (from == to && from == 1 && to == 1) {
				return true;
			}
		}
		return false;
	}

	// 数字检测
	public boolean isNumeric(String str) {
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(str);
		if (!isNum.matches()) {
			return false;
		}
		return true;
	}

	// mian测试
	public static void main(String[] args) {
		BaseDaoImpl baseDao1 = new BaseDaoImpl();
		CustomerDao cust = new CustomerDao();
		boolean b = cust.transfer("530325199709151422", 3000, "53032519940613217");
		System.out.println(b);
		String sql = "insert into admin values(2,'张三','123456')";
		String sql2 = "select * from customer ";
		List<Customer> customerlist = (List<Customer>) baseDao1.query(sql2, new BeanListHandler<>(Customer.class),
				null);
		for (Customer u : customerlist) {
			System.out.println(u.toString());
		}
	}
}
