package org.standard.project.wishList;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

public class WishListServiceImpl implements WishListService {
	@Autowired
	private WishListDAO wishListDAO;

	@Override
	public ArrayList<WishListVO> getWishList(String c_Id) {
		ArrayList<WishListVO> wishList = new ArrayList<WishListVO>();
		wishList = (ArrayList<WishListVO>)wishListDAO.getWishList(c_Id);
		return wishList;
	}

	@Override
	public WishListProductVO getProductInfo(String p_Id) {
		WishListProductVO productVO = (WishListProductVO)wishListDAO.getProductVO(p_Id);
		return productVO;
	}


}
