package com.yb.sys.controller;

import java.util.Set;
import java.util.TreeSet;
import java.util.List;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.HashMap;

import java.net.URLDecoder;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.hibernate.*;
import com.common.LRUCache;

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
import com.yb.sys.entity.EducationExt;
import com.yb.sys.model.EducationModel;
import com.yb.sys.service.IEducationServiceExt;
import com.yb.sys.entity.UserExt;
import com.yb.sys.model.UserModel;
import com.yb.sys.service.IUserServiceExt;

import com.yb.sys.model.UserModel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.hibernate.criterion.Order;

@Controller
@Scope("request")
public class FrontEndController
{
  private static final Logger logger = LoggerFactory.getLogger(FrontEndController.class);

  private static final int PAGE_SIZE = 5;

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

  @Resource(name = "educationService")
  private IEducationServiceExt educationService;

  @Resource(name = "userService")
  private IUserServiceExt userService;


  //map: language-ID(Long) -->  ID of companies which support this language (Long[])
  public static LRUCache<Long, Long[]> lgCompanyCache = new LRUCache<Long, Long[]>(24);
  //map: language-ID(Long) -->  ID of individuals which support this language (Long[])
  public static LRUCache<Long, Long[]> lgIndividualCache = new LRUCache<Long, Long[]>(24);

  //map: transtype-ID(Long) -->  ID of companies which support this transtype (Long[])
  public static LRUCache<Long, Long[]> ttCompanyCache = new LRUCache<Long, Long[]>(6);
  //map: transtype-ID(Long) -->  ID of individuals which support this transtype (Long[])
  public static LRUCache<Long, Long[]> ttIndividualCache = new LRUCache<Long, Long[]>(6);

  //map: doctype-ID(Long) -->  ID of companies which support this doctype (Long[])
  public static LRUCache<Long, Long[]> dtCompanyCache = new LRUCache<Long, Long[]>(16);
  //map: doctype-ID(Long) -->  ID of individuals which support this doctype (Long[])
  public static LRUCache<Long, Long[]> dtIndividualCache = new LRUCache<Long, Long[]>(16);

  //map: field-ID(Long) -->  ID of companies which support this field (Long[])
  public static LRUCache<Long, Long[]> fdCompanyCache = new LRUCache<Long, Long[]>(16);
  //map: field-ID(Long) -->  ID of individuals which support this field (Long[])
  public static LRUCache<Long, Long[]> fdIndividualCache = new LRUCache<Long, Long[]>(16);


