package com.yb.sys.controller;

import java.util.Set;
import java.util.TreeSet;
import java.util.List;
import java.util.ArrayList;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.common.hibernate.*;

import com.yb.sys.entity.IndividualExt;
import com.yb.sys.model.IndividualModel;
import com.yb.sys.service.IIndividualServiceExt;
import com.yb.sys.entity.CompanyExt;
import com.yb.sys.model.CompanyModel;
import com.yb.sys.service.ICompanyServiceExt;

import com.yb.sys.entity.CityExt;
import com.yb.sys.model.CityModel;
import com.yb.sys.service.ICityServiceExt;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.hibernate.criterion.Order;
//import org.hibernate.criterion.Property;

@Controller
@Scope("request")
public class FrontEndController
{
  private static final Logger logger = LoggerFactory.getLogger(FrontEndController.class);

	@Resource(name = "individualService")
	private IIndividualServiceExt individualService;

  @Resource(name = "companyService")
  private ICompanyServiceExt companyService;

	@Resource(name = "cityService")
	private ICityServiceExt cityService;

	@Resource(name = "languageService")
	private ILanguageServiceExt languageService;
  
	@Resource(name = "fieldService")
	private IFieldServiceExt fieldService;

	@Resource(name = "transtypeService")
	private ITranstypeServiceExt transtypeService;
	
	@Resource(name = "doctypeService")
	private IDoctypeServiceExt doctypeService;



	@RequestMapping(value = "/index", method = RequestMethod.GET)
	//public String index(@ModelAttribute IndividualModel individualModel, @ModelAttribute CompanyModel companyModel, ModelMap modelMap)
	public String index(ModelMap modelMap)
  {
    logger.debug("In FrontEndController.index()");

    //          Company       Individual
    // A1         1              0
    // A2         2              1
    // A3         3              2
    // A4         7              7
    //
    // So, we need 1+2+3+7=13 companies and 1+2+6=10 individuals;

    Long beginTime = System.currentTimeMillis();

    List<IndividualExt> indivs = (List<IndividualExt>) getEnities4MainPage2(10, 0); // 0 for individual;
    List<CompanyExt> comps = (List<CompanyExt>)getEnities4MainPage2(13, 1); // 1 for company;

    Long timeCost = System.currentTimeMillis() - beginTime;
    logger.info("Yuanguo, getEnities4MainPage2 time spent: " + timeCost);

    List<IndividualExt> individualsA2 = new ArrayList<IndividualExt>();
    List<IndividualExt> individualsA3 = new ArrayList<IndividualExt>();
    List<IndividualExt> individualsA4 = new ArrayList<IndividualExt>();

    List<CompanyExt> companiesA1 = new ArrayList<CompanyExt>();
    List<CompanyExt> companiesA2 = new ArrayList<CompanyExt>();
    List<CompanyExt> companiesA3 = new ArrayList<CompanyExt>();
    List<CompanyExt> companiesA4 = new ArrayList<CompanyExt>();

    int k = 0;
    List<IndividualExt> curIndivList = individualsA2;
    for(IndividualExt indiv : indivs)
    {
      logger.debug(indiv.getname()+" "+indiv.getrecompos().getrecompos()+" "+indiv.getuser().getcoin());

      curIndivList.add(indiv);

      ++k;
      if(k==1) 
        curIndivList = individualsA3;  //change list if current position has got enough individuals;
      else if (k==3)
        curIndivList = individualsA4;
    }

    k=0;
    List<CompanyExt> curCompList = companiesA1;
    for(CompanyExt comp : comps)
    {
      logger.debug(comp.getName()+" "+comp.getRecompos().getrecompos()+" "+comp.getUser().getcoin());

      curCompList.add(comp);

      ++k;
      if(k==1)
        curCompList = companiesA2; //change list if current position has got enough companies;
      else if (k==3)
        curCompList = companiesA3;
      else if (k==6)
        curCompList = companiesA4;
    }

		modelMap.addAttribute("individualsA2", individualsA2);
		modelMap.addAttribute("individualsA3", individualsA3);
		modelMap.addAttribute("individualsA4", individualsA4);

		modelMap.addAttribute("companiesA1", companiesA1);
		modelMap.addAttribute("companiesA2", companiesA2);
		modelMap.addAttribute("companiesA3", companiesA3);
		modelMap.addAttribute("companiesA4", companiesA4);

    /*
    if(compsA1.size()>0)
    {
      CompanyExt compA1 = compsA1.get(0);
      Set<LanguageExt> langs = compA1.getLanguages(); 

      if(langs.size()>6) 
      {
        Set<LanguageExt> top = topN(langs, 6);
        LanguageExt dummy = new LanguageExt();
        dummy.setId(1000L);
        dummy.setlanguage("更多");
        top.add(dummy);
        compA1.setLanguages(top);
      }

		  modelMap.addAttribute("companyA1", compA1);
    }
    */

		return "/sys/index";
	}


