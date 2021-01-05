package org.standard.project.wishList;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("wishListDAO")
public class WishListDAO {
	@Autowired 
	SqlSessionTemplate mySQL;
	
	private String loc = "org.standard.project.WishListMapper.";
	
	public List<WishListVO> getWishList(String c_Id) {
		System.out.println("wishListDAO 의 c_Id : "+c_Id);
		List<WishListVO> wishList = mySQL.selectList(loc+"getWishList",c_Id);
		return wishList;
	}

	public WishListProductVO getProductVO(String p_Id) {
		WishListProductVO productVO = mySQL.selectOne(loc+"getProductInfo",p_Id);
		return productVO;
	}

	public void deleteWishList(WishListVO wishListVO) {
		mySQL.delete(loc+"deleteWishList",wishListVO);
		
	}

	public void addWishList(WishListVO vo) {
		mySQL.insert(loc+"add",vo);
		
	}

}
