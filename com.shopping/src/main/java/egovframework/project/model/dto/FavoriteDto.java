package egovframework.project.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FavoriteDto {
	private long id;
	private long userId;
	private long productId;
	private int sale;
	private Date createTime;
}
