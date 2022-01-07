package egovframework.project.mapper;

import java.util.List;

import egovframework.project.model.dto.CartDto;
import egovframework.project.model.dto.ProductDto;
import egovframework.project.model.dto.ProductTotalDto;
import egovframework.project.model.dto.UserAndProductDto;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface CartMapper {

	List<ProductDto> selectAllCart(long id);

	int existProductInCart(UserAndProductDto userAndProductDto);

	void insertCart(CartDto cartDto);

	void addProductQtyInCart(CartDto cartDto);

	int modifyOptionQty(ProductTotalDto productTotalDto);

	void deleteProduct(CartDto cartDto);

	void deleteAllProduct(long userId);
}
