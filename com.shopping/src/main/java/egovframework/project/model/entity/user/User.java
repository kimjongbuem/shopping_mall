package egovframework.project.model.entity.user;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.data.annotation.CreatedDate;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;



@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
//@EntityListeners(AuditingEntityListener.class)
public class User {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id; // 번호
	
	private String username; // 아이디
	private String name; // 이름
	private String email;
	private String phone;
	private String address;
	private String password;
	private String auth;
	private long kakaoId;
	private long naverId;
	
	// cart, fav, review
//	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
//  private List<OrderGroup> orderGroupList;
	
//	@CreatedDate
	private LocalDateTime createDate;

}
