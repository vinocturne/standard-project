package org.standard.project.brand;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.standard.project.customer.CustomerVO;
import org.standard.project.product.ProductParentDAO;
@Service("BrandDBService")
public class BrandDBServiceImpl implements BrandDBService{
	@Autowired
	private BrandDBDAO brandDBDAO;
	
	
	@Override
	public BrandDBVO getBrandId(CustomerVO vo) {
		return brandDBDAO.getBrandId(vo);
	}


	@Override
	public void insertBrand(BrandDBVO vo) {
		brandDBDAO.insertBrand(vo);
		
	}


	@Override
	public List<BrandDBVO> getBrandList() {
		
		return brandDBDAO.getBrandList();
	}

}
