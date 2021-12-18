package egovframework.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.project.mapper.KakaoMapper;
import egovframework.project.model.entity.User;

@Service
public class KakaoService {

	@Autowired
	KakaoMapper kakaoMapper;
	
	public User loginKakao(long kakaoId) {
		return kakaoMapper.loginKakao(kakaoId);
	}

}
