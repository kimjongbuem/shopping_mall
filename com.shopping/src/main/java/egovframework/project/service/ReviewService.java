package egovframework.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import egovframework.project.mapper.ReviewMapper;
import egovframework.project.model.dto.ReviewDto;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;
	
	public List<ReviewDto> getProductDetailReviews(ReviewDto reviewDto) {
		return reviewMapper.getProductDetailReviews(reviewDto);
	}

	public void removeReview(ReviewDto reviewDto) {
		reviewMapper.removeReview(reviewDto);
	}

	public void modifyReview(ReviewDto reviewDto) {
		reviewMapper.modifyReview(reviewDto);
	}

	public void writeReview(ReviewDto reviewDto) {
		reviewMapper.writeReview(reviewDto);
	}

	public ReviewDto getReview(long reviewId) {
		return reviewMapper.getReview(reviewId);
	}

}
