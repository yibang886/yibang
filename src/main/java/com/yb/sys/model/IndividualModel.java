package com.yb.sys.model;

import java.util.List;

import com.yb.sys.entity.IndividualExt;
import com.yb.sys.entity.CityExt;
import com.yb.sys.entity.EducationExt;
import com.yb.sys.entity.SchoolExt;
import com.yb.sys.entity.RecomposExt;

public class IndividualModel {

	private IndividualExt individualExt;
	
	private IndividualExt individualQueryCon;
	
	private int currentPage = 1;
	
	private int pageSize = 20;
	
	private int totalCount;
	
	private int pageCount;
	
	private Long[] checkId;
	
	private Long dataId;
	
	private List<IndividualExt> items;
	
	private String operationType;
	
	private String errorMessage;

  //Added by Yuanguo: when go to edit page, user should be alloed to select living city, education, school and etc. 
  //These options (enumerations) should be passed from controller to edit.jsp; this is what the following properties 
  //are intended for.
  private List<CityExt> cityEnum;
  private List<EducationExt> educationEnum;
  private List<SchoolExt> schoolEnum;
  private List<RecomposExt> recomposEnum;

	public IndividualExt getIndividualExt() {
		return individualExt;
	}

	public void setIndividualExt(IndividualExt individualExt) {
		this.individualExt = individualExt;
	}

	public IndividualExt getIndividualQueryCon() {
		return individualQueryCon;
	}

	public void setIndividualQueryCon(IndividualExt individualQueryCon) {
		this.individualQueryCon = individualQueryCon;
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

	public List<IndividualExt> getItems() {
		return items;
	}

	public void setItems(List<IndividualExt> items) {
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

  public List<EducationExt> getEducationEnum()
  {
    return educationEnum;
  }
  public void setEducationEnum(List<EducationExt> educationEnum)
  {
    this.educationEnum = educationEnum;
  }
 
  public List<SchoolExt> getSchoolEnum()
  {
    return schoolEnum;
  }
  public void setSchoolEnum(List<SchoolExt> schoolEnum)
  {
    this.schoolEnum = schoolEnum;
  }

  public List<RecomposExt> getRecomposEnum()
  {
    return recomposEnum;
  }
  public void setRecomposEnum(List<RecomposExt> recomposEnum)
  {
    this.recomposEnum = recomposEnum;
  }
}
