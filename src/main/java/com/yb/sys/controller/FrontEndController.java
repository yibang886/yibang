package com.yb.sys.controller;

import java.util.Set;
import java.util.TreeSet;
import java.util.List;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.HashMap;
import java.util.Calendar;

import java.io.File;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.common.hibernate.*;
import com.common.LRUCache;
import com.common.upload.UploadUtil;
import com.common.upload.ReceivedFile;
import com.common.upload.ReceivedData;
import com.common.config.ConfigService;

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
import com.yb.sys.entity.SchoolExt;
import com.yb.sys.model.SchoolModel;
import com.yb.sys.service.ISchoolServiceExt;
import com.yb.sys.entity.RecomposExt;
import com.yb.sys.model.RecomposModel;
import com.yb.sys.service.IRecomposServiceExt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.hibernate.criterion.Order;

@Controller
@Scope("request")
public class FrontEndController
{
  private static final Logger logger = LoggerFactory.getLogger(FrontEndController.class);

  private static final int PAGE_SIZE = 20;

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

  @Resource(name = "schoolService")
  private ISchoolServiceExt schoolService;

  @Resource(name = "recomposService")
  private IRecomposServiceExt recomposService;

  @Resource(name = "configService")
  private ConfigService configService;

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
    //pass the search text back to page
    modelMap.addAttribute("search_text",st);

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
    if(st!=null && !st.trim().equals(""))
    {
      condList.add(new LikeCondition("name", st));
    }

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
        List<IndividualExt> result_indivs = individualService.criteriaQuery(condList1, null, assocCriterias, pageNo, indivNum);
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
        List<CompanyExt> result_comps = companyService.criteriaQuery(condList, null, assocCriterias, pageNo, compNum);
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


  @RequestMapping(value = "/detail")
  public String detail(ModelMap model, HttpServletRequest request)
  {
    Long userId;
    try{
      userId = Long.parseLong(request.getParameter("id").trim());
    }
    catch (Throwable e){
      logger.error("Unexpected exception thrown when parsing userId");
      e.printStackTrace();
      return error_page(model, "系统故障", "未知错误导致输入用户ID为空或者非法！");
    }

    UserExt userExt = null;
    try{
      userExt = userService.load(userId, true);
    }
    catch(Throwable e)
    {
      logger.error("Cannot load user object, maybe userId is invalid.");
      userExt = null;
      return error_page(model, "系统故障", "数据库操作异常导致加载用户失败！");
    }
    if(userExt == null)
      return error_page(model, "系统故障", "加载用户失败！");

    UserModel userModel = new UserModel();
    userModel.setUserExt(userExt);
    model.addAttribute("userModel", userModel);
    

    if(userExt.getuser_type()==0L)  // individual;
    {
      IndividualModel individualModel = new IndividualModel();
      individualModel.setIndividualExt(userExt.getindividual());
      model.addAttribute("individualModel", individualModel);

      return "/sys/indiv_detail";
    }
    else if(userExt.getuser_type()==1L)  // company;
    {
      CompanyModel companyModel = new CompanyModel();
      companyModel.setCompanyExt(userExt.getcompany());
      model.addAttribute("companyModel", companyModel);

      return "/sys/comp_detail";
    }

    return error_page(model, "系统故障", "未知错误导致用户类型非法！");
  }


  @RequestMapping(value = "/goRegister")
  public String goRegister(@ModelAttribute UserModel userModel, ModelMap model, HttpServletRequest request)
  {
    userModel.setOperationType("create");

    Long userType = 0L;
    try{
      userType = Long.parseLong(request.getParameter("type").trim());
    } 
    catch (Throwable e){
      userType = 0L;
    }

    model.addAttribute("userType",userType);
    model.addAttribute(userModel);
    return "/sys/register";
  }

  @RequestMapping(value = "/doRegister")
  public String doRegister(@ModelAttribute UserModel userModel, ModelMap model, HttpSession session)
  {
    if(userModel.getUserExt() == null){
      logger.error("userModel.getUserExt() cannot be null for doRegister");
      return error_page(model, "系统故障", "未知错误导致输入信息为空，注册失败！");
    }

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

    try{
      UserExt ue = userService.create(userModel.getUserExt());
      session.setAttribute("user", ue);
    }
    catch(Exception e)
    {
      logger.error("Unexpected exception thrown when creating user");
      e.printStackTrace();
      return error_page(model, "系统故障", "数据库操作异常导致创建用户失败！");
    }

    //in home page of a user, there are 3 pages that might be shown: 0. My Status; 1. Base Info; 2. Translation Service;
    //thus, when we go to this page, we need to specify which one to show; and if it is 2 (Translation Service), there are
    //muli steps, so it is needed to set step in this case;
    model.addAttribute("page", 2);
    model.addAttribute("step", 1); //first step in publishing or editing individual translation service;

    //we need to pass the userId back and forth;
    model.addAttribute("userId", userModel.getUserExt().getId());

    if(userModel.getUserExt().getuser_type()==0L)  //individual
    {
      IndividualModel individualModel = new IndividualModel();

      //pass enumerations like cities, educations, schools and etc to individual/edit.jsp
      List<ICondition> conditions = new ArrayList<ICondition>();
      individualModel.setCityEnum(cityService.criteriaQuery(conditions));
      individualModel.setEducationEnum(educationService.criteriaQuery(conditions));
      individualModel.setSchoolEnum(schoolService.criteriaQuery(conditions));
      individualModel.setLanguageEnum(languageService.criteriaQuery(conditions));
      individualModel.setFieldEnum(fieldService.criteriaQuery(conditions));
      individualModel.setTranstypeEnum(transtypeService.criteriaQuery(conditions));
      individualModel.setDoctypeEnum(doctypeService.criteriaQuery(conditions));

      model.addAttribute("individualModel",individualModel);
      return "/sys/indiv_home"; 
    }
    else //company
    {
      CompanyModel companyModel = new CompanyModel();

      //pass enumerations like cities, educations, schools and etc to company/edit.jsp
      List<ICondition> conditions = new ArrayList<ICondition>();
      companyModel.setCityEnum(cityService.criteriaQuery(conditions));
      companyModel.setLanguageEnum(languageService.criteriaQuery(conditions));
      companyModel.setFieldEnum(fieldService.criteriaQuery(conditions));
      companyModel.setTranstypeEnum(transtypeService.criteriaQuery(conditions));
      companyModel.setDoctypeEnum(doctypeService.criteriaQuery(conditions));

      model.addAttribute("companyModel",companyModel);
      return "/sys/comp_home";  
    }
  }


