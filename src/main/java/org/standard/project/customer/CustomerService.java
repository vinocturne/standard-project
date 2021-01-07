package org.standard.project.customer;

import java.util.List;
import java.util.Map;

public interface CustomerService {
	CustomerVO getCustomer(CustomerVO vo);
	
	CustomerVO getWaitingCustomer(CustomerVO vo);
	void joinCustomer(CustomerVO vo);

	void joinWaitingList(CustomerVO vo);
	void deleteCustomer(CustomerVO vo);
	void modifyCustomer(CustomerVO vo);
	List<Map<String, Object>> listWaitingCustomer(Map<String, Object> map);
	
	void deleteWaitingCustomer(String c_Id);
	void approveCustomer(String c_Id);
	List<Map<String, Object>> getDailyRegNumber();

	CustomerVO getCustomerByNameAndEmail(CustomerVO vo);

	CustomerVO getCustomerByIdAndNameAndEmail(CustomerVO vo);

	void changePassword(CustomerVO vo);
}
