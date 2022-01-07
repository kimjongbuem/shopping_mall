package egovframework.project.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.project.exception.IDAlreadyExistsException;
import egovframework.project.exception.IdFirstNotEnglish;
import egovframework.project.exception.IdShortException;
import egovframework.project.exception.PasswordShortException;
import egovframework.project.mapper.UserMapper;
import egovframework.project.model.entity.User;
import egovframework.project.utils.SHA256;
import sun.security.provider.SHA;


@Service
public class UserService extends BaseService<User>{

	private final int SHORT_PASSWORD = 0;
	private final int POSSIBLE_PASSWORD = 1;
	
	private final int ALREADY_EXISTS_ID = 0;
	private final int SHORT_ID = 1;
	private final int NOT_FIRST_ENG_ID = 2;
	private final int POSSIBLE_ID = 3;
	
	private final int NOT_EXIST_USER = 0;
	private final int EXIST_USER = 1;
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public void create(User user) {
		userMapper.create(user);
	}

	public void createKakaoUser(User user) {
		userMapper.createKakaoUser(user);
		
	}
	
	public void createNaverUser(User user) {
		userMapper.createNaverUser(user);
	}
	
	@Override
	public void update(User user) {

	}
	
	public boolean updateUser(User user) {
		
		if(checkPassword(user.getPassword()) == POSSIBLE_PASSWORD) {
			user.setPassword(SHA256.encrypt(user.getPassword()));
			userMapper.update(user);
			return true;
		}else return false;

	}

	@Override
	public User read(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long id) {// 없음 //
		userMapper.delete(id);
	}
	
	public int checkPassword(String password) {
		
		try {
			if(password.length() < 8) throw new PasswordShortException();
		} catch (PasswordShortException e) {
			return SHORT_PASSWORD;
		}

		return POSSIBLE_PASSWORD;
	}
	
	
	public int searchId(String userid) {
		
		try {
			idCheck(userid);
			idCheck(userMapper.existId(userid));
		} catch (IdShortException e) {
			return SHORT_ID;
		} catch (IdFirstNotEnglish e) {
			return NOT_FIRST_ENG_ID;
		} catch (IDAlreadyExistsException e) {
			return ALREADY_EXISTS_ID;
		}
		
		return POSSIBLE_ID;
	}
	
	public void idCheck(String userid) throws IdShortException, IdFirstNotEnglish {
		if(userid.length() < 6) throw new IdShortException();
		else if (Character.isDigit(userid.charAt(0))) throw new IdFirstNotEnglish();
	}
	public void idCheck(User user) throws IDAlreadyExistsException {
		if(user != null) throw new IDAlreadyExistsException();
	}

	public int loginCheck(User user) {
		user = userMapper.loginCheck(user);
		
		if(user == null) return NOT_EXIST_USER;
		else return EXIST_USER;
	}

	public User login(User user) {
		return userMapper.loginCheck(user);
	}

	public int checkUserPassword(User user) {
		
		User checkUser = userMapper.checkUserPassword(user);
		
		if(checkUser == null) return NOT_EXIST_USER;
		else return EXIST_USER;
	}

	public User getUser(HttpServletRequest req) {
		
		String id = (String)req.getSession().getAttribute("id");
		User user = User.builder().userid(id).build();
		
		return userMapper.getUser(user);
	}
	
}
