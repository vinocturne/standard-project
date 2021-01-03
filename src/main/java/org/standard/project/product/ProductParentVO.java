package org.standard.project.product;

public class ProductParentVO {
	//상품등록문제 때문에 테이블 다시 설정하고 만듬
	private int pp_Brand, pp_Price, pp_Num;
	private String pp_Name, parent_p_Id, pp_Category1, pp_Category2, pp_thumb, pp_image;
	public int getPp_Num() {
		return pp_Num;
	}
	public void setPp_Num(int pp_Num) {
		this.pp_Num = pp_Num;
	}
	public int getPp_Brand() {
		return pp_Brand;
	}
	public void setPp_Brand(int pp_Brand) {
		this.pp_Brand = pp_Brand;
	}
	public int getPp_Price() {
		return pp_Price;
	}
	public void setPp_Price(int pp_Price) {
		this.pp_Price = pp_Price;
	}
	public String getPp_Name() {
		return pp_Name;
	}
	public void setPp_Name(String pp_Name) {
		this.pp_Name = pp_Name;
	}
	public String getParent_p_Id() {
		return parent_p_Id;
	}
	public void setParent_p_Id(String parent_p_Id) {
		this.parent_p_Id = parent_p_Id;
	}
	public String getPp_Category1() {
		return pp_Category1;
	}
	public void setPp_Category1(String pp_Category1) {
		this.pp_Category1 = pp_Category1;
	}
	public String getPp_Category2() {
		return pp_Category2;
	}
	public void setPp_Category2(String pp_Category2) {
		this.pp_Category2 = pp_Category2;
	}
	public String getPp_thumb() {
		return pp_thumb;
	}
	public void setPp_thumb(String pp_thumb) {
		this.pp_thumb = pp_thumb;
	}
	public String getPp_image() {
		return pp_image;
	}
	public void setPp_image(String pp_image) {
		this.pp_image = pp_image;
	}
	
	@Override
	public String toString() {
		return "ProductParentVO [pp_Brand=" + pp_Brand + ", pp_Price=" + pp_Price + ", pp_Num=" + pp_Num + ", pp_Name="
				+ pp_Name + ", parent_p_Id=" + parent_p_Id + ", pp_Category1=" + pp_Category1 + ", pp_Category2="
				+ pp_Category2 + ", pp_thumb=" + pp_thumb + ", pp_image=" + pp_image + "]";
	}
}
