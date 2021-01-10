package org.standard.project.order;

public class MarketShareVO {
	private int NumberOfSales;
	private String brandName;
	public int getNumberOfSales() {
		return NumberOfSales;
	}
	public void setNumberOfSales(int numberOfSales) {
		NumberOfSales = numberOfSales;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	@Override
	public String toString() {
		return "MarketShareVO [NumberOfSales=" + NumberOfSales + ", brandName=" + brandName + "]";
	}
	
	
	
}
