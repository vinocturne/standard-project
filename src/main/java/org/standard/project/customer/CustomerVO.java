package org.standard.project.customer;

import java.sql.Date;

public class CustomerVO {
    private String c_Id, c_Password, c_Name, zipcode, c_Address1, c_Address2, c_Phone1, c_Phone2, businessNumber, c_Email, role, brandName;
    private Date c_Birthday, c_RegisterDay;
    
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getC_Id() {
		return c_Id;
	}
	public void setC_Id(String c_Id) {
		this.c_Id = c_Id;
	}
	public String getC_Password() {
		return c_Password;
	}
	public void setC_Password(String c_Password) {
		this.c_Password = c_Password;
	}
	public String getC_Name() {
		return c_Name;
	}
	public void setC_Name(String c_Name) {
		this.c_Name = c_Name;
	}
	public String getC_Address1() {
		return c_Address1;
	}
	public void setC_Address1(String c_Address1) {
		this.c_Address1 = c_Address1;
	}
	public String getC_Address2() {
		return c_Address2;
	}
	public void setC_Address2(String c_Address2) {
		this.c_Address2 = c_Address2;
	}
	public String getC_Phone1() {
		return c_Phone1;
	}
	public void setC_Phone1(String c_Phone1) {
		this.c_Phone1 = c_Phone1;
	}
	public String getC_Phone2() {
		return c_Phone2;
	}
	public void setC_Phone2(String c_Phone2) {
		this.c_Phone2 = c_Phone2;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getC_Email() {
		return c_Email;
	}
	public void setC_Email(String c_Email) {
		this.c_Email = c_Email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public Date getC_Birthday() {
		return c_Birthday;
	}
	public void setC_Birthday(Date c_Birthday) {
		this.c_Birthday = c_Birthday;
	}
	public Date getC_RegisterDay() {
		return c_RegisterDay;
	}
	public void setC_RegisterDay(Date c_RegisterDay) {
		this.c_RegisterDay = c_RegisterDay;
	}
	@Override
	public String toString() {
		return "CustomerVO [c_Id=" + c_Id + ", c_Password=" + c_Password + ", c_Name=" + c_Name + ", zipcode=" + zipcode
				+ ", c_Address1=" + c_Address1 + ", c_Address2=" + c_Address2 + ", c_Phone1=" + c_Phone1 + ", c_Phone2="
				+ c_Phone2 + ", businessNumber=" + businessNumber + ", c_Email=" + c_Email + ", role=" + role
				+ ", brandName=" + brandName + ", c_Birthday=" + c_Birthday + ", c_RegisterDay=" + c_RegisterDay + "]";
	}

	
	
}
