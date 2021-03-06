package com.kiru.sesoc.util;

/**
 * κ²μ? ??΄μ§? μ²λ¦¬ ?΄??€
 */
public class PageNavigator {
	//??΄μ§? κ΄?? ¨ ? λ³? 
	private int countPerPage;		//??΄μ§??Ή κΈ?λͺ©λ‘ ?
	private int pagePerGroup;		//κ·Έλ£Ή?Ή ??΄μ§? ? 
	private int currentPage;		//??¬ ??΄μ§? (μ΅κ·Ό κΈ??΄ 1λΆ??° ??)
	private int totalRecordsCount;	//? μ²? κΈ? ?
	private int totalPageCount;		//? μ²? ??΄μ§? ?
	private int currentGroup;		//??¬ κ·Έλ£Ή (μ΅κ·Ό κ·Έλ£Ή?΄ 0λΆ??° ??)
	private int startPageGroup;		//??¬ κ·Έλ£Ή? μ²? ??΄μ§?
	private int endPageGroup;		//??¬ κ·Έλ£Ή? λ§μ?λ§? ??΄μ§?
	private int startRecord;		//? μ²? ? μ½λ μ€? ??¬ ??΄μ§? μ²? κΈ?? ?μΉ? (0λΆ??° ??)
	
	/*
	 * ??±?
	 */
	public PageNavigator(int countPerPage, int pagePerGroup, int currentPage, int totalRecordsCount) {
		//??΄μ§??Ή κΈ? ?, κ·Έλ£Ή?Ή ??΄μ§? ?, ??¬ ??΄μ§?, ? μ²? κΈ? ?λ₯? ? ?¬λ°μ
		this.countPerPage = countPerPage;
		this.pagePerGroup = pagePerGroup;
		this.totalRecordsCount = totalRecordsCount;
		
		//? μ²? ??΄μ§? ?
		totalPageCount = (totalRecordsCount + countPerPage - 1) / countPerPage;

		//? ?¬? ??¬ ??΄μ§?κ°? 1λ³΄λ€ ??Όλ©? ??¬??΄μ§?λ₯? 1??΄μ§?λ‘? μ§?? 
		if (currentPage < 1)	currentPage = 1;
		//? ?¬? ??¬ ??΄μ§?κ°? λ§μ?λ§? ??΄μ§?λ³΄λ€ ?¬λ©? ??¬??΄μ§?λ₯? λ§μ?λ§? ??΄μ§?λ‘? μ§?? 
		if (currentPage > totalPageCount)	currentPage = totalPageCount;
		
		this.currentPage = currentPage;

		//??¬ κ·Έλ£Ή
		currentGroup = (currentPage - 1) / pagePerGroup;
		
		//??¬ κ·Έλ£Ή? μ²? ??΄μ§?
		startPageGroup = currentGroup * pagePerGroup + 1;
		//??¬ κ·Έλ£Ή? λ§μ?λ§? ??΄μ§?
		endPageGroup = startPageGroup + pagePerGroup - 1;
		//??¬ κ·Έλ£Ή? λ§μ?λ§? ??΄μ§?κ°? ? μ²? ??΄μ§? ?λ³΄λ€ ??Όλ©? ? μ²΄ν?΄μ§? ?λ₯? λ§μ?λ§μΌλ‘?.
		endPageGroup = endPageGroup > totalPageCount ? totalPageCount : endPageGroup;

		//? μ²? ? μ½λ μ€? ??¬ ??΄μ§? μ²? κΈ?? ?μΉ?
		startRecord = (currentPage - 1) * countPerPage;
	}

	/*
	 * Getters and Setters
	 */
	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public int getPagePerGroup() {
		return pagePerGroup;
	}

	public void setPagePerGroup(int pagePerGroup) {
		this.pagePerGroup = pagePerGroup;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalRecordsCount() {
		return totalRecordsCount;
	}

	public void setTotalRecordsCount(int totalRecordsCount) {
		this.totalRecordsCount = totalRecordsCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getCurrentGroup() {
		return currentGroup;
	}

	public void setCurrentGroup(int currentGroup) {
		this.currentGroup = currentGroup;
	}

	public int getStartPageGroup() {
		return startPageGroup;
	}

	public void setStartPageGroup(int startPageGroup) {
		this.startPageGroup = startPageGroup;
	}

	public int getEndPageGroup() {
		return endPageGroup;
	}

	public void setEndPageGroup(int endPageGroup) {
		this.endPageGroup = endPageGroup;
	}

	public int getStartRecord() {
		return startRecord;
	}

	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}

	@Override
	public String toString() {
		return "PageNavigator [countPerPage=" + countPerPage + ", pagePerGroup=" + pagePerGroup + ", currentPage="
				+ currentPage + ", totalRecordsCount=" + totalRecordsCount + ", totalPageCount=" + totalPageCount
				+ ", currentGroup=" + currentGroup + ", startPageGroup=" + startPageGroup + ", endPageGroup="
				+ endPageGroup + ", startRecord=" + startRecord + "]";
	}
	
}
