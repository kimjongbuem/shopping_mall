package egovframework.project.mapper;

import java.util.List;
import egovframework.project.model.dto.ReviewDto;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper
public interface ReviewMapper {

	List<ReviewDto> getProductDetailReviews(ReviewDto reviewDto);

	void removeReview(ReviewDto reviewDto);

	void modifyReview(ReviewDto reviewDto);

	void writeReview(ReviewDto reviewDto);

	ReviewDto getReview(long reviewId);

}
