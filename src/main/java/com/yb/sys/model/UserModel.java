package com.yb.sys.model;

import java.util.List;

import com.yb.sys.entity.UserExt;
import com.yb.sys.entity.IndividualExt;

public class UserModel {

	private UserExt userExt;
	
	private UserExt userQueryCon;
	
	private int currentPage = 1;
	
	private int pageSize = 20;
	
	private int totalCount;
	
	private int pageCount;
	
	private Long[] checkId;
	
	private Long dataId;
	
	private List<UserExt> items;
	
	private String operationType;
	
	private String errorMessage;

  //Added by Yuanguo; when user publish translation service, it needs to create a blank instance of IndividualExt
  //and pass it to publish_indiv.jsp to be populated. The individualExt is used to pass the instance. See function 
  //goPublish() in UserController.java;
  private IndividualExt individualExt;

  //Added by Yuanguo; when user upload files (see upload_indiv.jsp), the controller needs to tell upload_indiv.jsp 
  //which file (photo, language certificate and etc) to upload, and upload_indiv.jsp needs to tell controller which
  //file it is uploading. The fileType is for this purpose.
  //It is similar for company.
  private String fileType;

  //Added by Yuanguo: in upload_indiv.jsp, pass "skip or not" to controller;
  //   0: not skip;
  //   1: skip;
  private int skip;

	public UserExt getUserExt() {
		return userExt;
	}

	public void setUserExt(UserExt userExt) {
		this.userExt = userExt;
	}

	public UserExt getUserQueryCon() {
		return userQueryCon;
	}

	public void setUserQueryCon(UserExt userQueryCon) {
		this.userQueryCon = userQueryCon;
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

	public List<UserExt> getItems() {
		return items;
	}

	public void setItems(List<UserExt> items) {
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

  //Following functions are added by Yuanguo;
  
	public IndividualExt getIndividualExt() {
		return individualExt;
	}

	public void setIndividualExt(IndividualExt individualExt) {
		this.individualExt = individualExt;
	}

  public String getFileType()
  {
    return fileType;
  }

  public void setFileType(String fileType)
  {
    this.fileType = fileType;
  }

  public int getSkip()
  {
    return skip;
  }

  public void setSkip(int skip)
  {
    this.skip = skip;
  }
}