  //getEnities4MainPage1() and getEnities4MainPage2() are 2 functions that query data to be shown on main page. The basic
  //idea is like this:
  //  1. we need a fixed number of enities (e.g. 13 companies and 8 individuals) to fill A1, A2, A3, A4 positions on main page;
  //  2. each entity (company or individual, take company for example) has a priority;
  //     a. priority of company with recompos=A1 > priority of company with recompos=A1 > priority of company with recompos=A3 ...
  //     b. if two companies have the same recompos (for exmaple, both A2), the one has more coin has a higher priority;
  //
  //  3. Once we got enough entities (13 companies for example), in the descending order of priority, fill A1 positions first, 
  //     then fill A2 positions, then A3 and A4; 
  //     that is to say a company with recompos=A1 may be placed on A2 position if there is another company with recompos=A1 has
  //     a higher priority; and a company with recompos=A2 may be placed on A1 position if there is no company  with recompos=A1 
  //     at all. The administrator is able to and should control the number to make sure that A1 company is placed on A1 position 
  //     and so on.
  //
  //
  //There are 2 solutions to do this:
  // Solution1 (function getEnities4MainPage1), order the companies by 
  //  A. Primary: recompos.id ascending order; (A1 > A2 > A3 > A4 > NO) 
  //  B. Secondary: user.coin descending order;
  // Is here a performance issue? if there are many rows, will it sort all of them first (sort is heavy)?
  //
  //Solution2 (function getEnities4MainPage2);
  //  A. try to select enough (13 for company) companies with recompos=A1 ordered by user.coin; 
  //  B. if enough got, goto end;
  //  C. not enough got, e.g. only got 5 companis, then try to select 13-5=8 companies with recompos=A2;
  //  D. if enough got, goto end;
  //  E. still not enough try companies with recompos=A3, A4 and NO until enough got;
  //  F. end;
  // This way will cost several queries (at most 5), but number of elements for sort is decreased;
  private List getEnities4MainPage1(int num, int indivOrComp) //indivOrComp, 0: individual; 1: company;
  {
    //primary order: recompos.id    
    List<Order> recomposOrders = new ArrayList<Order>();
    recomposOrders.add(Order.asc("id"));
    AssocCriteria recomposCrit = new AssocCriteria("recompos", null, recomposOrders);

    //secondary order: user.coin;
    List<Order> coinOrders = new ArrayList<Order>();
    coinOrders.add(Order.desc("coin"));
    AssocCriteria coinCrit = new AssocCriteria("user", null, coinOrders);

    List<AssocCriteria> assocCriterias = new ArrayList<AssocCriteria>();
    assocCriterias.add(recomposCrit);
    assocCriterias.add(coinCrit);

    if(indivOrComp == 0) //individual
      return individualService.criteriaQuery(null, null, assocCriterias, 1, num);
    else
      return companyService.criteriaQuery(null, null, assocCriterias, 1, num);
  }


