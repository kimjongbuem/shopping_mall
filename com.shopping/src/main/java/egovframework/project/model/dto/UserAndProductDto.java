package egovframework.project.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class UserAndProductDto {
	
	private long userId;
	private long productId;
}
