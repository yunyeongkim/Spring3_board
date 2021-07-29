package com.yun.board.vo;

import org.springframework.web.util.UriComponentsBuilder;

public class PagingVO {

	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ ", cntPage=" + cntPage + ", uriComponentsBuilder=" + uriComponentsBuilder + "]";
	}
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
	private int cntPage = 5;
	UriComponentsBuilder uriComponentsBuilder;
	
	public PagingVO() {
	}
	public PagingVO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	// ���� ������ ������ ���
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// ����, �� ������ ���
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB �������� ����� start, end�� ���
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	/**
	 * @return the nowPage
	 */
	public int getNowPage() {
		return nowPage;
	}
	/**
	 * @param nowPage the nowPage to set
	 */
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	/**
	 * @return the startPage
	 */
	public int getStartPage() {
		return startPage;
	}
	/**
	 * @param startPage the startPage to set
	 */
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	/**
	 * @return the endPage
	 */
	public int getEndPage() {
		return endPage;
	}
	/**
	 * @param endPage the endPage to set
	 */
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	/**
	 * @return the total
	 */
	public int getTotal() {
		return total;
	}
	/**
	 * @param total the total to set
	 */
	public void setTotal(int total) {
		this.total = total;
	}
	/**
	 * @return the cntPerPage
	 */
	public int getCntPerPage() {
		return cntPerPage;
	}
	/**
	 * @param cntPerPage the cntPerPage to set
	 */
	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}
	/**
	 * @return the lastPage
	 */
	public int getLastPage() {
		return lastPage;
	}
	/**
	 * @param lastPage the lastPage to set
	 */
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	/**
	 * @return the start
	 */
	public int getStart() {
		return start;
	}
	/**
	 * @param start the start to set
	 */
	public void setStart(int start) {
		this.start = start;
	}
	/**
	 * @return the end
	 */
	public int getEnd() {
		return end;
	}
	/**
	 * @param end the end to set
	 */
	public void setEnd(int end) {
		this.end = end;
	}
	/**
	 * @return the cntPage
	 */
	public int getCntPage() {
		return cntPage;
	}
	/**
	 * @param cntPage the cntPage to set
	 */
	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	
	

}
