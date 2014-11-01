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
import com.yb.sys.entity.LanguageExt;

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

    List<IndividualExt> indivs = (List<IndividualExt>) getEnities4MainPage1(10, 0); // 0 for individual;
    List<CompanyExt> comps = (List<CompanyExt>)getEnities4MainPage1(13, 1); // 1 for company;

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
    return null;
  }

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
}
