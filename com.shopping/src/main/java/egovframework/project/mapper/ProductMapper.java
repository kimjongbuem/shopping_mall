package egovframework.project.mapper;

import java.util.List;

import egovframework.project.model.dto.CheckBoxCompanyDto;
import egovframework.project.model.dto.ProductDto;
import egovframework.project.model.dto.ProductSizeDto;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface ProductMapper {
	List<ProductDto> selectAllProduct(int count);
	List<ProductDto> selectByProductName(String productName);
	List<ProductDto> selectByCompanyName(String companyName);
	ProductDto getProductDetail(long productId);
	List<ProductDto> searchCheckedBox(CheckBoxCompanyDto checkBoxCompanyDto);
	List<ProductSizeDto> getSizeList(long productId);
}
