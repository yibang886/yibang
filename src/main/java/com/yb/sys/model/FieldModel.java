package com.yb.sys.model;

import java.util.List;

import com.yb.sys.entity.FieldExt;

public class FieldModel {

	private FieldExt fieldExt;
	
	private FieldExt fieldQueryCon;
	
	private int currentPage = 1;
	
	private int pageSize = 20;
	
	private int totalCount;
	
	private int pageCount;
	
	private Long[] checkId;
	
	private Long dataId;
	
	private List<FieldExt> items;
	
	private String operationType;
	
	private String errorMessage;

	public FieldExt getFieldExt() {
		return fieldExt;
	}

	public void setFieldExt(FieldExt fieldExt) {
		this.fieldExt = fieldExt;
	}

	public FieldExt getFieldQueryCon() {
		return fieldQueryCon;
	}

	public void setFieldQueryCon(FieldExt fieldQueryCon) {
		this.fieldQueryCon = fieldQueryCon;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public Long[] getCheckId() {
		return checkId;
	}

	public void setCheckId(Long[] checkId) {
		this.checkId = checkId;
	}

	public Long getDataId() {
		return dataId;
	}

	public void setDataId(Long dataId) {
		this.dataId = dataId;
	}

	public List<FieldExt> getItems() {
		return items;
	}

	public void setItems(List<FieldExt> items) {
		this.items = items;
	}

	public String getOperationType() {
		return operationType;
	}

	public void setOperationType(String operationType) {
		this.operationType = operationType;
	}
		public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
}