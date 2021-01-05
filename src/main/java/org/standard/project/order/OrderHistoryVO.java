package org.standard.project.order;

import java.sql.Date;

public class OrderHistoryVO {
	//FK: p_Id (reference product(p_id)), p_Price (reference product(p_Price))
	private int o_Num, p_Price, o_Quantity, o_TotalPrice, o_BrandId;
    public String getParent_p_Id() {
		return parent_p_Id;
	}
	public void setParent_p_Id(String parent_p_Id) {
		this.parent_p_Id = parent_p_Id;
	}
	private String c_Id, p_Id, o_Delivery;
    private Date o_Date;
    private String zipcode,o_Address1,o_Address2,o_Name,o_Phone1,o_Phone2;
    private String parent_p_Id;
	public int getO_BrandId() {
		return o_BrandId;
	}
	public void setO_BrandId(int o_BrandId) {
		this.o_BrandId = o_BrandId;
	}
	public int getO_Num() {
		return o_Num;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getO_Address1() {
		return o_Address1;
	}
	public void setO_Address1(String o_Address1) {
		this.o_Address1 = o_Address1;
	}
	public String getO_Address2() {
		return o_Address2;
	}
	public void setO_Address2(String o_Address2) {
		this.o_Address2 = o_Address2;
	}
	public String getO_Name() {
		return o_Name;
	}
	public void setO_Name(String o_Name) {
		this.o_Name = o_Name;
	}
	public String getO_Phone1() {
		return o_Phone1;
	}
	public void setO_Phone1(String o_Phone1) {
		this.o_Phone1 = o_Phone1;
	}
	public String getO_Phone2() {
		return o_Phone2;
	}
	public void setO_Phone2(String o_Phone2) {
		this.o_Phone2 = o_Phone2;
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
				+ ", o_TotalPrice=" + o_TotalPrice + ", o_BrandId=" + o_BrandId + ", c_Id=" + c_Id + ", p_Id=" + p_Id
				+ ", o_Delivery=" + o_Delivery + ", o_Date=" + o_Date + ", zipcode=" + zipcode + ", o_Address1="
				+ o_Address1 + ", o_Address2=" + o_Address2 + ", o_Name=" + o_Name + ", o_Phone1=" + o_Phone1
				+ ", o_Phone2=" + o_Phone2 + ", parent_p_Id=" + parent_p_Id + "]";
	}
    
}
