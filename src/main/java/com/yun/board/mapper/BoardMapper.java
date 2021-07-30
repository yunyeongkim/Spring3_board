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
	
	//�Խ��Ǹ���Ʈ
	public List<BoardVO> list(PagingVO pagingVO);
	// �߻�޼���
	// �Խù� �� ����
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
