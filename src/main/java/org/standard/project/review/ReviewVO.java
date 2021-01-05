package org.standard.project.review;

import java.sql.Date;

public class ReviewVO {
	private int r_Seq, brandId;
	private String p_Id, r_Title, r_Writer, r_Coment, parent_p_Id, pp_Name, r_ComentRe;
	private Date r_Date;
	public int getR_Seq() {
		return r_Seq;
	}
	public void setR_Seq(int r_Seq) {
		this.r_Seq = r_Seq;
	}
	public String getP_Id() {
		return p_Id;
	}
	public void setP_Id(String p_Id) {
		this.p_Id = p_Id;
	}
	public String getR_Title() {
		return r_Title;
	}
	public void setR_Title(String r_Title) {
		this.r_Title = r_Title;
	}
	public String getR_Writer() {
		return r_Writer;
	}
	public void setR_Writer(String r_Writer) {
		this.r_Writer = r_Writer;
	}
	public String getR_Coment() {
		return r_Coment;
	}
	public void setR_Coment(String r_Coment) {
		this.r_Coment = r_Coment;
	}
	public String getParent_p_Id() {
		return parent_p_Id;
	}
	public void setParent_p_Id(String parent_p_Id) {
		this.parent_p_Id = parent_p_Id;
	}
	public String getPp_Name() {
		return pp_Name;
	}
	public void setPp_Name(String pp_Name) {
		this.pp_Name = pp_Name;
	}
	public String getR_ComentRe() {
		return r_ComentRe;
	}
	public void setR_ComentRe(String r_ComentRe) {
		this.r_ComentRe = r_ComentRe;
	}
	public Date getR_Date() {
		return r_Date;
	}
	public void setR_Date(Date r_Date) {
		this.r_Date = r_Date;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	@Override
	public String toString() {
		return "ReviewVO [r_Seq=" + r_Seq + ", p_Id=" + p_Id + ", r_Title=" + r_Title + ", r_Writer=" + r_Writer
				+ ", r_Coment=" + r_Coment + ", parent_p_Id=" + parent_p_Id + ", pp_Name=" + pp_Name + ", r_ComentRe="
				+ r_ComentRe + ", o_Date=" + r_Date + ", brandId="+brandId+"]";
	}
}
