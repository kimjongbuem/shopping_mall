package egovframework.project.service;

import org.springframework.stereotype.Service;

import egovframework.project.model.entity.User;


@Service
public class UserService extends BaseService<User>{

	@Override
	public int create(User user) {
		
		System.out.println(baseRepository);
		
		User save = baseRepository.save(user);
		
		if(save == null) return 0;
		else return 1;
	}

	@Override
	public int update(User entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int read(Long id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return 0;
	}
}
