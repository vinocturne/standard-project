package org.standard.project.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.standard.project.brand.BrandDBVO;
import org.standard.project.customer.CustomerVO;
import org.standard.project.magazine.MagazineVO;
import org.standard.project.order.OrderHistoryVO;

public interface ProductParentService {
	
	ArrayList<ProductParentVO> listProductParent(BrandDBVO loginBrand);
	List<ProductParentVO> allProductList();
	void registProductParent(ProductParentVO vo);
	int cntBrandProductParent(BrandDBVO vo) throws Exception;
	void deleteParentProduct(String parent_p_Id);
	ProductParentVO selectParentProduct(String parent_p_Id);
	void modifyParentProductWithoutImage(ProductParentVO vo);
	void modifyParentProductWithImage(ProductParentVO vo);
	
}
