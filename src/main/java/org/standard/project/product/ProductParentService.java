package org.standard.project.product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.standard.project.brand.BrandDBVO;
import org.standard.project.customer.CustomerVO;
import org.standard.project.order.OrderHistoryVO;

public interface ProductParentService {
	
	ArrayList<ProductParentVO> listProductParent(BrandDBVO loginBrand);
	
}
