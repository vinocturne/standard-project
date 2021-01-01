package org.standard.project.product;

public class ProductChildVO {
	int p_Brand, p_Stack;
	String p_Id, p_Color, p_Size, p_parent_Id;
	public String getP_parent_Id() {
		return p_parent_Id;
	}
	public void setP_parent_Id(String p_parent_Id) {
		this.p_parent_Id = p_parent_Id;
	}
	public int getP_Brand() {
		return p_Brand;
	}
	public void setP_Brand(int p_Brand) {
		this.p_Brand = p_Brand;
	}
	public int getP_Stack() {
		return p_Stack;
	}
	public void setP_Stack(int p_Stack) {
		this.p_Stack = p_Stack;
	}
	public String getP_Id() {
		return p_Id;
	}
	public void setP_Id(String p_Id) {
		this.p_Id = p_Id;
	}
	public String getP_Color() {
		return p_Color;
	}
	public void setP_Color(String p_Color) {
		this.p_Color = p_Color;
	}
	public String getP_Size() {
		return p_Size;
	}
	public void setP_Size(String p_Size) {
		this.p_Size = p_Size;
	}
	
	@Override
	public String toString() {
		return "ProductChildVO [p_Brand=" + p_Brand + ", p_Stack=" + p_Stack + ", p_Id=" + p_Id + ", p_Color=" + p_Color
				+ ", p_Size=" + p_Size + ", p_parent_Id=" + p_parent_Id + "]";
	} 
	
}
