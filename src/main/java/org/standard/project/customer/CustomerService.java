package org.standard.project.customer;

public interface CustomerService {
	CustomerVO getCustomer(CustomerVO vo);
	CustomerVO getWaitingCustomer(CustomerVO vo);
	void joinCustomer(CustomerVO vo);

	void joinWaitingList(CustomerVO vo);

	CustomerVO getCustomerModify(CustomerVO vo);
}
