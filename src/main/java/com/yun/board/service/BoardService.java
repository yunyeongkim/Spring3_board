package com.yun.board.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.yun.board.mapper.BoardMapper;
import com.yun.board.vo.BoardVO;
import com.yun.board.vo.CommentVO;
import com.yun.board.vo.PagingVO;
import com.yun.board.vo.ReCommentVO;

import net.webjjang.util.PageObject;

@Service
public class BoardService { 
	
	@Inject
	private BoardMapper mapper;
	
	public List<CommentVO> getComment(Map<String, Object> param) {
		// TODO Auto-generated method stub
		
		
		
		return mapper.getComment(param);
		
	}
	public List<ReCommentVO> getReComment(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return mapper.getReComment(param);
	}
	
	public List<BoardVO> list(PagingVO pagingVO, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage){
		
		pagingVO.setTotal(mapper.countBoard());
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		pagingVO = new PagingVO(pagingVO.getTotal(), Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		System.out.println("BoardService.list().pageObject È®ÀÎ¿ë total "+pagingVO.getTotal());
		System.out.println(pagingVO.toString());
		
		return mapper.list(pagingVO);
	}
	
	public PagingVO paging(PagingVO pagingVO, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage){
		pagingVO.setTotal(mapper.countBoard());
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		pagingVO = new PagingVO(pagingVO.getTotal(), Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		
		return pagingVO;
		
	}

	public Object view(int no) {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}

	public Object insert(Map<String, Object> param) {
		// TODO Auto-generated method stub
		
		return mapper.insert(param);
	}

	public void update(Map<String, Object> param) {
		// TODO Auto-generated method stub
		 mapper.update(param);
		
	}

	public void writeCo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		mapper.writeCo(param);
		
	}

	public void reWriteCo(Map<String, Object> param) {
		// TODO Auto-generated method stub
	
		mapper.reWriteCo(param);
		mapper.commentCount(param);
	}

	

	
	
	
	

}
