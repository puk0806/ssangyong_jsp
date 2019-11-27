package days07.board;

public class PageBlock {
	
	private int currentPage =1;				// 현재 페이지
	private int numberOfPageBlocks = 10;	// 페이지 블록수
	private int numberPerPage = 10;			// 한 페이지 페이지수
	private int start , end;				// 페이지블럭 시작, 끝
	private boolean prev, next;				// 이전, 다음 버튼 활성화 여부
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getNumberOfPageBlocks() {
		return numberOfPageBlocks;
	}
	public void setNumberOfPageBlocks(int numberOfPageBlocks) {
		this.numberOfPageBlocks = numberOfPageBlocks;
	}
	public int getNumberPerPage() {
		return numberPerPage;
	}
	public void setNumberPerPage(int numberPerPage) {
		this.numberPerPage = numberPerPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	
	
	
	
}
