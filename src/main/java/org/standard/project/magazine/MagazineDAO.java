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
	
}