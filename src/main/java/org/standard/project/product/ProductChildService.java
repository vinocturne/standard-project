package org.standard.project.product;

import java.util.ArrayList;
import java.util.List;

import org.standard.project.brand.BrandDBVO;
import org.standard.project.wishList.WishListVO;

public interface ProductChildService {

	ArrayList<ProductChildVO> listProductChild(String parent_p_Id);
	ProductChildVO selectProductDetail(String parent_p_Id);
	void registProductChild(ProductChildVO vo);
	void deleteChildProduct(String p_Id);
	void modifyChildProduct(ProductChildVO vo);

	void purchase(WishListVO wishListVO);
	int checkStack(String string);
	List<String>optionColor(String parent_p_Id);
	List<String>optionSize(String parent_p_Id);
	ProductChildVO selectProductChildDetail(String p_Id);
	
}
