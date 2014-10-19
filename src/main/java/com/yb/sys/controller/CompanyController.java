package com.yb.sys.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

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

import com.yb.sys.entity.CityExt;
import com.yb.sys.model.CityModel;
import com.yb.sys.service.ICityServiceExt;
import com.yb.sys.entity.RecomposExt;
import com.yb.sys.model.RecomposModel;
import com.yb.sys.service.IRecomposServiceExt;
import com.yb.sys.entity.LanguageExt;
import com.yb.sys.model.LanguageModel;
import com.yb.sys.service.ILanguageServiceExt;
import com.yb.sys.entity.FieldExt;
import com.yb.sys.model.FieldModel;
import com.yb.sys.service.IFieldServiceExt;
import com.yb.sys.entity.TranstypeExt;
import com.yb.sys.model.TranstypeModel;
import com.yb.sys.service.ITranstypeServiceExt;
import com.yb.sys.entity.DoctypeExt;
import com.yb.sys.model.DoctypeModel;
import com.yb.sys.service.IDoctypeServiceExt;

@Controller
@Scope("request")
public class CompanyController 
{
  private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);

  @Resource(name = "companyService")
  private ICompanyServiceExt companyService;

  //Added by Yuanguo: when go to edit page, user should be alloed to select living city and etc. 
  //These service beans are used to load the enumerations.
	@Resource(name = "cityService")
	private ICityServiceExt cityService;

	@Resource(name = "recomposService")
	private IRecomposServiceExt recomposService;

	@Resource(name = "languageService")
	private ILanguageServiceExt languageService;
  
	@Resource(name = "fieldService")
	private IFieldServiceExt fieldService;

	@Resource(name = "transtypeService")
	private ITranstypeServiceExt transtypeService;
	
	@Resource(name = "doctypeService")
	private IDoctypeServiceExt doctypeService;


  
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

      //pass enumerations like cities, educations, schools and etc to individual/edit.jsp
      List<ICondition> conditions = new ArrayList<ICondition>();
      entityModel.setCityEnum(cityService.criteriaQuery(conditions));
      entityModel.setRecomposEnum(recomposService.criteriaQuery(conditions));
      entityModel.setLanguageEnum(languageService.criteriaQuery(conditions));
      entityModel.setFieldEnum(fieldService.criteriaQuery(conditions));
      entityModel.setTranstypeEnum(transtypeService.criteriaQuery(conditions));
      entityModel.setDoctypeEnum(doctypeService.criteriaQuery(conditions));

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

      //get languages selected by language checkbox
      String[] lang_ids = request.getParameterValues("langCheckbox");
      Set<LanguageExt> languages = new TreeSet<LanguageExt>();
      if(lang_ids != null)
      {
        for(String lang_id:lang_ids)
        {
          LanguageExt lang = new LanguageExt();
          lang.setId(Long.parseLong(lang_id));
          languages.add(lang);
        }
      }
      companyExt.setLanguages(languages);

      //get fields selected by field checkbox
      String[] field_ids = request.getParameterValues("fieldCheckbox");
      Set<FieldExt> fields = new TreeSet<FieldExt>();
      if(field_ids != null)
      {
        for(String field_id:field_ids)
        {
          FieldExt field = new FieldExt();
          field.setId(Long.parseLong(field_id));
          fields.add(field);
        }
      }
      companyExt.setFields(fields);

      //get transtypes slected by transtype checkbox
      String[] transtype_ids = request.getParameterValues("transtypeCheckbox");
      Set<TranstypeExt> transtypes = new TreeSet<TranstypeExt>();
      if(transtype_ids != null)
      {
        for(String transtype_id:transtype_ids)
        {
          TranstypeExt transtype = new TranstypeExt();
          transtype.setId(Long.parseLong(transtype_id));
          transtypes.add(transtype);
        }
      }
      companyExt.setTranstypes(transtypes);

      //get doctypes selected by doctype checkbox
      String[] doctype_ids = request.getParameterValues("doctypeCheckbox");
      Set<DoctypeExt> doctypes = new TreeSet<DoctypeExt>();
      if(doctype_ids != null)
      {
        for(String doctype_id:doctype_ids)
        {
          DoctypeExt doctype = new DoctypeExt();
          doctype.setId(Long.parseLong(doctype_id));
          doctypes.add(doctype);
        }
      }
      companyExt.setDoctypes(doctypes);

      CompanyExt companyExtPer = companyService.load(entityModel.getCompanyExt().getId(), true);

      //We don't set these fields in edit.jsp, so we need to keep the existing values, or they will become null;
      companyExt.setLogo_suffix(companyExtPer.getLogo_suffix());
      companyExt.setAuthfile_suffix(companyExtPer.getAuthfile_suffix());

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
