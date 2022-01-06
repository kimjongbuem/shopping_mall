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
public class CartDto {
	private long id;
	private long userId;
	private long productId;
	private int qty;
	private Date createDate;
}
