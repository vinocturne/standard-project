package org.standard.project.magazine;

import java.util.List;

public interface MagazineService {
	List<MagazineVO> getMagazineList(MagazineVO vo);
	void writeMagazine(MagazineVO vo);
}
