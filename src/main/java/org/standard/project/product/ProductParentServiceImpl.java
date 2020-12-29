package org.standard.project.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.standard.project.customer.CustomerVO;
import org.standard.project.order.OrderHistoryVO;

@Service("ProductParentService")
public class ProductParentServiceImpl implements ProductParentService{
	@Autowired
	private ProductParentDAO productParentDAO;
	
	@Override
	public ArrayList<ProductParentVO> listProductParent(CustomerVO customerVO) {
		
		ArrayList<ProductParentVO> listProductParent = new ArrayList<ProductParentVO>();
		listProductParent = productParentDAO.listProductParent(customerVO);
		return listProductParent;
	}
}
