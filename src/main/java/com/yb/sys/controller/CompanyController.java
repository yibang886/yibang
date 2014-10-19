package com.yb.sys.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.common.hibernate.*;

import com.yb.sys.entity.CompanyExt;
import com.yb.sys.model.CompanyModel;
import com.yb.sys.service.ICompanyServiceExt;

@Controller
@Scope("request")
public class CompanyController 
{
  private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);

  @Resource(name = "companyService")
  private ICompanyServiceExt companyService;
  
  @RequestMapping(value = "/company/index")
  public String index(@ModelAttribute CompanyModel entityModel, 
                                      ModelMap modelMap, 
                                      HttpServletRequest request, 
                                      HttpServletResponse response)
  {
    modelMap.addAttribute("entityModel", entityModel);
    return "/sys/company/index";
  }
  
  @RequestMapping(value = "/company/query")
  public String query(@ModelAttribute CompanyModel entityModel,
                                      ModelMap modelMap, 
                                      HttpServletRequest request, 
                                      HttpServletResponse response)
  {
    CompanyExt queryCon = entityModel.getCompanyQueryCon();
    List<ICondition> conditions = new ArrayList<ICondition>();
    if(queryCon != null)
    {
    }
    entityModel.setItems(companyService.criteriaQuery(conditions));
    modelMap.addAttribute("entityModel", entityModel);
    return "/sys/company/index";
  }
  
  @RequestMapping(value = "/company/goView")
  public String goView(@ModelAttribute CompanyModel entityModel,
                                       ModelMap modelMap,
                                       HttpServletRequest request,
                                       HttpServletResponse response)
  {
    entityModel.setOperationType("view");
    if(entityModel.getDataId() != 0)
    {
      CompanyExt companyExt = companyService.load(entityModel.getDataId(), true);
      entityModel.setCompanyExt(companyExt);
    }
    
    modelMap.addAttribute("entityModel", entityModel);
    return "/sys/company/detail";
  }
  
  @RequestMapping(value = "/company/goCreate")
  public String goCreate(@ModelAttribute CompanyModel entityModel, 
                                         ModelMap modelMap,
                                         HttpServletRequest request,
                                         HttpServletResponse response)
  {
    entityModel.setOperationType("create");
    modelMap.addAttribute("entityModel", entityModel);
    return "/sys/company/edit";
  }
  
  @RequestMapping(value = "/company/doCreate")
  public String doCreate(@ModelAttribute CompanyModel entityModel, 
                                         ModelMap modelMap,
                                         HttpServletRequest request,
                                         HttpServletResponse response)
  {
    CompanyExt companyExt = entityModel.getCompanyExt();
    if(companyExt != null)
    {
      companyService.create(companyExt);
    }

    return "forward:/company/query";
  }
  
  @RequestMapping(value = "/company/goEdit")
  public String goEdit(@ModelAttribute CompanyModel entityModel, 
                                       ModelMap modelMap,
                                       HttpServletRequest request,
                                       HttpServletResponse response)
  {
    entityModel.setOperationType("edit");
    if(entityModel.getDataId() != 0)
    {
      CompanyExt companyExt = companyService.load(entityModel.getDataId(), true);
      entityModel.setCompanyExt(companyExt);
      modelMap.addAttribute("entityModel", entityModel);
    }
    return "/sys/company/edit";
  }
  
  @RequestMapping(value = "/company/doEdit")
  public String doEdit(@ModelAttribute CompanyModel entityModel, 
                                       ModelMap modelMap,
                                       HttpServletRequest request,
                                       HttpServletResponse response)
  {
    if(entityModel.getCompanyExt() != null && entityModel.getCompanyExt().getId() != 0)
    {
      CompanyExt companyExt = entityModel.getCompanyExt();
      CompanyExt companyExtPer = companyService.load(entityModel.getCompanyExt().getId(), true);
      companyService.save(companyExt);
    }
    return "forward:/company/query";
  }
  
  @RequestMapping(value = "/company/doDelete")
  public String doDelete(@ModelAttribute CompanyModel entityModel, 
                                         ModelMap modelMap,
                                         HttpServletRequest request,
                                         HttpServletResponse response)
  {
    if(entityModel.getCompanyExt() != null)
    {
      companyService.create(entityModel.getCompanyExt());
    }
    if(entityModel.getDataId() != 0)
    {
      CompanyExt companyExt = companyService.load(entityModel.getDataId(), true);
      companyService.delete(companyExt);
    }
    return "forward:/company/query";
  }
}
