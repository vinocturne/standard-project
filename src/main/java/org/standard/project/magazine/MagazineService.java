package org.standard.project.magazine;

import java.util.List;
import java.util.Map;

import org.standard.project.product.ProductParentVO;

public interface MagazineService {
	List<MagazineVO> getMagazineList(MagazineVO vo);
	void writeMagazine(MagazineVO vo);
	MagazineVO getMagazine(String m_Seq);
	void modifyMagazineWithoutImg(MagazineVO vo);
	void modifyMagazineWithImg(MagazineVO vo);
	void deleteMagazine(String m_Seq);
	void hitIncrease(String m_Seq);
	MagazineVO selectMagazine(int m_Seq);

}
