package com.yun.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.yun.board.mapper.BoardMapper;
import com.yun.board.service.BoardService;
import com.yun.board.vo.CommentVO;
import com.yun.board.vo.PagingVO;
import com.yun.board.vo.ReCommentVO;

import net.webjjang.util.PageObject;

@Controller
@RequestMapping(value="/board" ,method=RequestMethod.POST )
public class BoardController {
	
	//자동 DI적용 시키는 어노테이션 2가지 InJection AutoWired 자동으로 만들어준다
	@Autowired
	private BoardService service;
	
	@GetMapping("/list.do")
	//model 안에 request가 있다 model에 저장하면 request에 저정된다~!!!
	public String list(PagingVO pagingVO ,Model model) {
		
	//	model.addAttribute("paging", service.paging(pagingVO));
		//페이징처리를 먼저해줘야해!! 
		model.addAttribute("list",service.list(pagingVO, null, null));
		model.addAttribute("paging",service.paging(pagingVO, null, null));
		System.out.println("Board.controller.list");
		
		return "board/list";
	}
	
	@GetMapping("/getComment.do")
	public @ResponseBody List<CommentVO> getComment(@RequestParam Map<String,Object> param,Model model,HttpServletRequest request) {
		
		List<CommentVO> result = new ArrayList<CommentVO>(); 
		result = service.getComment(param);
		
		System.out.println(result.get(0));
		model.addAttribute("comment", service.getComment(param));
		System.out.println(model);
	
		return result;
	
	}
	@GetMapping("/getReComment.do")
	public @ResponseBody List<ReCommentVO> getReComment(@RequestParam Map<String,Object> param,Model model,HttpServletRequest request) {
		
		List<ReCommentVO> result = new ArrayList<ReCommentVO>(); 
		result = service.getReComment(param);
		
		System.out.println(result.get(0));
		model.addAttribute("comment", service.getComment(param));
		System.out.println(model);
	
		return result;
	
	}
	
	//게시판 글보기
	@GetMapping("/view.do")
	public String view(int no,Model model) {
		
		model.addAttribute("vo",service.view(no));
		
		return "board/view";
	}
	

	@GetMapping("/write.do")
	public String write(@RequestParam Map<String,Object> param) {
		System.out.println("들어왔습니당~!");
		String a =param.get("title")+"확인하는건데엥";
		System.out.println(a);
		service.insert(param);
		return "board/list";
	}
	
	@GetMapping("/update.do")
	public void update(@RequestParam Map<String,Object> param) {
		System.out.println("업데이트해요");
		service.update(param);
	}
	
	@GetMapping("/writeCo.do")
	public void writeCo(@RequestParam Map<String,Object> param) {
		System.out.println("코멘트 넣어요~");
		service.writeCo(param);
	}
	
	@GetMapping("/reWriteCo.do")
	public void reWriteCo(@RequestParam Map<String,Object> param) {
		System.out.println("대댓글~코멘트 넣어요~");
		service.reWriteCo(param);
	}
	
	
	
	
	

}