  @RequestMapping(value = "/doUserEdit")
  public String doUserEdit(@ModelAttribute UserModel userModel, ModelMap model, HttpServletRequest request, HttpSession session)
  {

    if(userModel.getUserExt() == null || userModel.getUserExt().getId() == 0)
    {
      logger.error("Unknown userId");
      return error_page(model, "系统故障", "未知错误导致输入用户ID为空，修改失败！");
    }

    UserExt userExtPer = userService.load(userModel.getUserExt().getId(), true);

    Long userType;

    String cancel = request.getParameter("cancel");

    if(cancel==null) //no cancel, so we should edit (modify) the user object;
    {
      //check if we can edit: if the translation service has been published, userType cannot modified;
      if(!userModel.getUserExt().getuser_type().equals(userExtPer.getuser_type()))
      {
        if(userExtPer.getindividual()!=null || userExtPer.getcompany()!=null)
        {
          logger.debug("Cannot modify user type if translation service has been published.");
          return error_page(model, "操作非法", "您已经发布了" 
                                   + (userModel.getUserExt().getuser_type().equals(0L)?"个人译员翻译服务":"翻译公司翻译服务") 
                                   + "，不能更改用户类型！");
        }
      }

      userType = userModel.getUserExt().getuser_type();

      String tel = userModel.getUserExt().gettel();
      String mob = userModel.getUserExt().getmobile();
      String fax = userModel.getUserExt().getfax();
      String qq = userModel.getUserExt().getqq();
      String wx = userModel.getUserExt().getweixin();
  
      if(tel!=null) tel = tel.trim();
      if(mob!=null) mob = mob.trim();
      if(fax!=null) fax = fax.trim();
      if(qq!=null) qq = qq.trim();
      if(wx!=null) wx = wx.trim(); 
  
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
  
      UserExt userExt = userModel.getUserExt();
      userExt.setcoin(userExtPer.getcoin());
      userService.save(userExt);

      session.setAttribute("user", userExt);
    }
    else //cancel
    {
      userType =  userExtPer.getuser_type();

      userModel.setUserExt(userExtPer);
      model.addAttribute("userModel", userModel);
    }

    model.addAttribute("page", 1);
    model.addAttribute("userId", userModel.getUserExt().getId());
    if(userType==0L)  //individual
    {
      return "/sys/indiv_home"; 
    }
    else  //company
    {
      return "/sys/comp_home";  
    }
  }

  

  void getCheckboxValues(HttpServletRequest request, Set<LanguageExt> languages, Set<FieldExt> fields, Set<TranstypeExt> transtypes, Set<DoctypeExt> doctypes)
  {
    //get languages selected by language checkbox
    String[] lang_ids = request.getParameterValues("langCheckbox");
    if(lang_ids != null)
    {
      for(String lang_id:lang_ids)
      {
        LanguageExt lang = new LanguageExt();
        lang.setId(Long.parseLong(lang_id));
        languages.add(lang);
      }
    }

    //get fields selected by field checkbox
    String[] field_ids = request.getParameterValues("fieldCheckbox");
    if(field_ids != null)
    {
      for(String field_id:field_ids)
      {
        FieldExt field = new FieldExt();
        field.setId(Long.parseLong(field_id));
        fields.add(field);
      }
    }

    //get transtypes slected by transtype checkbox
    String[] transtype_ids = request.getParameterValues("transtypeCheckbox");
    if(transtype_ids != null)
    {
      for(String transtype_id:transtype_ids)
      {
        TranstypeExt transtype = new TranstypeExt();
        transtype.setId(Long.parseLong(transtype_id));
        transtypes.add(transtype);
      }
    }

    //get doctypes selected by doctype checkbox
    String[] doctype_ids = request.getParameterValues("doctypeCheckbox");
    if(doctype_ids != null)
    {
      for(String doctype_id:doctype_ids)
      {
        DoctypeExt doctype = new DoctypeExt();
        doctype.setId(Long.parseLong(doctype_id));
        doctypes.add(doctype);
      }
    }
  }


