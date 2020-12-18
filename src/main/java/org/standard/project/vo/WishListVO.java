package org.standard.project.vo;

public class WishListVO {
	//FK: p_Id (reference Customer(c_Id)), p_Id (reference product(p_Id)), p_Price (reference product(p_Price))
	private int w_Quantity, p_Price;
    private String c_Id, p_Id;
}
