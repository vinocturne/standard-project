package org.standard.project.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.standard.project.brand.BrandDBVO;
import org.standard.project.customer.CustomerVO;
import org.standard.project.magazine.MagazineVO;
import org.standard.project.order.OrderHistoryVO;

@Service("ProductParentService")
public class ProductParentServiceImpl implements ProductParentService{
	@Autowired
	private ProductParentDAO productParentDAO;
	
	@Override
	public ArrayList<ProductParentVO> listProductParent(BrandDBVO loginBrand) {
		return productParentDAO.listProductParent(loginBrand);
	}
	
	@Override
	public void registProductParent(ProductParentVO vo) {
		productParentDAO.registProductParent(vo);
	}
	
	public int cntBrandProductParent(BrandDBVO vo) throws Exception {
		return productParentDAO.cntBrandProductParent(vo);
	}

	@Override
	public void deleteParentProduct(String parent_p_Id) {
		productParentDAO.deleteParentProduct(parent_p_Id);
		
	}
	
	@Override
	public ProductParentVO selectParentProduct(String parent_p_Id) {
		return productParentDAO.selectParentProduct(parent_p_Id);
	}
	
	@Override
	public void modifyParentProductWithoutImage(ProductParentVO vo) {
		productParentDAO.modifyParentProductWithoutImage(vo);
	}

	@Override
	public void modifyParentProductWithImage(ProductParentVO vo) {
		productParentDAO.modifyParentProductWithImage(vo);
	}


	@Override
	public List<ProductParentVO> showManProductList() {
		return productParentDAO.showManProductList();
	}

	@Override
	public List<ProductParentVO> showWomanProductList() {
		return productParentDAO.showWomanProductList();
	}
}