  @RequestMapping(value = "/doCreateOrEditIndiv")
  public String doCreateOrEditIndiv(@ModelAttribute IndividualModel individualModel, ModelMap model, HttpServletRequest request)
  {
    Long userId;
    try{
      userId = Long.parseLong(request.getParameter("id").trim());
    }
    catch (Throwable e){
      logger.error("Unexpected exception thrown when parsing userId");
      e.printStackTrace();
      return error_page(model, "系统故障", "未知错误导致输入用户ID为空或者非法，操作失败！");
    }
    model.addAttribute("userId", userId);


    Integer step;
    try{
      step = Integer.parseInt(request.getParameter("step").trim());
    }
    catch (Throwable e){
      logger.error("Unexpected exception thrown when parsing step");
      e.printStackTrace();
      return error_page(model, "系统故障", "未知错误导致输入步骤为空或者非法，操作失败！");
    }

    if(step==1)
    {
      IndividualExt individualExt = individualModel.getIndividualExt();
      if( individualExt == null)
      {
        logger.error("individualModel cannot be null for step 1 of Creating-Or-Editing-Individual");
        return error_page(model, "系统故障", "未知错误导致输入翻译服务信息为空，操作失败！");
      }

      String cancel = request.getParameter("cancel");

      if(cancel!=null) //cancel the 1st step
      {
        //since we canclled the 1st step, we try to load the original individual instance; if the user
        //has not published the translation serivice, load will return null, this is expected;
        IndividualExt origIndiv = individualService.load(userId,true);         
        individualModel.setIndividualExt(origIndiv);

        //pass enumerations like cities, educations, schools and etc to individual/edit.jsp
        List<ICondition> conditions = new ArrayList<ICondition>();
        individualModel.setCityEnum(cityService.criteriaQuery(conditions));
        individualModel.setEducationEnum(educationService.criteriaQuery(conditions));
        individualModel.setSchoolEnum(schoolService.criteriaQuery(conditions));
        individualModel.setLanguageEnum(languageService.criteriaQuery(conditions));
        individualModel.setFieldEnum(fieldService.criteriaQuery(conditions));
        individualModel.setTranstypeEnum(transtypeService.criteriaQuery(conditions));
        individualModel.setDoctypeEnum(doctypeService.criteriaQuery(conditions));

        model.addAttribute("individualModel", individualModel);
  
        //since we canclled the 1st step, we stay at the 1st step of the translation service page;
        model.addAttribute("page", 2); 
        model.addAttribute("step", 1);
  
        return "/sys/indiv_home"; 
      }
      else  //not cancel the 1st step, so create or edit the individual object
      {
        String name = individualExt.getname();
        if(name!=null) name = name.trim();
        if(name==null || name.equals(""))
        {
          logger.error("Name cannot be null or empty.");
          return error_page(model, "统故障", "未知错误导致输入姓名为空，操作失败！"); //客户端js已经保证了姓名不为空，若这里为空，系统出现未知故障
        }
        individualExt.setname(name);
  
        Long gender = individualExt.getgender();
        if(gender==null || (gender!=0L && gender!=1L))
        {
          logger.error("Gender invalid: "+gender);
          return error_page(model, "统故障", "未知错误导致输入性别为空，操作失败！"); //客户端js已经保证了性别不为空，若这里为空，系统出现未知故障
        }
  
        EducationExt edu = individualExt.geteducation();
        if(edu==null)
        {
          logger.error("Education is null");
          return error_page(model, "统故障", "未知错误导致输入教育水平为空，操作失败！"); //客户端js已经保证了教育水平不为空，若这里为空，系统出现未知故障
        }
   
        SchoolExt school = individualExt.getschool();
        if(school==null)
        {
          logger.error("School is null");
          return error_page(model, "统故障", "未知错误导致输入毕业院校为空，操作失败！"); //客户端js已经保证了教育水平不为空，若这里为空，系统出现未知故障
        }
  
        Long birth_year = individualExt.getbirth_year();
        if(birth_year==null)
        {
          logger.error("Birth_year is null");
          return error_page(model, "统故障", "未知错误导致输入出生年月为空，操作失败！"); //客户端js已经保证了出生年月不为空，若这里为空，系统出现未知故障
        }
  
        CityExt city = individualExt.getcity();
        if(city==null)
        {
          logger.error("City is null");
          return error_page(model, "统故障", "未知错误导致输入所在城市为空，操作失败！"); //客户端js已经保证了所在城市不为空，若这里为空，系统出现未知故障
        }
        
        String mainpage = individualExt.getmainpage();
        if(mainpage!=null) mainpage=mainpage.trim();
        if(mainpage!=null && !mainpage.equals(""))
          individualExt.setmainpage(mainpage);
        else
          individualExt.setmainpage(null);
  
        Long workstyle = individualExt.getworkstyle();
        if(workstyle==null || (workstyle!=0L && workstyle!=1L))
        {
          logger.error("Workstyle invalid: "+workstyle);
          return error_page(model, "统故障", "未知错误导致输入工作方式为空或者非法，操作失败！"); //客户端js已经保证了工作方式不空且合法，若这里为空或非法，系统出现未知故障
        }
  
        if(individualExt.getexp_year()==null)
          individualExt.setexp_year(0L);
  
        if(individualExt.getexp_trans()==null)
          individualExt.setexp_trans(0L);
  
        String works = individualExt.getworks();
        if(works!=null) works=works.trim();
        if(works!=null && !works.equals(""))
          individualExt.setworks(works);
        else
          individualExt.setworks(null);
  
        String introduct = individualExt.getintroduct();
        if(introduct!=null) introduct=introduct.trim();
        if(introduct!=null && !introduct.equals(""))
          individualExt.setintroduct(introduct);
        else
          individualExt.setintroduct(null);
  
        Set<LanguageExt> languages = new TreeSet<LanguageExt>();
        Set<FieldExt> fields = new TreeSet<FieldExt>();
        Set<TranstypeExt> transtypes = new TreeSet<TranstypeExt>();
        Set<DoctypeExt> doctypes = new TreeSet<DoctypeExt>();
  
        getCheckboxValues(request, languages, fields, transtypes, doctypes);
  
        individualExt.setlanguages(languages);
        individualExt.setfields(fields);
        individualExt.settranstypes(transtypes);
        individualExt.setdoctypes(doctypes);
  
  
        if(individualExt.getId() == null) //user is creating the individual instance (publishing translation service)
        {
          logger.debug("Creating individual with id="+userId);
  
          //individual has a one-to-one relationship with user, thus set the same 'id' with the related user; see
          //Individual.hbm.xml;
          individualExt.setId(userId);

          if(individualExt.getauth_pass()==null)
            individualExt.setauth_pass(0L);   //wait to be authenticated
    
          if(individualExt.getvalid_pass()==null)
            individualExt.setvalid_pass(0L);   //wait to be authenticated
    
          if(individualExt.getrecompos()==null)
            individualExt.setrecompos(recomposService.load(5L, true)); //5 is "No recompos"
    
          try{
            //save the IndividualExt instance created in goPublish() and populated with value in individual/edit.jsp;
            individualService.create(individualExt);
          }
          catch (Throwable e){
            logger.error("Unexpected exception thrown when creating individual");
            e.printStackTrace();
            return error_page(model, "系统故障", "数据库操作异常导致创建个人译员翻译服务失败！");
          }
        }
        else //user is modifying the individual instance (modifying translation service)
        {
          IndividualExt individualExtPer = individualService.load(individualExt.getId(), true);
  
          //We don't set these fields in edit.jsp, so we need to keep the existing values, or they will become null;
          individualExt.setphoto(individualExtPer.getphoto());
          individualExt.settranscert(individualExtPer.gettranscert());
          individualExt.setlangcert(individualExtPer.getlangcert());
          individualExt.setprofcert(individualExtPer.getprofcert());
          individualExt.setauthfile(individualExtPer.getauthfile());

          individualExt.setauth_pass(individualExtPer.getauth_pass());
          individualExt.setvalid_pass(individualExtPer.getvalid_pass());
          individualExt.setrecompos(individualExtPer.getrecompos());
  
          try{
            //save the IndividualExt instance created in goPublish() and populated with value in individual/edit.jsp;
            individualService.save(individualExt);
          }
          catch (Throwable e){
            logger.error("Unexpected exception thrown when modifying individual");
            e.printStackTrace();
            return error_page(model, "系统故障", "数据库操作异常导致修改个人译员翻译服务失败！");
          }
        }

        model.addAttribute("page", 2); 
        model.addAttribute("step", 2); //go the 2nd step

        return "/sys/indiv_home"; 
      }
    }
    else //not the 1st step; that is to upload files (step2:photo; step3:language level certificate; step4:translation certificate; step5:profession certificate; step6: authentication file) 
    {
      String fileType; 
      if(step==2) fileType = "photo";
      else if(step==3) fileType = "language_cert";
      else if(step==4) fileType = "translation_cert";
      else if(step==5) fileType = "profession_cert";
      else if(step==6) fileType = "authentication_file";
      else
      {
        logger.error("Invalid step ("+step+") in publishing or editing individual");
        return error_page(model, "统故障", "未知错误导致步骤非法，操作失败！"); 
      }

      IndividualExt individual;
      try{
        individual = individualService.load(userId, true);
      }
      catch(Throwable e)
      {
        logger.error("Failed to load the individual instance for which we are uploading files");
        e.printStackTrace();
        return error_page(model, "系统故障", "数据库操作异常导致加载个人译员翻译服务失败！");
      }

      if(individual == null)
      {
        logger.error("The individual instance for which we are uploading files is null");
        return error_page(model, "系统故障", "加载个人译员翻译服务失败！");
      }

      String skip = request.getParameter("skip");
      if(skip!=null)  //skip uploading
      {
        logger.debug("Skip uploading "+fileType);
      }
      else //not skip uploading;
      {
        logger.debug("Receiving " + fileType);

        String localPath = "/ybstore/individual/"+userId+"/"+fileType;
        String filePath = configService.getProperty("docBase")+localPath;

        //Yuanguo: add a number to the suffix of image file; the number will be updated with system time in 
        //milli seconds every time a new image is uploaded; why?
        //Because, if we don't add the number, when the image is updated, the "src" in <img src="..."/> is 
        //not updated, as a result, the browser will use the cached image instead of reloading the new one. 
        //Someone on internet gave another solution: 
        //     append "?t=Math.random()" to src.
        //however, it will force a reload every time;
        ReceivedData receivedData = UploadUtil.receive(request, true, false, filePath, "."+Calendar.getInstance().getTimeInMillis());
        List<ReceivedFile> files = receivedData.getFileList(); 

        if(files == null || files.size() == 0)
        {
          logger.error("error occurred when receiving " + fileType);
        }
        else
        {
          if(files.size() > 1)
          {
            logger.warn("more than 1 images are uploaded, we only care about the first one");
          }

          File rawFile = files.get(0).getFile();
          String suffix = files.get(0).getSuffix();

          if(fileType.equals("photo"))
            individual.setphoto(localPath+"/raw"+suffix);
          else if(fileType.equals("language_cert"))
            individual.setlangcert(localPath+"/raw"+suffix);
          else if(fileType.equals("translation_cert"))
            individual.settranscert(localPath+"/raw"+suffix);
          else if(fileType.equals("profession_cert"))
            individual.setprofcert(localPath+"/raw"+suffix);
          else if(fileType.equals("authentication_file"))
            individual.setauthfile(localPath+"/raw"+suffix);
             
          individualService.save(individual);

          //delete original files if ther is any;
          File folder = new File(filePath);
          if(folder.isDirectory())
          {
            String[] fileList = folder.list();
            for(int i=0;i<fileList.length;i++)
            {
              if(!fileList[i].endsWith(suffix))
              {
                File beDeleted = new File(filePath, fileList[i]);
                beDeleted.delete();
              }
            }
          }
          else
          {
            logger.warn("Something is wrong, "+filePath+" is not a folder");
          }
        }
      }

      if(step==6) //the last step
      {
        model.addAttribute("page", 0); 

        UserModel userModel = new UserModel();
        UserExt userExt = null;
        try{
          userExt = userService.load(userId, true);
        }
        catch(Throwable e)
        {
          logger.error("Cannot load user object, maybe userId is invalid.");
          userExt = null;
          return error_page(model, "系统故障", "数据库操作异常导致加载用户失败！");
        }
        if(userExt == null)
          return error_page(model, "系统故障", "加载用户失败！");
          
        userModel.setUserExt(userExt);
        model.addAttribute("userModel", userModel);


        IndividualExt individualExt = null;
        try{
          individualExt = individualService.load(userId, true);
        }
        catch(Throwable e)
        {
          logger.debug("Cannot load individual object, maybe not published");
          individualExt = null;
	}

        individualModel.setIndividualExt(individualExt);
        model.addAttribute("individualModel",individualModel);

        return "/sys/indiv_home"; 
      }
      else //not the last step, go to next step
      {
        model.addAttribute("page", 2); 
        model.addAttribute("step", step+1); //go the 2nd step
        return "/sys/indiv_home"; 
      }
    }
  }

