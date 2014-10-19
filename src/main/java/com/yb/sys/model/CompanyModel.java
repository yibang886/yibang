package com.yb.sys.model;

import java.util.List;

import com.yb.sys.entity.CompanyExt;
import com.yb.sys.entity.CityExt;
import com.yb.sys.entity.RecomposExt;
import com.yb.sys.entity.LanguageExt;
import com.yb.sys.entity.FieldExt;
import com.yb.sys.entity.TranstypeExt;
import com.yb.sys.entity.DoctypeExt;

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

  //Added by Yuanguo: when go to edit page, user should be allowed to select living city and etc. 
  //These options (enumerations) should be passed from controller to edit.jsp; this is what the following properties 
  //are intended for.
  private List<CityExt> cityEnum;
  private List<RecomposExt> recomposEnum;
  private List<LanguageExt> languageEnum;
  private List<FieldExt> fieldEnum;
  private List<TranstypeExt> transtypeEnum;
  private List<DoctypeExt> doctypeEnum;

  //Added by Yuanguo; when user upload files (see upload.jsp), the controller needs to tell upload.jsp which file (logo, 
  //authfile and etc) to upload, and upload.jsp needs to tell controller which file it is uploading. The fileType 
  //is for this purpose.
  private String fileType;

  //Added by Yuanguo: in upload.jsp, pass "skip or not" to controller;
  //   0: not skip;
  //   1: skip;
  private int skip;

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

  //Added by Yuanguo:
  public List<CityExt> getCityEnum()
  {
    return cityEnum;
  }
  public void setCityEnum(List<CityExt> cityEnum)
  {
    this.cityEnum = cityEnum;
  }

  public List<RecomposExt> getRecomposEnum()
  {
    return recomposEnum;
  }
  public void setRecomposEnum(List<RecomposExt> recomposEnum)
  {
    this.recomposEnum = recomposEnum;
  }

  public List<LanguageExt> getLanguageEnum()
  {
    return languageEnum;
  }
  public void setLanguageEnum(List<LanguageExt> languageEnum)
  {
    this.languageEnum = languageEnum;
  }

  public List<FieldExt> getFieldEnum()
  {
    return fieldEnum;
  }
  public void setFieldEnum(List<FieldExt> fieldEnum)
  {
    this.fieldEnum = fieldEnum;
  }

  public List<TranstypeExt> getTranstypeEnum()
  {
    return transtypeEnum;
  }
  public void setTranstypeEnum(List<TranstypeExt> transtypeEnum)
  {
    this.transtypeEnum = transtypeEnum;
  }

  public List<DoctypeExt> getDoctypeEnum()
  {
    return doctypeEnum;
  }
  public void setDoctypeEnum(List<DoctypeExt> doctypeEnum)
  {
    this.doctypeEnum = doctypeEnum;
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
