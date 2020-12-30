package org.standard.project.magazine;

import java.util.List;
import java.util.Map;

public interface MagazineService {
	List<MagazineVO> getMagazineList(MagazineVO vo);
	void writeMagazine(MagazineVO vo);
	MagazineVO getMagazine(String m_Seq);
}
