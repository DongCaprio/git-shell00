package com.itwill.littlecinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.itwill.littlecinema.domain.Member;
import com.itwill.littlecinema.domain.Movie;
import com.itwill.littlecinema.domain.Review;
import com.itwill.littlecinema.service.interface_service.MemberService;
import com.itwill.littlecinema.service.interface_service.MovieService;
import com.itwill.littlecinema.service.interface_service.ReviewService;

@Controller
public class ReviewController {

	private MovieService movieService;
	private MemberService memberService;
	private ReviewService reviewService;

	public ReviewController(MovieService movieService, MemberService memberService, ReviewService reviewService) {
		this.movieService = movieService;
		this.memberService = memberService;
		this.reviewService = reviewService;
	}
	
	@RequestMapping("/review_write")
	public String reviewWrite(@RequestParam int movieNo, Model model) throws Exception {
		model.addAttribute("currentMovie", movieService.findDetailByNo(movieNo)); //test code
		return "review_write";
	}

	@RequestMapping("/review_write_action")
	public String reviewAction(@SessionAttribute("sMemberId") String sMemberId, 
								@RequestParam int movieNo, 
								@RequestParam int score, 
								@RequestParam String reviewComment) throws Exception {
		
		Member member = memberService.findMember(sMemberId);
		Movie movie = movieService.findDetailByNo(movieNo);
		
		reviewService.add(new Review(member, movie, score, reviewComment));
		return "redirect:movie_info?movieNo=" + movieNo;
	}

	@RequestMapping("/review_modify")
	public String reviewModify(@RequestParam int reviewNo, Model model) throws Exception {
		model.addAttribute("review1movie", reviewService.findByNo(reviewNo));
		return "review_modify";
	}

	@RequestMapping("/review_modify_action")
	public String reviewModifyAction(@ModelAttribute Review review, @RequestParam int movieNo) throws Exception {
		
		reviewService.modify(review);
		return "redirect:movie_info?movieNo=" + movieNo;
	}

	@RequestMapping("/review_remove")
	public String reviewDelete(@RequestParam int reviewNo, Model model ) throws Exception {
		Review review = reviewService.findByNo(reviewNo);
		int movieNo = review.getMovie().getMovieNo();
		reviewService.remove(reviewNo);
		return "redirect:movie_info?movieNo="+movieNo;
	}

}
