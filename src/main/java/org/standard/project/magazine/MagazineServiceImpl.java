package org.standard.project.magazine;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MagazineService")
public class MagazineServiceImpl implements MagazineService {
	@Autowired
	private MagazineDAO magazineDAO;
	
	
	@Override
	public List<MagazineVO> getMagazineList(MagazineVO vo) {
		return magazineDAO.getMagazineList(vo);
	}

	@Override
	public void writeMagazine(MagazineVO vo) {
		magazineDAO.writeMagazine(vo);
	}

	@Override
	public MagazineVO getMagazine(String m_Seq) {
		return magazineDAO.selectMagazine(m_Seq);
	}

}
