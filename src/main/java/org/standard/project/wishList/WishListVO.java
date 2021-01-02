package org.standard.project.wishList;

public class WishListVO {
	//FK: p_Id (reference Customer(c_Id)), p_Id (reference product(p_Id)), p_Price (reference product(p_Price))
	private int w_Quantity, p_Price;
    private String c_Id, p_Id;
	public int getW_Quantity() {
		return w_Quantity;
	}
	public void setW_Quantity(int w_Quantity) {
		this.w_Quantity = w_Quantity;
	}
	public int getP_Price() {
		return p_Price;
	}
	public void setP_Price(int p_Price) {
		this.p_Price = p_Price;
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
	@Override
	public String toString() {
		return "WishListVO [w_Quantity=" + w_Quantity + ", p_Price=" + p_Price + ", c_Id=" + c_Id + ", p_Id=" + p_Id
				+ "]";
	}
    
}
