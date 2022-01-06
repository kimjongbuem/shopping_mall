package egovframework.project.model.entity.naver;

import lombok.Data;

@Data
public class NaverUser {
	private String id; // 유저 id(번호) 값
	private String name; // 이름
	private String email;
	private String mobile;
	private String auth;
}
