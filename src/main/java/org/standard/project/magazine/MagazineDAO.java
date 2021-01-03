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

	public void hitIncrease(String m_Seq) {
		mySQL.update(loc+"hitIncrease",m_Seq);
		
	}

	public MagazineVO selectMagazine(int m_Seq) {
		return mySQL.selectOne(loc+"selectMagazine",m_Seq);
	}
	
}