package com.bank.po;

import java.util.Date;

public class Customer {
	private int custNumber;
	private String custName;
	private String custPwd;
	private String custIdCard;
	private double custMoney;
	private Date custDate;
	public Customer() {
		super();
	}
	public int getCustNumber() {
		return custNumber;
	}
	public void setCustNumber(int custNumber) {
		this.custNumber = custNumber;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustpwd() {
		return custPwd;
	}
	public void setCustpwd(String custPwd) {
		this.custPwd = custPwd;
	}
	public String getCustIdCard() {
		return custIdCard;
	}
	public void setCustIdCard(String custIdCard) {
		this.custIdCard = custIdCard;
	}
	public double getCustMoney() {
		return custMoney;
	}
	public void setCustMoney(double custMoney) {
		this.custMoney = custMoney;
	}
	public Date getCustDate() {
		return custDate;
	}
	public void setCustDate(Date custDate) {
		this.custDate = custDate;
	}
	@Override
	public String toString() {
		return "Customer [custNumber=" + custNumber + ", custName=" + custName + ", custPwd=" + custPwd
				+ ", custIdCard=" + custIdCard + ", custMoney=" + custMoney + ", custDate=" + custDate + "]";
	}
}
