package org.standard.project.magazine;

public class MagazineLikeVO {
	private int ml_Seq, m_Seq;
	private String c_Id, ml_Check;
	
	public MagazineLikeVO() {}

	public MagazineLikeVO(int ml_Seq, int m_Seq, String ml_Check, String c_Id) {
		super();
		this.ml_Seq = ml_Seq;
		this.m_Seq = m_Seq;
		this.ml_Check = ml_Check;
		this.c_Id = c_Id;
	}

	public int getMl_Seq() {
		return ml_Seq;
	}

	public void setMl_Seq(int ml_Seq) {
		this.ml_Seq = ml_Seq;
	}

	public int getM_Seq() {
		return m_Seq;
	}

	public void setM_Seq(int m_Seq) {
		this.m_Seq = m_Seq;
	}

	public String getMl_Check() {
		return ml_Check;
	}

	public void setMl_Check(String ml_Check) {
		this.ml_Check = ml_Check;
	}

	public String getC_Id() {
		return c_Id;
	}

	public void setC_Id(String c_Id) {
		this.c_Id = c_Id;
	}

	@Override
	public String toString() {
		return "MagazineLikeVO [ml_Seq=" + ml_Seq + ", m_Seq=" + m_Seq + ", ml_Check=" + ml_Check + ", c_Id=" + c_Id
				+ "]";
	}
	
	
}
