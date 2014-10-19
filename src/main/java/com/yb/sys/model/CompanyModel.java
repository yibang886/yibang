package com.yb.sys.model;

import java.util.List;

import com.yb.sys.entity.CompanyExt;

public class CompanyModel {

	private CompanyExt companyExt;
	
	private CompanyExt companyQueryCon;
	
	private int currentPage = 1;
	
	private int pageSize = 20;
	
	private int totalCount;
	
	private int pageCount;
	
	private Long[] checkId;
	
	private Long dataId;
	
	private List<CompanyExt> items;
	
	private String operationType;
	
	private String errorMessage;

	public CompanyExt getCompanyExt() {
		return companyExt;
	}

	public void setCompanyExt(CompanyExt companyExt) {
		this.companyExt = companyExt;
	}

	public CompanyExt getCompanyQueryCon() {
		return companyQueryCon;
	}

	public void setCompanyQueryCon(CompanyExt companyQueryCon) {
		this.companyQueryCon = companyQueryCon;
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

	public List<CompanyExt> getItems() {
		return items;
	}

	public void setItems(List<CompanyExt> items) {
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