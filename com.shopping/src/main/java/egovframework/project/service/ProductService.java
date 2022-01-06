package egovframework.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.project.mapper.ProductMapper;
import egovframework.project.model.dto.CheckBoxCompanyDto;
import egovframework.project.model.dto.ProductDto;
import egovframework.project.utils.Page;

@Service
public class ProductService {

	@Autowired
	private ProductMapper productMapper;
	
	public List<ProductDto> selectAllProduct(int count) {
		return productMapper.selectAllProduct(count);
	}
	
	public List<ProductDto> selectByCompanyName(String companyName) {
		return productMapper.selectByCompanyName(companyName);
	}
	
	public List<ProductDto> selectByProductName(String productName) {
		return productMapper.selectByProductName(productName);
	}

	public ProductDto getProductDetail(long productId) {
		return productMapper.getProductDetail(productId);
	}
	public List<ProductDto> searchCheckedBox(CheckBoxCompanyDto checkBoxCompanyDto) {
		return productMapper.searchCheckedBox(checkBoxCompanyDto);
	}

}
