package org.standard.project.wishList;

import java.util.ArrayList;
import java.util.Map;

import org.standard.project.customer.CustomerVO;
import org.standard.project.order.OrderHistoryVO;

public interface WishListService  {
	
	ArrayList<WishListVO> getWishList(String c_Id);

	WishListProductVO getProductInfo(String p_Id);

	void deleteWishList(WishListVO wishListVO);

	void addWishList(WishListVO vo);
	


}
