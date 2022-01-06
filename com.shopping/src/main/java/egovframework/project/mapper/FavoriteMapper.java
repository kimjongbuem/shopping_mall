package egovframework.project.mapper;

import java.util.List;

import egovframework.project.model.dto.FavoriteDto;
import egovframework.project.model.dto.UserAndProductDto;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface FavoriteMapper {

	List<FavoriteDto> selecAllFav(long id);

	void addFav(UserAndProductDto userAndProductDto);

	FavoriteDto getProductOfFavorite(FavoriteDto favoriteDto);

	void removeFav(UserAndProductDto userAndProductDto);

}
