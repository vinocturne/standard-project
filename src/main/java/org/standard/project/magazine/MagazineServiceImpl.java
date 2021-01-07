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

	@Override
	public void modifyMagazineWithoutImg(MagazineVO vo) {
		magazineDAO.modifyMagazineWithoutImg(vo);
	}

	@Override
	public void modifyMagazineWithImg(MagazineVO vo) {
		magazineDAO.modifyMagazineWithImg(vo);
	}

	@Override
	public void deleteMagazine(String m_Seq) {
		magazineDAO.deleteMagazine(m_Seq);
	}

	@Override
	public void hitIncrease(int m_Seq) {
		magazineDAO.hitIncrease(m_Seq);
	}

	@Override
	public MagazineVO selectMagazine(int m_Seq) {
		return magazineDAO.selectMagazine(m_Seq);
	}

	@Override
	public String magazineLikeCheck(MagazineLikeVO vo) {
		return magazineDAO.magazineLikeCheck(vo);
	}

	@Override
	public void makeLikeRow(MagazineLikeVO vo) {
		magazineDAO.makeLikeRow(vo);
	}

	@Override
	public int getLikeCnt(int m_Seq) {
		return magazineDAO.getLikecnt(m_Seq);
	}

	@Override
	public void updateLikeCntPlus(MagazineVO mVO) {
		magazineDAO.updateLikeCntPlus(mVO);
	}

	@Override
	public void updateLikeCntMinus(MagazineVO mVO) {
		magazineDAO.updateLikeCntMinus(mVO);
	}

	@Override
	public void likeCheckInit(MagazineLikeVO mlVO) {
		//좋아요 취소하면 다시 0으로 되돌려주는 기능
		magazineDAO.likeCheckInit(mlVO);
	}

	@Override
	public void likeCheckPlus(MagazineLikeVO mlVO) {
		magazineDAO.likeCheckPlus(mlVO);
	}
	
	@Override
	public List<MagazineVO> searchMagazineViewList(String m_Title) {
		return magazineDAO.searchMagazineViewList(m_Title);
	}

}
