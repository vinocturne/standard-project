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
	
//	magazineList 불러오기
//	public List<MagazineVO> getMagazineList(MagazineVO vo) {
//		return mySQL.selectOne(loc+"", vo);
//	}
		
	public void writeMagazine(MagazineVO vo) {
		mySQL.insert(loc+"writeMagazine", vo);
	}
	
}