package org.standard.project.vo;

import java.sql.Date;

public class MagazineVO {
	private int m_Seq;
	private String m_Title, m_Content, m_Thumb, m_Img;
	private Date m_Date;

	public MagazineVO() {}
	
	public MagazineVO(int m_Seq, String m_Title, String m_Content, String m_Thumb, String m_Img, Date m_Date) {
		super();
		this.m_Seq = m_Seq;
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
	
	
	
}
