package com.funo.monitor.model;

import com.funo.base.vo.IPageAbleObj;
import com.funo.base.vo.Page;

public class MonitorQueryObj extends Monitor implements IPageAbleObj{
	
	private static final long serialVersionUID = 1L;
	private Page page;
	public Page getPage() {
		return this.page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public Integer getStartRowNum() {
		return Page.getStartRowNum(page);
	}
	public Integer getEndRowNum() {
		return Page.getEndRowNum(page);
	}

}
