package org.standard.customer;

public interface CustomerService {
	CustomerVO getCustomer(CustomerVO vo);
	//로그인할 때 고객 정보를 가지고 오는 메소드
	void joinCustomer(CustomerVO vo);
	//가입할 때 고객정보를 넘겨주는 메소드.
}
