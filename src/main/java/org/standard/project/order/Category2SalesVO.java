package org.standard.project.order;

public class Category2SalesVO {
	private String Category2;
	private int NumberOfSales;

	
	public String getCategory2() {
		return Category2;
	}
	public void setCategory2(String category2) {
		Category2 = category2;
	}
	public int getNumberOfSales() {
		return NumberOfSales;
	}
	@Override
	public String toString() {
		return "Category2SalesVO [Category2=" + Category2 + ", NumberOfSales=" + NumberOfSales + "]";
	}
	public void setNumberOfSales(int numberOfSales) {
		NumberOfSales = numberOfSales;
	}

	
 
}
