package egovframework.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.project.mapper.NaverMapper;
import egovframework.project.model.entity.User;

@Service
public class NaverService {
	
	@Autowired
	private NaverMapper naverMapper;

	public User loginNaver(String naverId) {
		return naverMapper.loginNaver(naverId);
	}
}
