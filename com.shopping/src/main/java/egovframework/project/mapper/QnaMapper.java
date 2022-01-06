package egovframework.project.mapper;

import java.util.List;

import egovframework.project.model.dto.QnaDto;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface QnaMapper {

	List<QnaDto> getProductDetailQnas(QnaDto qnaDto);

	QnaDto getQna(long qnaId);

	QnaDto checkPassword(QnaDto qnaDto);

	void removeQna(long qnaId);

	void updateQna(QnaDto qnaDto);

	void writeQna(QnaDto qnaDto);

}
