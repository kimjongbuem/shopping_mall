package egovframework.project.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ProductSizeDto {
	private long id;
	private long userId;
	private long productId;
	private long optionNo;
	private String password;
	private String detail;
	private String name;
	private Date createDate;
	private boolean equalId; 
}