  @RequestMapping(value = "/doCreateOrEditComp")
  public String doCreateOrEditComp(@ModelAttribute CompanyModel companyModel, ModelMap model, HttpServletRequest request)
  {
    Long userId;
    try{
      userId = Long.parseLong(request.getParameter("id").trim());
    }
    catch (Throwable e){
      logger.error("Unexpected exception thrown when parsing userId");
      e.printStackTrace();
      return error_page(model, "系统故障", "未知错误导致输入用户ID为空或者非法，操作失败！");
    }
    model.addAttribute("userId", userId);


    Integer step;
    try{
      step = Integer.parseInt(request.getParameter("step").trim());
    }
    catch (Throwable e){
      logger.error("Unexpected exception thrown when parsing step");
      e.printStackTrace();
      return error_page(model, "系统故障", "未知错误导致输入步骤为空或者非法，操作失败！");
    }

    if(step==1)
    {
      CompanyExt companyExt = companyModel.getCompanyExt();
      if( companyExt == null)
      {
        logger.error("companyModel cannot be null for step 1 of Creating-Or-Editing-Company");
        return error_page(model, "系统故障", "未知错误导致输入翻译服务信息为空，操作失败！");
      }

      String cancel = request.getParameter("cancel");

      if(cancel!=null) //cancel the 1st step
      {
        //since we canclled the 1st step, we try to load the original company instance; if the user
        //has not published the translation serivice, load will return null, this is expected;
        CompanyExt origComp = companyService.load(userId,true);         
        companyModel.setCompanyExt(origComp);

        //pass enumerations like cities, languages and etc to company/edit.jsp
        List<ICondition> conditions = new ArrayList<ICondition>();
        companyModel.setCityEnum(cityService.criteriaQuery(conditions));
        companyModel.setLanguageEnum(languageService.criteriaQuery(conditions));
        companyModel.setFieldEnum(fieldService.criteriaQuery(conditions));
        companyModel.setTranstypeEnum(transtypeService.criteriaQuery(conditions));
        companyModel.setDoctypeEnum(doctypeService.criteriaQuery(conditions));

        model.addAttribute("companyModel", companyModel);
  
        //since we canclled the 1st step, we stay at the 1st step of the translation service page;
        model.addAttribute("page", 2); 
        model.addAttribute("step", 1);
  
        return "/sys/comp_home"; 
      }
      else  //not cancel the 1st step, so create or edit the company object
      {
        String name = companyExt.getName();
        if(name!=null) name = name.trim();
        if(name==null || name.equals(""))
        {
          logger.error("Name cannot be null or empty.");
          return error_page(model, "统故障", "未知错误导致输入公司名称为空，操作失败！"); 
        }
        companyExt.setName(name);

        CityExt city = companyExt.getCity();
        if(city==null)
        {
          logger.error("City is null");
          return error_page(model, "统故障", "未知错误导致输入所在城市为空，操作失败！"); 
        }

        String addr = companyExt.getAddress();
        if(addr!=null) addr = addr.trim();
        if(addr==null || addr.equals(""))
        {
          logger.error("Address cannot be null or empty.");
          return error_page(model, "统故障", "未知错误导致输入公司地址为空，操作失败！"); 
        }
        companyExt.setAddress(addr);
        
        String wsite = companyExt.getWebsite();
        if(wsite!=null) wsite=wsite.trim();
        if(wsite==null || wsite.equals(""))
        {
          logger.error("Website is null");
          return error_page(model, "统故障", "未知错误导致输入公司网站为空，操作失败！"); 
        }
        companyExt.setWebsite(wsite);
  
        String introduct = companyExt.getInroduct();
        if(introduct!=null) introduct=introduct.trim();
        if(introduct!=null && !introduct.equals(""))
          companyExt.setInroduct(introduct);
        else
          companyExt.setInroduct(null);
  
        Set<LanguageExt> languages = new TreeSet<LanguageExt>();
        Set<FieldExt> fields = new TreeSet<FieldExt>();
        Set<TranstypeExt> transtypes = new TreeSet<TranstypeExt>();
        Set<DoctypeExt> doctypes = new TreeSet<DoctypeExt>();
  
        getCheckboxValues(request, languages, fields, transtypes, doctypes);
  
        companyExt.setLanguages(languages);
        companyExt.setFields(fields);
        companyExt.setTranstypes(transtypes);
        companyExt.setDoctypes(doctypes);
  
  
        if(companyExt.getId() == null) //user is creating the company instance (publishing translation service)
        {
          logger.debug("Creating company with id="+userId);
  
          //company has a one-to-one relationship with user, thus set the same 'id' with the related user; see
          //Company.hbm.xml;
          companyExt.setId(userId);

          if(companyExt.getAuth_pass()==null)
            companyExt.setAuth_pass(0L);   //wait to be authenticated
    
          if(companyExt.getValid_pass()==null)
            companyExt.setValid_pass(0L);   //wait to be authenticated
    
          if(companyExt.getRecompos()==null)
            companyExt.setRecompos(recomposService.load(5L, true)); //5 is "No recompos"
    
          try{
            //save the CompanyExt instance created in goPublish() and populated with value in company/edit.jsp;
            companyService.create(companyExt);
          }
          catch (Throwable e){
            logger.error("Unexpected exception thrown when creating company");
            e.printStackTrace();
            return error_page(model, "系统故障", "数据库操作异常导致创建翻译公司翻译服务失败！");
          }
        }
        else //user is modifying the company instance (modifying translation service)
        {
          CompanyExt companyExtPer = companyService.load(companyExt.getId(), true);
  
          //We don't set these fields in edit.jsp, so we need to keep the existing values, or they will become null;
          companyExt.setLogo(companyExtPer.getLogo());
          companyExt.setAuthfile(companyExtPer.getAuthfile());

          companyExt.setRecompos(companyExtPer.getRecompos());
          companyExt.setAuth_pass(companyExtPer.getAuth_pass()); 
          companyExt.setValid_pass(companyExtPer.getValid_pass());
  
          try{
            //save the CompanyExt instance created in goPublish() and populated with value in company/edit.jsp;
            companyService.save(companyExt);
          }
          catch (Throwable e){
            logger.error("Unexpected exception thrown when modifying company");
            e.printStackTrace();
            return error_page(model, "系统故障", "数据库操作异常导致修改翻译公司翻译服务失败！");
          }
        }

        model.addAttribute("page", 2); 
        model.addAttribute("step", 2); //go the 2nd step

        return "/sys/comp_home"; 
      }
    }
    else //not the 1st step; that is to upload files (step2:logo; step3: authentication file) 
    {
      String fileType; 
      if(step==2) fileType = "logo";
      else if(step==3) fileType = "authentication_file";
      else
      {
        logger.error("Invalid step ("+step+") in publishing or editing company");
        return error_page(model, "统故障", "未知错误导致步骤非法，操作失败！"); 
      }

      CompanyExt company;
      try{
        company = companyService.load(userId, true);
      }
      catch(Throwable e)
      {
        logger.error("Failed to load the company instance for which we are uploading files");
        e.printStackTrace();
        return error_page(model, "系统故障", "数据库操作异常导致加载翻译公司翻译服务失败！");
      }

      if(company == null)
      {
        logger.error("The company instance for which we are uploading files is null");
        return error_page(model, "系统故障", "加载翻译公司翻译服务失败！");
      }


      String skip = request.getParameter("skip");
      if(skip!=null)  //skip uploading
      {
        logger.debug("Skip uploading "+fileType);
      }
      else //not skip uploading;
      {
        logger.debug("Receiving " + fileType);

        String localPath = "/ybstore/company/"+userId+"/"+fileType;
        String filePath = configService.getProperty("docBase")+localPath;

        //Yuanguo: add a number to the suffix of image file; the number will be updated with system time in 
        //milli seconds every time a new image is uploaded; why?
        //Because, if we don't add the number, when the image is updated, the "src" in <img src="..."/> is 
        //not updated, as a result, the browser will use the cached image instead of reloading the new one. 
        //Someone on internet gave another solution: 
        //     append "?t=Math.random()" to src.
        //however, it will force a reload every time;
        ReceivedData receivedData = UploadUtil.receive(request, true, false, filePath, "."+Calendar.getInstance().getTimeInMillis());
        List<ReceivedFile> files = receivedData.getFileList(); 

        if(files == null || files.size() == 0)
        {
          logger.error("error occurred when receiving " + fileType);
        }
        else
        {
          if(files.size() > 1)
          {
            logger.warn("more than 1 images are uploaded, we only care about the first one");
          }

          File rawFile = files.get(0).getFile();
          String suffix = files.get(0).getSuffix();

          if(fileType.equals("logo"))
            company.setLogo(localPath+"/raw"+suffix);
          else if(fileType.equals("authentication_file"))
            company.setAuthfile(localPath+"/raw"+suffix);
             
          companyService.save(company);

          //delete original files if ther is any;
          File folder = new File(filePath);
          if(folder.isDirectory())
          {
            String[] fileList = folder.list();
            for(int i=0;i<fileList.length;i++)
            {
              if(!fileList[i].endsWith(suffix))
              {
                File beDeleted = new File(filePath, fileList[i]);
                beDeleted.delete();
              }
            }
          }
          else
          {
            logger.warn("Something is wrong, "+filePath+" is not a folder");
          }
        }
      }

      if(step==3) //the last step
      {
        model.addAttribute("page", 0); 

        UserModel userModel = new UserModel();
        UserExt userExt = null;
        try{
          userExt = userService.load(userId, true);
        }
        catch(Throwable e)
        {
          logger.error("Cannot load user object, maybe userId is invalid.");
          userExt = null;
          return error_page(model, "系统故障", "数据库操作异常导致加载用户失败！");
        }
        if(userExt == null)
          return error_page(model, "系统故障", "加载用户失败！");
          
        userModel.setUserExt(userExt);
        model.addAttribute("userModel", userModel);


        CompanyExt companyExt = null;
        try{
          companyExt = companyService.load(userId, true);
        }
        catch(Throwable e)
        {
          logger.debug("Cannot load company object, maybe not published");
          companyExt = null;
	}

        companyModel.setCompanyExt(companyExt);
        model.addAttribute("companyModel",companyModel);

        return "/sys/comp_home"; 
      }
      else //not the last step, go to next step
      {
        model.addAttribute("page", 2); 
        model.addAttribute("step", step+1); //go the 2nd step
        return "/sys/comp_home"; 
      }
    }
  }


