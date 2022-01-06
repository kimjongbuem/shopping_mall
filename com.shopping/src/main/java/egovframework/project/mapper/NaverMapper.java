package egovframework.project.mapper;

import egovframework.project.model.entity.User;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface NaverMapper {
	User loginNaver(String naverId);
}
