package egovframework.project.model.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {

	private long id; // 번호
	
	private String userid; // 아이디
	private String name; // 이름
	private String email;
	private String phone;
	private String address;
	private String password;
	private String auth;
	private long kakaoId;
	private String naverId;
	private boolean deleted; 
	
	// cart, fav, review
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
//  private List<OrderGroup> orderGroupList;
	
//	@CreatedDate
	private LocalDateTime createDate;

}
