package org.standard.project.product;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.standard.project.brand.BrandDBVO;
import org.standard.project.customer.CustomerVO;
import org.standard.project.magazine.MagazineVO;
import org.standard.project.order.OrderHistoryVO;

@Repository("productParentDAO")
public class ProductParentDAO {
	@Autowired
	SqlSessionTemplate mySQL;
	
	private String loc = "org.standard.project.ProductMapper.";
	
	public ArrayList<ProductParentVO> listProductParent(BrandDBVO loginBrand) {
		ArrayList<ProductParentVO> listProductParent = new ArrayList<ProductParentVO>();
		listProductParent =(ArrayList) mySQL.selectList(loc+"listProductParent",loginBrand);
		return listProductParent;
	}
	
	public List<ProductParentVO> showManProductList() {
		List<ProductParentVO> showManProductList = mySQL.selectList(loc+"showManProductList");
		return showManProductList; 
	}
	
	public List<ProductParentVO> showWomanProductList() {
		List<ProductParentVO> showWomanProductList = mySQL.selectList(loc+"showWomanProductList");
		return showWomanProductList; 
	}
	
	public void registProductParent(ProductParentVO vo) {
		mySQL.insert(loc+"registProductParent", vo);
	}
	
	public int cntBrandProductParent(BrandDBVO vo) throws Exception {
		int result = 0;
		try {
			result = mySQL.selectOne(loc+"cntBrandProductParent", vo);
			System.out.println("개수"+result);
		} catch (NullPointerException e) {
			return  result = 0;
		} catch (Exception e) {
			throw new Exception("cntBrandProductParent==>exception.");
		}
		return  result;
	}
	
	public void deleteParentProduct(String parent_p_Id) {
		mySQL.delete(loc+"deleteParentProduct", parent_p_Id);
	}
	
	public ProductParentVO selectParentProduct(String parent_p_Id) {
		return mySQL.selectOne(loc+"selectParentProduct", parent_p_Id);
	}
	
	public void modifyParentProductWithoutImage(ProductParentVO vo) {
		mySQL.update(loc+"modifyParentProductWithoutImage", vo);
	}

	public void modifyParentProductWithImage(ProductParentVO vo) {
		mySQL.update(loc+"modifyParentProductWithImage", vo);
	}

	public List<ProductParentVO> showCategoryList(ProductParentVO vo) {
		List<ProductParentVO> showCategoryList = mySQL.selectList(loc+"showCategoryList", vo);
		return showCategoryList;
	}

}
