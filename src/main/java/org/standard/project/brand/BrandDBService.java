package org.standard.project.brand;

import java.util.List;
import java.util.Map;

import org.standard.project.customer.CustomerVO;

public interface BrandDBService {
	BrandDBVO getBrandId(CustomerVO customerVO);
}
