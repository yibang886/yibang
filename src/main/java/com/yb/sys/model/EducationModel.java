package com.yb.sys.model;

import java.util.List;

import com.yb.sys.entity.EducationExt;

public class EducationModel {

	private EducationExt educationExt;
	
	private EducationExt educationQueryCon;
	
	private int currentPage = 1;
	
	private int pageSize = 20;
	
	private int totalCount;
	
	private int pageCount;
	
	private Long[] checkId;
	
	private Long dataId;
	
	private List<EducationExt> items;
	
	private String operationType;
	
	private String errorMessage;

	public EducationExt getEducationExt() {
		return educationExt;
	}

	public void setEducationExt(EducationExt educationExt) {
		this.educationExt = educationExt;
	}

	public EducationExt getEducationQueryCon() {
		return educationQueryCon;
	}

	public void setEducationQueryCon(EducationExt educationQueryCon) {
		this.educationQueryCon = educationQueryCon;
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

	public List<EducationExt> getItems() {
		return items;
	}

	public void setItems(List<EducationExt> items) {
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