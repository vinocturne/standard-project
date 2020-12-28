package org.standard.project.magazine;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MagazineService")
public class MagazineServiceImpl implements MagazineService {
	@Autowired
	private MagazineDAO magazineDAO;
	
	
	@Override
	public List<MagazineVO> getMagazineList(MagazineVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void writeMagazine(MagazineVO vo) {
		magazineDAO.writeMagazine(vo);
	}

}
