package com.itwill.littlecinema.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.littlecinema.domain.Movie;
import com.itwill.littlecinema.domain.Time;
import com.itwill.littlecinema.service.interface_service.MovieService;
import com.itwill.littlecinema.service.interface_service.ReviewService;
import com.itwill.littlecinema.service.interface_service.TimeService;

@Controller
public class MovieController {

	private MovieService movieService;
	private TimeService timeService;
	private ReviewService reviewService;
	
	public MovieController(MovieService movieService, TimeService timeService, ReviewService reviewService) {
		this.movieService = movieService;
		this.timeService = timeService;
		this.reviewService = reviewService;
	}

	@RequestMapping(value = {"/", "/main", "/index"})
	public String index(Model model) throws Exception {
		List<Date> dateList = timeService.findAllDate();	
		model.addAttribute("movieList", movieService.findPlayingList());
		model.addAttribute("firstDate", dateList.get(0));
		model.addAttribute("lastDate", dateList.get(dateList.size() - 1));
		return "index";
	}
	
	//MovieTimeTableController
	
	//모든 영화 상영일자 조회
	@ResponseBody
	@RequestMapping(value="/timetable_rest")
	public List<Date> movieDateTableRest() throws Exception {
		return timeService.findAllDate();
	}
	
	@RequestMapping(value="/timetable")
	public String MovieDateTable(Model model) throws Exception {
		
		List<Date> dateList = timeService.findAllDate();
		model.addAttribute("dateList", dateList);
		
		return "movie_timetable";
	}
/*
	//movieDate로 영화정보, 스크린정보, 시간정보 조회
	@ResponseBody
	@RequestMapping("/timetable_detail_rest")
	public List<Time> timeListRest(@RequestParam String movieDate) throws Exception {
		return timeService.findScreenTimeByDate(movieDate);
	}

	@RequestMapping("/timetable_detail")
	public String MovieTimetable(@RequestParam String movieDate, Model model) throws Exception {
		
		List<Time> timeList = timeService.findScreenTimeByDate(movieDate);
		model.addAttribute("timeList", timeList);

		return "movie_timetable_detail";
	}
*/
	@ResponseBody
	@RequestMapping(value = "/timetable_detail_rest", produces = "application/json;charset=utf-8")
	public List<Map<String, Object>> movieTimeTableJSON(@RequestParam String movieDate) throws Exception {
		
		List<Movie> movieList = movieService.findPlayingList();
		List<Map<String, Object>> mapList = new ArrayList<Map<String,Object>>();
		
		for(Movie movie : movieList) {
			//JSON으로 만들어줄 Map객체
			Map<String, Object> jsonMap = new HashMap<>();
			jsonMap.put("moiveNo", movie.getMovieNo());
			jsonMap.put("posterImage", movie.getPosterImage());
			jsonMap.put("rating", movie.getRating());
			jsonMap.put("title", movie.getTitle());
			jsonMap.put("dateTimeTable", timeService.findTimeTable(movie.getMovieNo(), movieDate));
			mapList.add(jsonMap);
		}
		return mapList;
	}

	
	//MovieInfoController
	
	//movieNo 없이 요청되면 영화목록으로
	@RequestMapping(value="/movie_info", params="!movieNo")
	public String movie_info_no_param() {
		return "redirect:playing";
	}

	//정상적인 영화 상세 정보 페이지 요청
	@RequestMapping(value="/movie-info", params="movieNo")
	public String movie_info(@RequestParam int movieNo, Model model) throws Exception {
		
		//movieNo으로 영화정보 조회
		Movie movie = movieService.findDetailByNo(movieNo);
		model.addAttribute("movie", movie);
		//movieNo으로 영화 상영일자 조회
		List<Date> dateList = timeService.findDateByNo(movieNo);
		model.addAttribute("dateList", dateList);
		//movieNo으로 영화 상영시간 조회
		List<Time> timeList = timeService.findMovieTimeList(movieNo);
		model.addAttribute("timeList", timeList);
		//movieNo으로 영화 리뷰 평점 조회
		Double avgScore = reviewService.findAvgScore(movieNo);
		model.addAttribute("avgScore", avgScore);
		
		return "movie-info";
	}

	//PlayingController
	
	@RequestMapping("/playing")
	public String playing(Model model) throws Exception {
		model.addAttribute("movieList", movieService.findPlayingList());
		return "playing1";
	}
	
	@ResponseBody
	@RequestMapping("/rest_avg")
	public Double avg(@RequestParam int movieNo) throws Exception {
		if (reviewService.findAvgScore(movieNo) == null) {
			return 0.0;
		}
		
		return Math.round((reviewService.findAvgScore(movieNo) * 10)) / 10.0;
	}
	

	
	
	
}
