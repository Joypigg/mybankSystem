package com.bank.dao;

import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.bank.po.Customer;
import com.bank.util.BaseDaoImpl;

public class AdminDao {
	BaseDaoImpl baseDao = new BaseDaoImpl();

	// 添加客户
	public int addCust(String id, String name, String pwd, String cardId, double money, String date) {
	/*	Date dates=new Date();
		SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		simple.format(dates);*/
		String sql = "insert into customer values(?,?,?,?,?,str_to_date(date,\"'%Y-%m-%d %H:%i:%s'\"))";
		Object[] params = new Object[] { id, name, pwd, cardId, money,null};
		int add = baseDao.executeAll(sql, params);
		if (add == 1) {
			return 1;
		} else
			return -1;
	}

	// 银行储蓄总额
	public double bankSum() {
		String sql = "select sum(custmoney)  from customer";
		double sum = (double) baseDao.query(sql, new ScalarHandler<Object>(), null);
		return sum;
	}

	// 记录数
	public Object record() {
		String sql = "select count(*) from customer";
		Object count= baseDao.query(sql, new ScalarHandler<Object>(), null);
		return count;
	}
	//排行榜
	/*public Object ranking(int number) {
		String sql="select t.* from (select * from customer order by custmoney desc) t limit 0,number";
		Object customerlist=baseDao.query(sql,new BeanListHandler<Object>(Customer.class), null);
		return customerlist;
	}*/
	public static void main(String[] args) {
		AdminDao ad=new AdminDao();
		//System.out.println(ad.bankSum());
		System.out.println(ad.addCust("1004", "Cat", "456789", "53032519940613290",1000,null));
		//System.out.println(ad.record());
		//System.out.println(ad.ranking(2));
	}
}
