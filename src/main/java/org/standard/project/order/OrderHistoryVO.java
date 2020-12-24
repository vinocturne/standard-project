package org.standard.project.order;

import java.sql.Date;

public class OrderHistoryVO {
	//FK: p_Id (reference product(p_id)), p_Price (reference product(p_Price))
	private int o_Num, p_Price, o_Quantity, o_TotalPrice;
    private String c_Id, p_Id, o_Delivery;
    private Date o_Date;
	public int getO_Num() {
		return o_Num;
	}
	public void setO_Num(int o_Num) {
		this.o_Num = o_Num;
	}
	public int getP_Price() {
		return p_Price;
	}
	public void setP_Price(int p_Price) {
		this.p_Price = p_Price;
	}
	public int getO_Quantity() {
		return o_Quantity;
	}
	public void setO_Quantity(int o_Quantity) {
		this.o_Quantity = o_Quantity;
	}
	public int getO_TotalPrice() {
		return o_TotalPrice;
	}
	public void setO_TotalPrice(int o_TotalPrice) {
		this.o_TotalPrice = o_TotalPrice;
	}
	public String getC_Id() {
		return c_Id;
	}
	public void setC_Id(String c_Id) {
		this.c_Id = c_Id;
	}
	public String getP_Id() {
		return p_Id;
	}
	public void setP_Id(String p_Id) {
		this.p_Id = p_Id;
	}
	public String getO_Delivery() {
		return o_Delivery;
	}
	public void setO_Delivery(String o_Delivery) {
		this.o_Delivery = o_Delivery;
	}
	public Date getO_Date() {
		return o_Date;
	}
	public void setO_Date(Date o_Date) {
		this.o_Date = o_Date;
	}
	@Override
	public String toString() {
		return "OrderHistoryVO [o_Num=" + o_Num + ", p_Price=" + p_Price + ", o_Quantity=" + o_Quantity
				+ ", o_TotalPrice=" + o_TotalPrice + ", c_Id=" + c_Id + ", p_Id=" + p_Id + ", o_Delivery=" + o_Delivery
				+ ", o_Date=" + o_Date + "]";
	}
    
}
