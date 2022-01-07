package egovframework.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.project.mapper.CartMapper;
import egovframework.project.model.dto.CartDto;
import egovframework.project.model.dto.ProductDto;
import egovframework.project.model.dto.ProductTotalDto;
import egovframework.project.model.dto.UserAndProductDto;

@Service
public class CartService {

	@Autowired
	private CartMapper cartMapper;
	
	public List<ProductDto> selectAllCart(long id) {
		return cartMapper.selectAllCart(id);
	}

	public int existProductInCart(UserAndProductDto userAndProductDto) {
		return cartMapper.existProductInCart(userAndProductDto);
	}

	public void insertCart(CartDto cartDto) {
		cartMapper.insertCart(cartDto);
	}

	public void addProductQtyInCart(CartDto cartDto) {
		cartMapper.addProductQtyInCart(cartDto);
	}

	public int modifyOptionQty(ProductTotalDto productTotalDto) {
		return cartMapper.modifyOptionQty(productTotalDto);
	}

	public void deleteProduct(CartDto cartDto) {
		cartMapper.deleteProduct(cartDto);
	}

	public void deleteAllProduct(long userId) {
		cartMapper.deleteAllProduct(userId);
		
	}
}
