package egovframework.project.mapper;

import egovframework.project.model.entity.User;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface UserMapper {
	void create(User user);
	void createKakaoUser(User user);
	User existId(String userId);
	User loginCheck(User user);
	void createNaverUser(User user);
	User checkUserPassword(User user);
	void delete(Long id);
	void update(User user);
	User getUser(User user);
}
