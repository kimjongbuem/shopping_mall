package egovframework.project.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {
	private int productId;
	private String productName;
	private String companyName;
	private long price;
	private String detail;
	private String imgUrl_1;
	private int sale;
	private int qty;
	private long total;
	private long curPrice;
}