  //see comments of getEnities4MainPage1 function;
  private List getEnities4MainPage2(int num, int indivOrComp) //indivOrComp, 0: individual; 1: company;
  {
    List<AssocCriteria> assocCriterias = new ArrayList<AssocCriteria>();

    List<Order> coinOrders = new ArrayList<Order>();
    coinOrders.add(Order.desc("coin"));
    AssocCriteria coinCrit = new AssocCriteria("user", null, coinOrders);

    assocCriterias.add(coinCrit);


    List<List<ICondition>> conditionsList = new ArrayList<List<ICondition>>();

    List<ICondition> conditionsA1 = new ArrayList<ICondition>();
    conditionsA1.add(new EqCondition("recompos.id", 1L));  // A1
    conditionsList.add(conditionsA1);

    List<ICondition> conditionsA2 = new ArrayList<ICondition>();
    conditionsA2.add(new EqCondition("recompos.id", 2L));  // A2
    conditionsList.add(conditionsA2);

    List<ICondition> conditionsA3 = new ArrayList<ICondition>();
    conditionsA3.add(new EqCondition("recompos.id", 3L));  // A3
    conditionsList.add(conditionsA3);

    List<ICondition> conditionsA4 = new ArrayList<ICondition>();
    conditionsA4.add(new EqCondition("recompos.id", 4L));  // A4
    conditionsList.add(conditionsA4);

    List<ICondition> conditionsNO = new ArrayList<ICondition>();
    conditionsNO.add(new EqCondition("recompos.id", 5L));  // NO
    conditionsList.add(conditionsNO);


    if(indivOrComp == 0) //individual
    {

      List<IndividualExt> result = new ArrayList<IndividualExt>();

      //search for A1 individuals, then A2 individuals ... until enough instances got or run out of all instances.
      for(List<ICondition> condList : conditionsList) 
      {
        List<IndividualExt> indivs = individualService.criteriaQuery(condList, null, assocCriterias, 1, num);
        int numGot = indivs.size();

        for(IndividualExt indiv : indivs)
        {
          result.add(indiv);
        }

        num -= numGot;

        if(num==0)
        {
          break; //enough;
        }
      }

      return result;
    }
    else if (indivOrComp == 1) //company
    {
      List<CompanyExt> result = new ArrayList<CompanyExt>();

      //search for A1 companies, then A2 companies ... until enough instances got or run out of all instances.
      for(List<ICondition> condList : conditionsList)
      {
        List<CompanyExt> comps = companyService.criteriaQuery(condList, null, assocCriterias, 1, num);
        int numGot = comps.size();

        for(CompanyExt comp: comps)
        {
          result.add(comp);
        }

        num -= numGot;

        if(num==0)
        {
          break;
        }
      }
      return result;
    }

    return null;
  }

  /*
  private static <T> Set<T> topN(Set<T> all, int n)
  {
    if(all.size()<=n)
      return all;

    Set<T> copyAll = new TreeSet<T>();  // TreeSet is ordered, so we can get top N;
    for(T t: all)
      copyAll.add(t);

    Set<T> topN = new TreeSet<T>();
    int i = 0;
    for(T t: copyAll) 
    {
      topN.add(t);
      if(++i == n)
        break;
    }

    return topN;
  }
  */

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
  {
    //pass enumerations like cities, educations, schools and etc to company/edit.jsp
    List<ICondition> conditions = new ArrayList<ICondition>();
    modelMap.addAttribute("languages", languageService.criteriaQuery(conditions));
    modelMap.addAttribute("fields", fieldService.criteriaQuery(conditions));
    modelMap.addAttribute("transtypes", transtypeService.criteriaQuery(conditions));
    modelMap.addAttribute("doctypes", doctypeService.criteriaQuery(conditions));
    modelMap.addAttribute("cities", cityService.criteriaQuery(conditions));

    return "/sys/search";
  }

	@RequestMapping(value = "/query", method = RequestMethod.GET)
	public String query(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
  {
    String sp = request.getParameter("sp");
    String vf = request.getParameter("vf");
    String au = request.getParameter("au");
    String lg = request.getParameter("lg");

    logger.debug("Yuanguo: sp="+sp);
    logger.debug("Yuanguo: vf="+vf);
    logger.debug("Yuanguo: au="+au);
    logger.debug("Yuanguo: lg="+lg);

    return "/sys/query";
  }
}
