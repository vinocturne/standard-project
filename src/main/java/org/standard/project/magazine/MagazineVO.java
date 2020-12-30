package org.standard.project.magazine;

import java.sql.Date;

public class MagazineVO {
	private int m_Seq, m_Hit, m_Like;
	private String m_Title, m_Content, m_Thumb, m_Img;
	private Date m_Date;

	public MagazineVO() {}

	public MagazineVO(int m_Seq, int m_Hit, int m_Like, String m_Title, String m_Content, String m_Thumb, String m_Img,
			Date m_Date) {
		super();
		this.m_Seq = m_Seq;
		this.m_Hit = m_Hit;
		this.m_Like = m_Like;
		this.m_Title = m_Title;
		this.m_Content = m_Content;
		this.m_Thumb = m_Thumb;
		this.m_Img = m_Img;
		this.m_Date = m_Date;
	}

	public int getM_Seq() {
		return m_Seq;
	}

	public void setM_Seq(int m_Seq) {
		this.m_Seq = m_Seq;
	}

	public int getM_Hit() {
		return m_Hit;
	}

	public void setM_Hit(int m_Hit) {
		this.m_Hit = m_Hit;
	}

	public int getM_Like() {
		return m_Like;
	}

	public void setM_Like(int m_Like) {
		this.m_Like = m_Like;
	}

	public String getM_Title() {
		return m_Title;
	}

	public void setM_Title(String m_Title) {
		this.m_Title = m_Title;
	}

	public String getM_Content() {
		return m_Content;
	}

	public void setM_Content(String m_Content) {
		this.m_Content = m_Content;
	}

	public String getM_Thumb() {
		return m_Thumb;
	}

	public void setM_Thumb(String m_Thumb) {
		this.m_Thumb = m_Thumb;
	}

	public String getM_Img() {
		return m_Img;
	}

	public void setM_Img(String m_Img) {
		this.m_Img = m_Img;
	}

	public Date getM_Date() {
		return m_Date;
	}

	public void setM_Date(Date m_Date) {
		this.m_Date = m_Date;
	}

	@Override
	public String toString() {
		return "MagazineVO [m_Seq=" + m_Seq + ", m_Hit=" + m_Hit + ", m_Like=" + m_Like + ", m_Title=" + m_Title
				+ ", m_Content=" + m_Content + ", m_Thumb=" + m_Thumb + ", m_Img=" + m_Img + ", m_Date=" + m_Date + "]";
	}
	
	
	
}