  @RequestMapping(value = "/index", method = RequestMethod.GET)
  //public String index(@ModelAttribute IndividualModel individualModel, @ModelAttribute CompanyModel companyModel, ModelMap modelMap)
  public String index(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
  {
    logger.debug("In FrontEndController.index()");

    String st = request.getParameter("st");
    if(st != null)
    {
      st = st.trim();
    }

    logger.debug("Yuanguo: st="+st);

    //          Company       Individual
    // A1         1              0
    // A2         2              1
    // A3         3              2
    // A4         7              7
    //
    // So, we need 1+2+3+7=13 companies and 1+2+6=10 individuals;

    Long beginTime = System.currentTimeMillis();

    List<IndividualExt> indivs = (List<IndividualExt>) getEnities4MainPage2(10, 0, st); // 0 for individual;
    List<CompanyExt> comps = (List<CompanyExt>)getEnities4MainPage2(13, 1, st); // 1 for company;

    Long timeCost = System.currentTimeMillis() - beginTime;
    logger.debug("getEnities4MainPage2 time spent: " + timeCost);

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
  private List getEnities4MainPage2(int num, int indivOrComp, String search_text) //indivOrComp, 0: individual; 1: company;
  {
    List<AssocCriteria> assocCriterias = new ArrayList<AssocCriteria>();

    List<Order> coinOrders = new ArrayList<Order>();
    coinOrders.add(Order.desc("coin"));
    AssocCriteria coinCrit = new AssocCriteria("user", null, coinOrders);

    assocCriterias.add(coinCrit);


    List<List<ICondition>> conditionsList = new ArrayList<List<ICondition>>();

    List<ICondition> conditionsA1 = new ArrayList<ICondition>();
    if(search_text!=null && !search_text.equals(""))
    {
      conditionsA1.add(new LikeCondition("name", search_text));
    }
    conditionsA1.add(new EqCondition("recompos.id", 1L));  // A1
    conditionsList.add(conditionsA1);

    List<ICondition> conditionsA2 = new ArrayList<ICondition>();
    if(search_text!=null && !search_text.equals(""))
    {
      conditionsA2.add(new LikeCondition("name", search_text));
    }
    conditionsA2.add(new EqCondition("recompos.id", 2L));  // A2
    conditionsList.add(conditionsA2);

    List<ICondition> conditionsA3 = new ArrayList<ICondition>();
    if(search_text!=null && !search_text.equals(""))
    {
      conditionsA3.add(new LikeCondition("name", search_text));
    }
    conditionsA3.add(new EqCondition("recompos.id", 3L));  // A3
    conditionsList.add(conditionsA3);

    List<ICondition> conditionsA4 = new ArrayList<ICondition>();
    if(search_text!=null && !search_text.equals(""))
    {
      conditionsA4.add(new LikeCondition("name", search_text));
    }
    conditionsA4.add(new EqCondition("recompos.id", 4L));  // A4
    conditionsList.add(conditionsA4);

    List<ICondition> conditionsNO = new ArrayList<ICondition>();
    if(search_text!=null && !search_text.equals(""))
    {
      conditionsNO.add(new LikeCondition("name", search_text));
    }
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
    modelMap.addAttribute("educations", educationService.criteriaQuery(conditions));

    //the first time search-page is shown, query with no conditons;
    int indivNum = PAGE_SIZE*4/10;
    int compNum = PAGE_SIZE - indivNum;

    List<ICondition> condList = new ArrayList<ICondition>();

    List<IndividualExt> result_indivs = individualService.criteriaQuery(condList, null, null, 1, indivNum);
    modelMap.addAttribute("individuals", result_indivs);

    List<CompanyExt> result_comps = companyService.criteriaQuery(condList, null, null, 1, compNum);
    modelMap.addAttribute("companies", result_comps);

    return "/sys/search";
  }

  @RequestMapping(value = "/query", method = RequestMethod.GET)
  public String query(ModelMap modelMap, HttpServletRequest request, HttpServletResponse response)
  {
    String sp = request.getParameter("sp");
    String vf = request.getParameter("vf");
    String au = request.getParameter("au");
    String lg = request.getParameter("lg");
    String tt = request.getParameter("tt");
    String dt = request.getParameter("dt");
    String fd = request.getParameter("fd");
    String ct = request.getParameter("ct");
    String ws = request.getParameter("ws");
    String ed = request.getParameter("ed");
    String pg = request.getParameter("pg");
    String st = request.getParameter("st");
    if(st!=null)
    {
      try{
        st = URLDecoder.decode(st,"UTF-8");  
        st = st.trim();
      }
      catch(Throwable t)
      {
        logger.warn("failed to decode URI parameter st:"+st);
        st = null;
      }
    }

    logger.debug("Yuanguo: sp="+sp);
    logger.debug("Yuanguo: vf="+vf);
    logger.debug("Yuanguo: au="+au);
    logger.debug("Yuanguo: lg="+lg);
    logger.debug("Yuanguo: tt="+tt);
    logger.debug("Yuanguo: dt="+dt);
    logger.debug("Yuanguo: fd="+fd);
    logger.debug("Yuanguo: ct="+ct);
    logger.debug("Yuanguo: ws="+ws);
    logger.debug("Yuanguo: ed="+ed);
    logger.debug("Yuanguo: pg="+pg);
    logger.debug("Yuanguo: st="+st);


    int pageNo = 1;
    int indivNum=0;
    int compNum=0;

    if(pg!=null)
    {
      pageNo = Integer.parseInt(pg.trim());
    }

    if(sp==null || sp.trim().equals("") || sp.trim().equals("0")) //individual and company
    {
      indivNum = PAGE_SIZE*4/10;
      compNum = PAGE_SIZE - indivNum;
    }
    else if(sp.trim().equals("1")) //only individual
    {
      indivNum = PAGE_SIZE;
      compNum = 0;
    }
    else //only company
    {
      indivNum = 0;
      compNum = PAGE_SIZE;
    }


    List<ICondition> condList = new ArrayList<ICondition>();

    if(vf!=null && !vf.trim().equals("") && !vf.trim().equals("0"))
    {
      Long verify = Long.parseLong(vf.trim());
      if(verify==1L) //user wants validate-passed only
      {
        condList.add(new EqCondition("valid_pass", 1L)); //search for validate-passed
      }
      else
      {
        condList.add(new NeCondition("valid_pass", 1L)); //search for to-be-validated or validate-failed;
      }
    }

    if(au!=null && !au.trim().equals("") && !au.trim().equals("0"))
    {
      Long auth = Long.parseLong(au.trim());
      if(auth==1L) //user wants auth-passed only
      {
        condList.add(new EqCondition("auth_pass", 1L)); //search for auth-passed
      }
      else
      {
        condList.add(new NeCondition("auth_pass", 1L)); //search for to-be-auth or auth-failed;
      }
    }

    if(ct!=null && !ct.trim().equals("") && !ct.trim().equals("0"))
    {
      Long city = Long.parseLong(ct.trim());
      condList.add(new EqCondition("city.id", city));
    }

    if(st!=null && !st.trim().equals(""))
    {
      condList.add(new LikeCondition("name", st));
    }

    if(indivNum>0)
    {
      //we have to make a copy of the condList, because we need to add more conds to it, which are not applicable for company query later;
      List<ICondition> condList1 = new ArrayList<ICondition>();
      for(ICondition iCond:condList)
      {
        condList1.add(iCond);
      }

      if(sp!=null && sp.trim().equals("1")) //user wants individual only, so there may be individual-specific conditions;
      {
        if(ws!=null && !ws.trim().equals("") && !ws.trim().equals("0"))
        {
          Long workstyle = Long.parseLong(ws.trim());
          //because in front-page, 1:full-type, 2:part-time, but in backend, 0:full-time, 1:part-time;
          workstyle -= 1L;
          condList1.add(new EqCondition("workstyle", workstyle));
        }
        if(ed!=null && !ed.trim().equals("") && !ed.trim().equals("0"))
        {
          Long education = Long.parseLong(ed.trim());
          condList1.add(new EqCondition("education.id", education));
        }
      }

      boolean search = true;

      if(search && lg!=null && !lg.trim().equals("") && !lg.trim().equals("0"))
      {
        Long lang = Long.parseLong(lg.trim());
        Long[] supportIndivs = lgIndividualCache.get(lang);
        if(supportIndivs==null)
        {
          logger.debug("Cache missed for individual-query: language="+lang);
          LanguageExt languageExt = languageService.load(lang, true);
          Set<IndividualExt> indivs = languageExt.getindividuals();
          supportIndivs = new Long[indivs.size()];
          int i=0;
          for(IndividualExt ind:indivs)
          {
            supportIndivs[i++] = ind.getId();
          }

          if(supportIndivs.length>0)
            lgIndividualCache.put(lang, supportIndivs);
          else //no individual supports this language;
            supportIndivs = null;
        }
        else
        {
          logger.debug("Cache hit for individual-query: language="+lang);
          for(int i=0;i<supportIndivs.length;i++)
          {
            logger.debug("Individual: "+supportIndivs[i]);
          }
        }

        if(supportIndivs!=null && supportIndivs.length>0) 
        {
          condList1.add(new InCondition("id",supportIndivs));
        }
        else
        {
          logger.debug("No individual support language:"+lg);
          search = false;
        }
      }

      if(search && fd!=null && !fd.trim().equals("") && !fd.trim().equals("0"))
      {
        Long field = Long.parseLong(fd.trim());
        Long[] supportIndivs = fdIndividualCache.get(field);
        if(supportIndivs==null)
        {
          logger.debug("Cache missed for individual-query: field="+field);
          FieldExt fieldExt = fieldService.load(field, true);
          Set<IndividualExt> indivs = fieldExt.getindividuals();
          supportIndivs = new Long[indivs.size()];
          int i=0;
          for(IndividualExt ind:indivs)
          {
            supportIndivs[i++] = ind.getId();
          }
          if(supportIndivs.length>0)
            fdIndividualCache.put(field, supportIndivs);
          else
            supportIndivs = null;
        }
        else
        {
          logger.debug("Cache hit for individual-query: field="+field);
          for(int i=0;i<supportIndivs.length;i++)
          {
            logger.debug("Individual: "+supportIndivs[i]);
          }
        }

        if(supportIndivs!=null && supportIndivs.length>0) 
        {
          condList1.add(new InCondition("id",supportIndivs));
        }
        else
        {
          logger.debug("No individual support field:"+fd);
          search = false;
        }
      }

      if(search && dt!=null && !dt.trim().equals("") && !dt.trim().equals("0"))
      {
        Long dtype = Long.parseLong(dt.trim());
        Long[] supportIndivs = dtIndividualCache.get(dtype);
        if(supportIndivs==null)
        {
          logger.debug("Cache missed for individual-query: doctype="+dtype);
          DoctypeExt dtypeExt = doctypeService.load(dtype, true);
          Set<IndividualExt> indivs = dtypeExt.getindividuals();
          supportIndivs = new Long[indivs.size()];
          int i=0;
          for(IndividualExt ind:indivs)
          {
            supportIndivs[i++] = ind.getId();
          }
          if(supportIndivs.length>0)
            dtIndividualCache.put(dtype, supportIndivs);
          else
            supportIndivs = null;
        }
        else
        {
          logger.debug("Cache hit for individual-query: doctype="+dtype);
          for(int i=0;i<supportIndivs.length;i++)
          {
            logger.debug("Individual: "+supportIndivs[i]);
          }
        }

        if(supportIndivs!=null && supportIndivs.length>0) 
        {
          condList1.add(new InCondition("id",supportIndivs));
        }
        else
        {
          logger.debug("No individual support doctype:"+dt);
          search = false;
        }
      }

      if(search && tt!=null && !tt.trim().equals("") && !tt.trim().equals("0"))
      {
        Long ttype = Long.parseLong(tt.trim());
        Long[] supportIndivs = ttIndividualCache.get(ttype);
        if(supportIndivs==null)
        {
          logger.debug("Cache missed for individual-query: transtype="+ttype);
          TranstypeExt ttypeExt = transtypeService.load(ttype, true);
          Set<IndividualExt> indivs = ttypeExt.getindividuals();
          supportIndivs = new Long[indivs.size()];
          int i=0;
          for(IndividualExt ind:indivs)
          {
            supportIndivs[i++] = ind.getId();
          }
          if(supportIndivs.length>0)
            ttIndividualCache.put(ttype, supportIndivs);
          else
            supportIndivs = null;
        }
        else
        {
          logger.debug("Cache hit for individual-query: transtype="+ttype);
          for(int i=0;i<supportIndivs.length;i++)
          {
            logger.debug("Individual: "+supportIndivs[i]);
          }
        }

        if(supportIndivs!=null && supportIndivs.length>0) 
        {
          condList1.add(new InCondition("id",supportIndivs));
        }
        else
        {
          logger.debug("No individual support transtype:"+tt);
          search = false;
        }
      }


      if(search)
      {
        List<IndividualExt> result_indivs = individualService.criteriaQuery(condList1, null, null, pageNo, indivNum);
        modelMap.addAttribute("individuals", result_indivs);
        int num_got = result_indivs.size();
        logger.debug("Yuanguo: result_indivs.size()="+result_indivs.size());
        for(IndividualExt indiv: result_indivs)
        {
          logger.debug("Id:"+indiv.getId()+", Name="+indiv.getname());
        }
      }
      else
      {
        logger.debug("Skip searching individuals because none meet all conditions");
      }
    }

    if(compNum>0)
    {
      boolean search = true;
      if(search && lg!=null && !lg.trim().equals("") && !lg.trim().equals("0"))
      {
        Long lang = Long.parseLong(lg.trim());
        Long[] supportComps = lgCompanyCache.get(lang);
        if(supportComps==null)
        {
          logger.debug("Cache missed for company-query: language="+lang);
          LanguageExt languageExt = languageService.load(lang, true);
          Set<CompanyExt> comps = languageExt.getcompanies();
          supportComps = new Long[comps.size()];
          int i=0;
          for(CompanyExt c:comps)
          {
            supportComps[i++] = c.getId();
          }

          if(supportComps.length>0)
          {
            lgCompanyCache.put(lang, supportComps);
          }
          else //no company supports this language;
          {
            supportComps = null;
          }
        }
        else
        {
          logger.debug("Cache hit for company-query: language="+lang);
          for(int i=0;i<supportComps.length;i++)
          {
            logger.debug("Company: "+supportComps[i]);
          }
        }

        if(supportComps!=null && supportComps.length>0)
        {
          condList.add(new InCondition("id",supportComps));
        }
        else
        {
          logger.debug("No company support language:"+lg);
          search = false;
        }
      }

      if(search && fd!=null && !fd.trim().equals("") && !fd.trim().equals("0"))
      {
        Long field = Long.parseLong(fd.trim());
        Long[] supportComps = fdCompanyCache.get(field);
        if(supportComps==null)
        {
          logger.debug("Cache missed for company-query: field="+field);
          FieldExt fieldExt = fieldService.load(field, true);
          Set<CompanyExt> comps = fieldExt.getcompanies();
          supportComps = new Long[comps.size()];
          int i=0;
          for(CompanyExt cmp:comps)
          {
            supportComps[i++] = cmp.getId();
          }
          if(supportComps.length>0)
            fdCompanyCache.put(field, supportComps);
          else
            supportComps = null;
        }
        else
        {
          logger.debug("Cache hit for company-query: field="+field);
          for(int i=0;i<supportComps.length;i++)
          {
            logger.debug("Company: "+supportComps[i]);
          }
        }

        if(supportComps!=null && supportComps.length>0) 
        {
          condList.add(new InCondition("id",supportComps));
        }
        else
        {
          logger.debug("No company support field:"+fd);
          search = false;
        }
      }
      
      if(search && dt!=null && !dt.trim().equals("") && !dt.trim().equals("0"))
      {
        Long dtype = Long.parseLong(dt.trim());
        Long[] supportComps = dtCompanyCache.get(dtype);
        if(supportComps==null)
        {
          logger.debug("Cache missed for company-query: doctype="+dtype);
          DoctypeExt dtypeExt = doctypeService.load(dtype, true);
          Set<CompanyExt> comps = dtypeExt.getcompanies();
          supportComps = new Long[comps.size()];
          int i=0;
          for(CompanyExt cmp:comps)
          {
            supportComps[i++] = cmp.getId();
          }
          if(supportComps.length>0)
            dtCompanyCache.put(dtype, supportComps);
          else
            supportComps = null;
        }
        else
        {
          logger.debug("Cache hit for company-query: doctype="+dtype);
          for(int i=0;i<supportComps.length;i++)
          {
            logger.debug("Company: "+supportComps[i]);
          }
        }

        if(supportComps!=null && supportComps.length>0) 
        {
          condList.add(new InCondition("id",supportComps));
        }
        else
        {
          logger.debug("No company support doctype:"+dt);
          search = false;
        }
      }

      if(search && tt!=null && !tt.trim().equals("") && !tt.trim().equals("0"))
      {
        Long ttype = Long.parseLong(tt.trim());
        Long[] supportComps = ttCompanyCache.get(ttype);
        if(supportComps==null)
        {
          logger.debug("Cache missed for company-query: transtype="+ttype);
          TranstypeExt ttypeExt = transtypeService.load(ttype, true);
          Set<CompanyExt> comps = ttypeExt.getcompanies();
          supportComps = new Long[comps.size()];
          int i=0;
          for(CompanyExt cmp:comps)
          {
            supportComps[i++] = cmp.getId();
          }
          if(supportComps.length>0)
            ttCompanyCache.put(ttype, supportComps);
          else
            supportComps = null;
        }
        else
        {
          logger.debug("Cache hit for company-query: transtype="+ttype);
          for(int i=0;i<supportComps.length;i++)
          {
            logger.debug("Company: "+supportComps[i]);
          }
        }

        if(supportComps!=null && supportComps.length>0) 
        {
          condList.add(new InCondition("id",supportComps));
        }
        else
        {
          logger.debug("No company support transtype:"+tt);
          search = false;
        }
      }

      if(search)
      {
        List<CompanyExt> result_comps = companyService.criteriaQuery(condList, null, null, pageNo, compNum);
        modelMap.addAttribute("companies", result_comps);
        logger.debug("Yuanguo: result_comps.size()="+result_comps.size());
        for(CompanyExt cmp: result_comps)
        {
          logger.debug("Id:"+cmp.getId()+", Name="+cmp.getName());
        }
      }
      else
      {
        logger.debug("Skip searching companies because none meet all conditions");
      }
    }

    return "/sys/query";
  }

  @RequestMapping(value = "/goRegister")
  public String goRegister(@ModelAttribute UserModel userModel, ModelMap model){
    userModel.setOperationType("create");
    model.addAttribute(userModel);
    return "/sys/register";
  }

  @RequestMapping(value = "/doRegister")
  public String doRegister(@ModelAttribute UserModel userModel, ModelMap model){
    if(userModel.getUserExt() != null){

      String email = userModel.getUserExt().getemail();
      String tel = userModel.getUserExt().gettel();
      String mob = userModel.getUserExt().getmobile();
      String fax = userModel.getUserExt().getfax();
      String qq = userModel.getUserExt().getqq();
      String wx = userModel.getUserExt().getweixin();

      if(email!=null) email = email.trim();
      if(tel!=null) tel = tel.trim();
      if(mob!=null) mob = mob.trim();
      if(fax!=null) fax = fax.trim();
      if(qq!=null) qq = qq.trim();
      if(wx!=null) wx = wx.trim(); 

      if(email!=null && !email.equals(""))
        userModel.getUserExt().setemail(email);
      else
        userModel.getUserExt().setemail(null);

      if(tel!=null && !tel.equals(""))
        userModel.getUserExt().settel(tel);
      else
        userModel.getUserExt().settel(null);
      
      if(mob!=null && !mob.equals(""))
        userModel.getUserExt().setmobile(mob);
      else
        userModel.getUserExt().setmobile(null);

      if(fax!=null && !fax.equals(""))
        userModel.getUserExt().setfax(fax);
      else
        userModel.getUserExt().setfax(null);

      if(qq!=null && !qq.equals(""))
        userModel.getUserExt().setqq(qq);
      else
        userModel.getUserExt().setqq(null);

      if(wx!=null && !wx.equals(""))
        userModel.getUserExt().setweixin(wx);
      else
        userModel.getUserExt().setweixin(null);

      userModel.getUserExt().setcoin(0L);

      userService.create(userModel.getUserExt());
    }

    if(userModel.getUserExt().getuser_type()==0L) 
      return "/sys/indiv_home"; //individual
    else
      return "/sys/comp_home";  //company
  }

  @RequestMapping(value = "/emailUnique")
  @ResponseBody
  public Map<String,Integer> emailUnique(HttpServletRequest request, HttpServletResponse response, ModelMap model){

    String email = request.getParameter("email");
    if(email != null) email = email.trim();

    Map<String,Integer> map = new HashMap<String,Integer>();
    String key = "NumWithEmail";

    if(email!=null && !email.equals(""))
    {
      List<ICondition> conditions = new ArrayList<ICondition>();
      conditions.add(new EqCondition("email",email));
      try{
        int allNum = userService.criteriaQueryCount(conditions);
        map.put(key,allNum);
      }
      catch(Exception e)
      {
        logger.error("Unexpected exception thrown");
        e.printStackTrace();
        map.put(key,-1);
      }
    }
    else //client should never give null or empty email
    {
      map.put(key,-1);
    }

    return map;
  }
}
