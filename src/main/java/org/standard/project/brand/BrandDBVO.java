package org.standard.project.brand;

public class BrandDBVO {
	//FK: brandName (reference Customer(brandName))
	private int brandId;
    private String brandName;
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
		return "brandVO [brandId=" + brandId + ", brandName=" + brandName + "]";
	}
}
