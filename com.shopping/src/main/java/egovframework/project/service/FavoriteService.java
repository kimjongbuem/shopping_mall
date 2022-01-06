package egovframework.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.project.mapper.FavoriteMapper;
import egovframework.project.model.dto.FavoriteDto;
import egovframework.project.model.dto.UserAndProductDto;

@Service
public class FavoriteService {

	@Autowired
	private FavoriteMapper favoriteMapper;
	
	public List<FavoriteDto> selectAllFav(long id) {
		return favoriteMapper.selecAllFav(id);
	}

	public void addFav(UserAndProductDto userAndProductDto) {
		favoriteMapper.addFav(userAndProductDto);
	}

	public FavoriteDto getProductOfFavorite(FavoriteDto favoriteDto) {
		return favoriteMapper.getProductOfFavorite(favoriteDto);
	}

	public void removeFav(UserAndProductDto userAndProductDto) {
		favoriteMapper.removeFav(userAndProductDto);
	}

}
