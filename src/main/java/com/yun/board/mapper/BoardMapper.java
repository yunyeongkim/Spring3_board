package com.yun.board.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.yun.board.vo.BoardVO;
import com.yun.board.vo.CommentVO;
import com.yun.board.vo.PagingVO;
import com.yun.board.vo.ReCommentVO;

import net.webjjang.util.PageObject;

public interface BoardMapper {
	
	//게시판리스트
	public List<BoardVO> list(PagingVO pagingVO);
	// 추상메서드
	// 게시물 총 갯수
	public int countBoard();
	
	public Object view(int no);
	
	public Object insert(Map<String, Object> param);
	
	public void update(Map<String, Object> param);
	
	public void writeCo(Map<String, Object> param);
	
	public List<CommentVO> getComment(Map<String, Object> param);
	
	public void reWriteCo(Map<String, Object> param);
	
	public void commentCount(Map<String, Object> param);
	
	public List<ReCommentVO> getReComment(Map<String, Object> param);
	
	

}
