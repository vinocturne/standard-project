package org.standard.project.wishList;

public class WishListProductVO {
	//상품아이디, 부모아이디, 상품명, 컬러, 사이즈, 이미지, 재고,가격
	private String p_Id, parent_p_Id, pp_Name,p_Color,p_Size,pp_thumb;
	private int p_Stack,p_Price,p_Brand;
	public int getP_Brand() {
		return p_Brand;
	}
	public void setP_Brand(int p_Brand) {
		this.p_Brand = p_Brand;
	}
	public String getP_Id() {
		return p_Id;
	}
	public void setP_Id(String p_Id) {
		this.p_Id = p_Id;
	}
	public String getParent_p_Id() {
		return parent_p_Id;
	}
	public void setParent_p_Id(String parent_p_Id) {
		this.parent_p_Id = parent_p_Id;
	}
	public String getPp_Name() {
		return pp_Name;
	}
	public void setPp_Name(String pp_Name) {
		this.pp_Name = pp_Name;
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
	public String getPp_thumb() {
		return pp_thumb;
	}
	public void setPp_thumb(String pp_thumb) {
		this.pp_thumb = pp_thumb;
	}
	public int getP_Stack() {
		return p_Stack;
	}
	public void setP_Stack(int p_Stack) {
		this.p_Stack = p_Stack;
	}
	public int getP_Price() {
		return p_Price;
	}
	public void setP_Price(int p_Price) {
		this.p_Price = p_Price;
	}
	@Override
	public String toString() {
		return "WishListProductVO [p_Id=" + p_Id + ", parent_p_Id=" + parent_p_Id + ", pp_Name=" + pp_Name
				+ ", p_Color=" + p_Color + ", p_Size=" + p_Size + ", pp_thumb=" + pp_thumb + ", p_Stack=" + p_Stack
				+ ", p_Price=" + p_Price + ", p_Brand=" + p_Brand + "]";
	}
	
	

}
