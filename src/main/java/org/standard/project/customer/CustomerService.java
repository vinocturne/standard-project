package org.standard.project.customer;

public interface CustomerService {
	CustomerVO getCustomer(CustomerVO vo);
	void joinCustomer(CustomerVO vo);
	CustomerVO getCustomerModify(CustomerVO vo);
}
