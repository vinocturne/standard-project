package org.standard.project.product;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ProductParentService")
public class ProductParentServiceImpl implements ProductParentService{
	@Autowired
	private ProductParentDAO productParentDAO;
	
	public List<Map<String, Object>> listProductParent(Map<String, Object> map) {
		return productParentDAO.listProductParent(map);
	}
}
