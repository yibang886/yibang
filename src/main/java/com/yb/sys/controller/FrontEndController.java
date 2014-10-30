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

    List<Order> orders = new ArrayList<Order>();
    //orders.add(Property.forName("coin").desc());

		List<ICondition> conditionA1 = new ArrayList<ICondition>();
    conditionA1.add(new EqCondition("recompos.id", 2L)); // A1

    List<CompanyExt> compsA1 = companyService.criteriaQuery(conditionA1, orders, 1, 1);

    logger.debug("Number of A1 company found: " + compsA1.size());

    //only return 1 CompanyExt instance whose recompos is A1;
    if(compsA1.size()>0)
    {
      CompanyExt compA1 = compsA1.get(0);
      Set<LanguageExt> langs = compA1.getLanguages(); 

      //if there are more than 6, just return 6 of them which are hot (the smaller ID, the hoter)
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

		return "/sys/index";
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

