package egovframework.project.model.dto;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDto {
	private long id;
	private long userId;
	private long productId;
	private String detail;
	private String name;
	private Date createDate;
	private boolean equalId; 
}
