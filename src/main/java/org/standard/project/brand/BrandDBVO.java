package org.standard.project.brand;

public class BrandDBVO {
	//FK: brandName (reference Customer(brandName))
	private int brandId;
    private String brandName;
    private String businessNumber;
    
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	@Override
	public String toString() {
		return "BrandDBVO [brandId=" + brandId + ", brandName=" + brandName + ", businessNumber=" + businessNumber
				+ "]";
	}
	

}
