package egovframework.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.project.mapper.QnaMapper;
import egovframework.project.model.dto.QnaDto;

@Service
public class QnaService {

	private final int NOT_EXIST = 0;
	private final int EXIST = 1;
	
	@Autowired
	private QnaMapper qnaMapper;
	
	public List<QnaDto> getProductDetailQnas(QnaDto qnaDto) {
		return qnaMapper.getProductDetailQnas(qnaDto);
	}

	public QnaDto getQna(long qnaId) {
		return qnaMapper.getQna(qnaId);
	}

	public int checkPassword(QnaDto qnaDto) {
		qnaDto = qnaMapper.checkPassword(qnaDto);
		
		if(qnaDto == null) return NOT_EXIST;
		else return EXIST;
	}

	public void removeQna(long qnaId) {
		qnaMapper.removeQna(qnaId);
	}

	public void updateQna(QnaDto qnaDto) {
		qnaMapper.updateQna(qnaDto);
	}

	public void writeQna(QnaDto qnaDto) {
		qnaMapper.writeQna(qnaDto);
	}

}
