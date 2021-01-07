package org.standard.project.magazine;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.standard.project.customer.CustomerVO;

@Repository("magazineDAO")
public class MagazineDAO {
	@Autowired
	SqlSessionTemplate mySQL;
	
	private String loc = "org.standard.project.MagazineMapper.";
	

	public List<MagazineVO> getMagazineList(MagazineVO vo) {
		return mySQL.selectList(loc+"adminMagazineViewList", vo);
	}
	
	public List<MagazineVO> searchMagazineViewList(String m_Title) {
		return mySQL.selectList(loc+"searchMagazineViewList", m_Title);
	}
		
	public void writeMagazine(MagazineVO vo) {
		mySQL.insert(loc+"writeMagazine", vo);
	}

	public MagazineVO selectMagazine(String m_Seq) {
		return mySQL.selectOne(loc+"selectMagazine", m_Seq);
	}

	public void modifyMagazineWithoutImg(MagazineVO vo) {
		mySQL.update(loc+"modifyMagazineWithoutImage", vo);
	}

	public void modifyMagazineWithImg(MagazineVO vo) {
		mySQL.update(loc+"modifyMagazineWithImage", vo);
	}

	public void deleteMagazine(String m_Seq) {
		mySQL.delete(loc+"deleteMagazine", m_Seq);
	}

	public void hitIncrease(int m_Seq) {
		mySQL.update(loc+"hitIncrease",m_Seq);
		
	}

	public MagazineVO selectMagazine(int m_Seq) {
		return mySQL.selectOne(loc+"selectMagazine",m_Seq);
	}

	public String magazineLikeCheck(MagazineLikeVO vo) {
		return mySQL.selectOne(loc+"likecheck", vo);
	}

	public void makeLikeRow(MagazineLikeVO vo) {
		mySQL.insert(loc+"makeLikeRow", vo);
	}

	public int getLikecnt(int m_Seq) {
		return mySQL.selectOne(loc+"getLikeCnt", m_Seq);
	}

	public void updateLikeCntPlus(MagazineVO mVO) {
		mySQL.update(loc+"updateLikeCntPlus", mVO);
	}

	public void updateLikeCntMinus(MagazineVO mVO) {
		mySQL.update(loc+"updateLikeCntMinus",mVO);
	}

	public void likeCheckInit(MagazineLikeVO mlVO) {
		mySQL.update(loc+"likeCheckInit",mlVO);
	}

	public void likeCheckPlus(MagazineLikeVO mlVO) {
		mySQL.update(loc+"likeCheckPlus",mlVO);
	}
	
}