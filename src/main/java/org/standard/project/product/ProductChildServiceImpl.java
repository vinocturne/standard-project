package org.standard.project.product;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.standard.project.brand.BrandDBVO;

@Service("ProductChildService")
public class ProductChildServiceImpl implements ProductChildService {
	@Autowired
	private ProductChildDAO ProductChildDAO;
	
	public ArrayList<ProductChildVO> listProductChild(BrandDBVO loginBrand) {
		return ProductChildDAO.listProductChild(loginBrand);
	}
}
