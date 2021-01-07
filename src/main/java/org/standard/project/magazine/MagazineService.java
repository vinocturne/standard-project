package org.standard.project.magazine;

import java.util.List;
import java.util.Map;

import org.standard.project.product.ProductParentVO;

public interface MagazineService {
	List<MagazineVO> getMagazineList(MagazineVO vo);
	List<MagazineVO> searchMagazineViewList(String m_Title);
	void writeMagazine(MagazineVO vo);
	MagazineVO getMagazine(String m_Seq);
	void modifyMagazineWithoutImg(MagazineVO vo);
	void modifyMagazineWithImg(MagazineVO vo);
	void deleteMagazine(String m_Seq);
	void hitIncrease(int mm_Seq);
	MagazineVO selectMagazine(int m_Seq);
	String magazineLikeCheck(MagazineLikeVO vo);
	void makeLikeRow(MagazineLikeVO vo);
	int getLikeCnt(int mm_Seq);
	void updateLikeCntPlus(MagazineVO mVO);
	void updateLikeCntMinus(MagazineVO mVO);
	void likeCheckInit(MagazineLikeVO mlVO);
	void likeCheckPlus(MagazineLikeVO mlVO);
}
