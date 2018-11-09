package command;

import java.util.List;
import Board.model.BoardBean;

public class PageInfo {
	private int total;
	private int currentPage;
	private List<BoardBean> content;
	private int totalPages;
	private int startPage;
	private int endPage;

	public PageInfo(int total, int currentPage, int size, List<BoardBean> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		if (total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			// 전체 페이지 값의 수를 size의 값으로 나눈다.
			totalPages = total / size;
			if (total % size > 0) {
				// 나눈 값에서 나머지가 0보다 크게 되면 페이지 수를 1증가 한다.
				totalPages++;
			}
			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			if (modVal == 0)
				startPage -= 5;
			endPage = startPage + 4;
			if (endPage > totalPages)
				endPage = totalPages;
		}
	}

	public int getTotal() {
		return total;
	}

	// ----글이 있는지 여부를 확인하는 생성자----
	public boolean hasNoArticles() {
		return total == 0;
	}

	public boolean hasArticles() {
		return total > 0;
	}
	//-------------------------------
	
	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public List<BoardBean> getContent() {
		return content;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
}