package org.standard.project.product;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.standard.project.brand.BrandDBVO;
import org.standard.project.order.OrderHistoryVO;
import org.standard.project.wishList.WishListVO;
import org.springframework.beans.factory.annotation.Autowired;

@Repository("ProductChildDAO")
public class ProductChildDAO {
	@Autowired
	SqlSessionTemplate mySQL;
	
	private String loc = "org.standard.project.ProductMapper.";
	
	public ArrayList<ProductChildVO> listProductChild(String parent_p_Id) {
		ArrayList<ProductChildVO> listProductChild = new ArrayList<ProductChildVO>();
		listProductChild =(ArrayList) mySQL.selectList(loc+"listProductChild",parent_p_Id);
		return listProductChild;
	}
	
	public void registProductChild(ProductChildVO vo) {
		mySQL.insert(loc+"registProductChild", vo);
	}
	
	public void deleteChildProduct(String p_Id) {
		mySQL.delete(loc+"deleteChildProduct", p_Id);
	}
	
	public void modifyChildProduct(ProductChildVO vo) {
		mySQL.update(loc+"modifyChildProduct", vo);
	}

	public void purchase(WishListVO wishListVO) {
		mySQL.update(loc+"purchase", wishListVO);
		
	}

	public int checkStack(String string) {
		return mySQL.selectOne(loc+"checkStack",string);
	}

	public List<String> optionColor(String parent_p_Id) {
		return mySQL.selectList(loc+"optionColor", parent_p_Id);
	}

	public List<String> optionSize(String parent_p_Id) {
		return mySQL.selectList(loc+"optionSize", parent_p_Id);
	}

	public List<ProductChildVO> selectProductDetail(String parent_p_Id) {
		return mySQL.selectList(loc+"stockCheck", parent_p_Id);
	}


}
