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

}
