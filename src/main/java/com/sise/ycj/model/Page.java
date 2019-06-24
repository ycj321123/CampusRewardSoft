package com.sise.ycj.model;

import java.util.List;

public class Page<E>{
	/*
	 * 第几页
	 */
	private int pageIndex;
	/*
	 * 起始页
	 */
	private int pageStart;
	/*
	 * 结束页
	 */
	private int pageEnd;
	/*
	 * 每页显示多少条
	 */
	private int pageSize;
	/*
	 * 分页的开始值
	 */
	private int pageOffset;
	/*
	 * 总共多少条记录
	 */
	private int totalRecord;
	/*
	 * 总共多少页
	 */
	private int totalPage;
	/*
	 * 数据列表
	 */
	private List<E>datas;
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	
	public int getPageStart() {
		return pageStart;
	}
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageOffset() {
		return pageOffset;
	}
	public void setPageOffset(int pageOffset) {
		this.pageOffset = pageOffset;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<E> getDatas() {
		return datas;
	}
	public void setDatas(List<E> datas) {
		this.datas = datas;
	}
	
}
