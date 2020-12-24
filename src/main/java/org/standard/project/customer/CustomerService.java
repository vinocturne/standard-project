package org.standard.project.customer;

import java.util.List;

public interface CustomerService {
	CustomerVO getCustomer(CustomerVO vo);
	CustomerVO getWaitingCustomer(CustomerVO vo);
	void joinCustomer(CustomerVO vo);

	void joinWaitingList(CustomerVO vo);
	void deleteCustomer(CustomerVO vo);
	void modifyCustomer(CustomerVO vo);
	List<CustomerVO> listWaitingCustomer(CustomerVO vo);
}
