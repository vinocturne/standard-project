package org.standard.vo;

import java.sql.Date;

public class OrderHistoryVO {
	//FK: p_Id (reference product(p_id)), p_Price (reference product(p_Price))
	private int o_Num, p_Price, o_Quantity, o_TotalPrice;
    private String c_Id, p_Id, o_Delivery;
    private Date o_Date;
}