  @RequestMapping(value = "/home")
  public String home(HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session)
  {
    UserExt sessionUser = (UserExt)session.getAttribute("user");
    if(sessionUser==null)
    {
      logger.error("No user is in session.");
      return "/sys/login";
    }

    Long userType;
    try{
      userType = Long.parseLong(request.getParameter("type").trim());
    } 
    catch (Throwable e){
      logger.error("Unexpected exception thrown when parsing userType");
      e.printStackTrace();
      return "/sys/login";
    }

    if( !sessionUser.getuser_type().equals(userType))
    {
      logger.error("userType is invalid.");
      return "/sys/login";
    }

    Long userId;
    try{
      userId = Long.parseLong(request.getParameter("id").trim());
    }
    catch (Throwable e){
      logger.error("Unexpected exception thrown when parsing userId");
      e.printStackTrace();
      return "/sys/login";
    }

    if( !sessionUser.getId().equals(userId))
    {
      logger.error("userId is invalid.");
      return "/sys/login";
    }

    Integer page = 0;
    try{
      page = Integer.parseInt(request.getParameter("page").trim());
    }
    catch (Throwable e){
      logger.warn("exception thrown when parsing page, default to 0");
      page = 0;
    }

    model.addAttribute("userId", userId);
    model.addAttribute("page", page);
    if(page==2)  
      model.addAttribute("step", 1); //first step in publishing or editing individual translation service;


    if(userType==0L)  //individual
    {
      if(page==0 || page==1) //user status page or user base info page
      {
        UserModel userModel = new UserModel();

        UserExt userExt = null;
        try{
          userExt = userService.load(userId, true);
        }
        catch(Throwable e)
        {
          logger.error("Cannot load user object, maybe userId is invalid.");
          return "/sys/login";
        }
        if(userExt == null)
          return "/sys/login";
          
        userModel.setUserExt(userExt);
        model.addAttribute("userModel", userModel);

        if(page==0)
        {
          IndividualModel individualModel = new IndividualModel();

          IndividualExt individualExt = null;
          try{
            individualExt = individualService.load(userId, true);
          }
          catch(Throwable e)
          {
            logger.debug("Cannot load individual object, maybe not published");
            individualExt = null;
          }

          individualModel.setIndividualExt(individualExt);
          model.addAttribute("individualModel",individualModel);
        }
      }
      else //Translation service page
      {
        IndividualModel individualModel = new IndividualModel();

        IndividualExt individualExt = null;
        try{
          individualExt = individualService.load(userId, true);
        }
        catch(Throwable e)
        {
          logger.debug("Cannot load individual object, maybe not published");
          individualExt = null;
        }
        individualModel.setIndividualExt(individualExt);
  
        //pass enumerations like cities, educations, schools and etc to individual/edit.jsp
        List<ICondition> conditions = new ArrayList<ICondition>();
        individualModel.setCityEnum(cityService.criteriaQuery(conditions));
        individualModel.setEducationEnum(educationService.criteriaQuery(conditions));
        individualModel.setSchoolEnum(schoolService.criteriaQuery(conditions));
        individualModel.setLanguageEnum(languageService.criteriaQuery(conditions));
        individualModel.setFieldEnum(fieldService.criteriaQuery(conditions));
        individualModel.setTranstypeEnum(transtypeService.criteriaQuery(conditions));
        individualModel.setDoctypeEnum(doctypeService.criteriaQuery(conditions));
  
        model.addAttribute("individualModel",individualModel);
      }
      return "/sys/indiv_home"; 
    }
    else //company
    {
      if(page==0 || page==1) //user status page or user base info page
      {
        UserModel userModel = new UserModel();

        UserExt userExt = null;
        try{
          userExt = userService.load(userId, true);
        }
        catch(Throwable e)
        {
          logger.error("Cannot load user object, maybe userId is invalid.");
          return "/sys/login";
        }
        if(userExt == null)
          return "/sys/login";
          
        userModel.setUserExt(userExt);
        model.addAttribute("userModel", userModel);

        if(page==0)
        {
          CompanyModel companyModel = new CompanyModel();

          CompanyExt companyExt = null;
          try{
            companyExt = companyService.load(userId, true);
          }
          catch(Throwable e)
          {
            logger.debug("Cannot load company object, maybe not published");
            companyExt = null;
          }

          companyModel.setCompanyExt(companyExt);
          model.addAttribute("companyModel",companyModel);
        }
      }
      else //Translation service page
      {
        CompanyModel companyModel = new CompanyModel();

        CompanyExt companyExt = null;
        try{
          companyExt = companyService.load(userId, true);
        }
        catch(Throwable e)
        {
          logger.debug("Cannot load company object, maybe not published");
          companyExt = null;
        }
        companyModel.setCompanyExt(companyExt);
  
        //pass enumerations like cities, languages and etc to company/edit.jsp
        List<ICondition> conditions = new ArrayList<ICondition>();
        companyModel.setCityEnum(cityService.criteriaQuery(conditions));
        companyModel.setLanguageEnum(languageService.criteriaQuery(conditions));
        companyModel.setFieldEnum(fieldService.criteriaQuery(conditions));
        companyModel.setTranstypeEnum(transtypeService.criteriaQuery(conditions));
        companyModel.setDoctypeEnum(doctypeService.criteriaQuery(conditions));
  
        model.addAttribute("companyModel",companyModel);
      }
      return "/sys/comp_home";  
    }
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
        logger.error("Unexpected exception thrown when query count of users by the email:"+email);
        e.printStackTrace();
        map.put(key,-1);
      }
    }
    else //client should never give null or empty email
    {
      logger.error("email given is null or empty");
      map.put(key,-1);
    }

    return map;
  }


  @RequestMapping(value = "/websiteUnique")
  @ResponseBody
  public Map<String,Integer> websiteUnique(HttpServletRequest request, HttpServletResponse response, ModelMap model){

    Map<String,Integer> map = new HashMap<String,Integer>();
    String key = "NumWithWebsite";

    Long userId;
    try{
      userId = Long.parseLong(request.getParameter("id").trim());
    }
    catch (Throwable e){
      logger.error("Unexpected exception thrown when parsing userId");
      map.put(key,-1);
      return map;
    }

    logger.debug("UserId:"+userId);

    CompanyExt compExt = companyService.load(userId, false);

    String ws = request.getParameter("website");
    if(ws != null) ws = ws.trim();

    logger.debug("website:"+ws);

    if(ws!=null && !ws.equals(""))
    {
      List<ICondition> conditions = new ArrayList<ICondition>();
      conditions.add(new EqCondition("website",ws));
      try{
        int allNum = companyService.criteriaQueryCount(conditions);
        if(allNum>1)  //we are sure that the website is conflict
          map.put(key,allNum);
	else if(allNum==1) 
        {
          if( compExt!=null && ws.equals(compExt.getWebsite()) )  //exactly 1 and the user has already published a company, then it should be the company itself (when modifying)
            map.put(key,0);
          else
            map.put(key,1); 
        }
        else
            map.put(key,0);
      }
      catch(Exception e)
      {
        logger.error("Unexpected exception thrown when query count of companies by the website:"+ws);
        e.printStackTrace();
        map.put(key,-1);
      }
    }
    else //client should never give null or empty website 
    {
      logger.error("website given is null or empty");
      map.put(key,-1);
    }

    return map;
  }

  @RequestMapping(value = "/nameUnique")
  @ResponseBody
  public Map<String,Integer> nameUnique(HttpServletRequest request, HttpServletResponse response, ModelMap model){

    Map<String,Integer> map = new HashMap<String,Integer>();
    String key = "NumWithName";

    Long userId;
    try{
      userId = Long.parseLong(request.getParameter("id").trim());
    }
    catch (Throwable e){
      logger.error("Unexpected exception thrown when parsing userId");
      map.put(key,-1);
      return map;
    }

    logger.debug("UserId:"+userId);

    CompanyExt compExt = companyService.load(userId, false);

    String name = request.getParameter("name");
    if(name != null) name = name.trim();

    logger.debug("name:"+name);

    if(name!=null && !name.equals(""))
    {
      List<ICondition> conditions = new ArrayList<ICondition>();
      conditions.add(new EqCondition("name",name));
      try{
        int allNum = companyService.criteriaQueryCount(conditions);
        if(allNum>1)  //we are sure that the name is conflict
          map.put(key,allNum);
	else if(allNum==1) 
        {
          if( compExt!=null && name.equals(compExt.getName()) )  //exactly 1 and the user has already published a company, then it should be the company itself (when modifying)
            map.put(key,0);
          else
            map.put(key,1); 
        }
        else
            map.put(key,0);
      }
      catch(Exception e)
      {
        logger.error("Unexpected exception thrown when query count of companies by the name:"+name);
        e.printStackTrace();
        map.put(key,-1);
      }
    }
    else //client should never give null or empty website 
    {
      logger.error("name given is null or empty");
      map.put(key,-1);
    }

    return map;
  }


  @RequestMapping(value = "/goLogin")
  public String goLogin(@ModelAttribute UserModel userModel, ModelMap model){
    return "/sys/login";
  }


  @RequestMapping(value = "/logout")
  public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
  {
    session.setAttribute("user", null);
    return "redirect:/index"; 
  }


  @RequestMapping(value = "/doLogin")
  public String doLogin(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, HttpServletRequest request, ModelMap map)
  {
    if(email!=null)
      email = email.trim();
    if(password!=null)
      password = password.trim();

    if(email!=null&&!email.equals(""))
    {
      List<ICondition> conditions = new ArrayList<ICondition>();
      conditions.add(new EqCondition("email",email));
      List<UserExt> userList = userService.criteriaQuery(conditions);
      if(userList.size()==1 && userList.get(0).getpassword()!=null)
      {
        UserExt userExt = userList.get(0);
        if(userExt.getpassword().equals(password))
        {
          session.setAttribute("user", userExt);
        }
        else
        {
          map.addAttribute("error", "用户名不存在或者密码错误");
        }
      }
      else
      {
        map.addAttribute("error", "用户名不存在或者密码错误");
      }
    }
    else
    {
      map.addAttribute("error", "用户名不存在或者密码错误");
    }

    return "/sys/login";
  }

  @RequestMapping(value = "/aboutYibang")
  public String aboutYibang(ModelMap map)
  {
    map.addAttribute("info_type", "msg");

    String title="关于译邦";

    String paragraphs[] = new String[5];

    paragraphs[0] = "译邦是一家聚合翻译公司、自由译员、兼职译员等信息，以帮助用户找到“最适合的翻译服务”为宗旨的信息服务类网站。译邦网所提供的翻译公司、个人译员信息覆盖全国主要大中型城市，语种既包括了英、法、德、西、日、韩等主流语种，也包括了国际交流中使用相对较少的小语种语言。在译邦网上，不管您是需要笔译、口译、同声传译还是会议交传，您都可以通过你所在的城市、你需要的语种、你想要的翻译类型进行筛选，从而精准的找到符合您要求的翻译服务。译邦网庞大的翻译公司/译员信息库，既包括了实力雄厚、可为您提供专业级服务的翻译公司，也包括了各个专业领域内精通各语种的高级人才。不管您所需要的翻译是什么语种，什么专业，都可以在这里找到您需要的。";

    paragraphs[1] = "";

    paragraphs[2] = "译邦网对每一家收录的公司/译员信息都进行审核，以确保信息的可靠性。对翻译公司/自由译员的认证服务，更确保了信息的真实性，为您找到最合适的翻译服务提供依据。";

    paragraphs[3] = "";

    paragraphs[4] = "找翻译，上译邦，翻译信息一网打尽！";

    map.addAttribute("title", title);
    map.addAttribute("paragraphs", paragraphs);

    return "/sys/info";
  }

  @RequestMapping(value = "/advertise")
  public String advertise(ModelMap map)
  {
    map.addAttribute("info_type", "msg");

    String title="广告服务";

    String paragraphs[] = new String[8];

    paragraphs[0] = "上译邦，让更多的客户找到您！";

    paragraphs[1] = "";

    paragraphs[2] = "译邦网通过主流搜索引擎、知名分类信息门户网站、网络广告联盟及其它上万家主流网站，每天将译邦网上的翻译服务信息呈现在成千上万的潜在客户面前，并将这些客户带给译邦网上的翻译公司、自由译员和兼职译员。在译邦网上，您不再需要投入巨额的资金去搜索引擎进行竞价排名，也不需要每天守在电脑前到各大分类信息网站上去发布信息就可以让更多的客户找到您，并与您联系，建立合作。免费登录译邦网以后，您将有更多的时间与精力，为客户提供更好的服务，更可以节省大量的推广费用，用于公司/个人未来更好的发展。";

    paragraphs[3] = "";

    paragraphs[4] = "在译邦网上，您除了可以免费展示您的信息外，还可以获得推荐，让更多的客户关注您。如需了解关于如何获得推荐的详情，请与我们联系。";

    paragraphs[5] = "";

    paragraphs[6] = "QQ：2107201709";
    paragraphs[7] = "邮箱：yibang886@163.com";

    map.addAttribute("title", title);
    map.addAttribute("paragraphs", paragraphs);

    return "/sys/info";
  }

  @RequestMapping(value = "/onlineServ.action")
  public String onlineServ(ModelMap map)
  {
    map.addAttribute("info_type", "msg");

    String title="在线翻译";

    String paragraphs[] = new String[1];
    paragraphs[0]  = "您好，在线翻译服务暂不支持！";

    map.addAttribute("title", title);
    map.addAttribute("paragraphs", paragraphs);

    return "/sys/info";
  }

  @RequestMapping(value = "/ally.action")
  public String ally(ModelMap map)
  {
    map.addAttribute("info_type", "msg");

    String title="合作机构";

    String paragraphs[] = new String[1];
    paragraphs[0] = "您好，我们正与合作机构洽谈中！";

    map.addAttribute("title", title);
    map.addAttribute("paragraphs", paragraphs);

    return "/sys/info";
  }

  @RequestMapping(value = "/disclaimer.action")
  public String disclaimer(ModelMap map)
  {
    map.addAttribute("info_type", "msg");

    String title="免责声明";

    String paragraphs[] = new String[14];

    paragraphs[0] = "关于本站：";
    paragraphs[1] = "1.本网站旨在为广大翻译需求者提供翻译服务信息，所展示的信息均由翻译服务提供方自行提供或发布，本网站对其信息内容的真实性不承担任何法律责任。如翻译服务提供方所提交的信息、图片、商标等任何内容侵犯任何第三方的权益，与本网站无关，本网站不承担任何法律责任。";
    paragraphs[2] = "2.本网站仅为翻译服务提供方提供展示信息的平台。翻译服务需求方与提供方的合作与交易，由双方自行完成，与本网站无关。如双方因交易而发生任何纠纷，本网站不承担任何法律责任。";
    paragraphs[3] = "3.翻译服务提供方在本网站提交任何信息，则表明已同意将其信息公开展示。如因本网站信息公开展示而导致翻译服务提供方资料泄露，以及由此而导致的法律争议和后果，本网站均不承担任何责任。";
    paragraphs[4] = "4.当政府司法机关依照法定程序要求本网站披露公司或个人资料时，我们将根据执法单位之要求或为公共安全之目的提供公司或个人资料。在此情况下之任何披露，本网站不承担任何法律责任。";

    paragraphs[5] = "";

    paragraphs[6] = "网站运行：";
    paragraphs[7] = "1.本网站如因系统维护或升级而需暂停服务时，将事先公告。若因线路及非本网站控制范围外的硬件故障或其它不可抗力而导致暂停服务，于暂停服务期间造成的一切不便与损失，本网站不承担任何责任。";
    paragraphs[8] = "2.任何由于黑客攻击、计算机病毒侵入或发作、因政府管制而造成的暂时性关闭等影响网络正常经营的不可抗力而造成的公司或个人资料泄露、丢失、被盗用或被窜改等，本网站不承担任何责任。";

    paragraphs[9] = "";

    paragraphs[10] = "法律责任：";
    paragraphs[11] = "1.本网站使用者因为违反本声明的规定而触犯中华人民共和国法律的，一切后果自己负责，本网站不承担任何责任。";
    paragraphs[12] = "2.凡以任何方式登陆本网站提交信息，或直接、间接使用本网站信息者，视为自愿接受本网站声明的约束。";
    paragraphs[13] = "3.本声明未涉及的问题参见国家有关法律法规，当本声明与国家法律法规冲突时，以国家法律法规为准。";

    map.addAttribute("title", title);
    map.addAttribute("paragraphs", paragraphs);

    return "/sys/info";
  }

  @RequestMapping(value = "/contactUs.action")
  public String contactUs(ModelMap map)
  {
    map.addAttribute("info_type", "msg");

    String title="联系我们";

    String paragraphs[] = new String[3];

    paragraphs[0] = "QQ：2107201709";
    paragraphs[1] = "邮箱：yibang886@163.com";
    paragraphs[2] = "电话：028-6580-6596";

    map.addAttribute("title", title);
    map.addAttribute("paragraphs", paragraphs);

    return "/sys/info";
  }

  public String error_page(ModelMap map, String title, String errinfo)
  {
    map.addAttribute("info_type", "err");

    String paragraphs[] = new String[3];

    paragraphs[0] = errinfo;
    paragraphs[1] = "";
    paragraphs[2] = "若非操作非法，请点退出空间（点击右上角的用户邮箱并选择'退出'），然后重新登录并再试一次。";

    map.addAttribute("title", title);
    map.addAttribute("paragraphs", paragraphs);

    return "/sys/info";
  }
}
