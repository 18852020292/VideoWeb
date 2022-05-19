package com.liucm.controller;

import java.util.List;

import com.liucm.bean.Video;
import com.liucm.service.VideoService;
import io.swagger.models.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.liucm.bean.VideoType;
import com.liucm.service.VideoTypeService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/RedirectController")
public class RedirectController {
	@Autowired
	private VideoService videoService;
	@Autowired
	VideoTypeService videoTypeService;

	@RequestMapping("/videouploadredirect")
	public ModelAndView videouploadredirect() {
		List<VideoType> videoTypes = videoTypeService.getVideoTypeAll();
		ModelAndView view = new ModelAndView();
		view.addObject("videoTypeList", videoTypes);
		view.setViewName("videoupload");
		return view;
	}
	
	@RequestMapping("/UserInformationRedirect")
	public ModelAndView UserInformationRedirect() {
		ModelAndView view = new ModelAndView();
		view.setViewName("userinformation");
		return view;
	}

	@RequestMapping(value="/search",method = { RequestMethod.POST, RequestMethod.GET })
	public String toredirect(String search) {
		String s;
		try{
			s = "redirect:/VideoController/videoPlay?videoId="+String.valueOf(videoService.getVideoByTitle(search).get(0));
		}
		catch (Exception e) {
			s = "redirect:/RedirectController/IndexRedirect";
		}

		return s;
	}
	@RequestMapping("/fdRedirect")
	public ModelAndView fdRedirect() {
		ModelAndView view = new ModelAndView();
		view.setViewName("fd");
		return view;
	}
	
	@RequestMapping("/adminRedirect")
	public ModelAndView adminRedirect() {
		ModelAndView view = new ModelAndView();
		view.setViewName("adminmanage");
		return view;
	}
	
	@RequestMapping("/videostoreRedirect")
	public ModelAndView videostoreRedirect() {
		ModelAndView view = new ModelAndView();
		view.setViewName("videostore");
		return view;
	}
	
	@RequestMapping("/messageRedirect")
	public ModelAndView messageRedirect() {
		ModelAndView view = new ModelAndView();
		view.setViewName("message");
		return view;
	}
	
	
	@RequestMapping("/IndexRedirect")
	public ModelAndView IndexRedirect() {
		ModelAndView view = new ModelAndView();
		view.setViewName("index2");
		return view;
	}
	
	@RequestMapping("/LARRedirect")
	public ModelAndView LARRedirect() {
		ModelAndView view = new ModelAndView();
		view.setViewName("LAR");
		return view;
	}
}
