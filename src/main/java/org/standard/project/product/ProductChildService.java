package org.standard.project.product;

import java.util.ArrayList;

import org.standard.project.brand.BrandDBVO;

public interface ProductChildService {

	ArrayList<ProductChildVO> listProductChild(String parent_p_Id);
}
