package com.gzm.project.model.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class Criteria {
	private int page;
	private int perPageNum;
	private int pageStart;

	public int getPageStart() {
		pageStart=(this.page - 1) * perPageNum;
		return pageStart;
	}

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if (pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}
}