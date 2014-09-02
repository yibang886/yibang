package com.yb.sys.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.hibernate.*;

import com.yb.sys.entity.CityExt;
import com.yb.sys.model.CityModel;
import com.yb.sys.service.ICityServiceExt;

@Controller
@Scope("request")
public class CityController {

	@Resource(name = "cityService")
	private ICityServiceExt cityService;
	
	@RequestMapping(value = "/city/index")
	public String index(@ModelAttribute CityModel cityModel, ModelMap model){
		model.addAttribute(cityModel);
		
		return "/sys/city/index";
	}
	
	@RequestMapping(value = "/city/query")
	public String query(@ModelAttribute CityModel cityModel, ModelMap model){
		CityExt cityQueryCon = cityModel.getCityQueryCon();
		List<ICondition> conditions = new ArrayList<ICondition>();
		if(cityQueryCon != null){
		}
		cityModel.setItems(cityService.criteriaQuery(conditions));
		model.addAttribute(cityModel);
		return "/sys/city/index";
	}
	
	@RequestMapping(value = "/city/goView")
	public String goView(@ModelAttribute CityModel cityModel, ModelMap model){
		if(cityModel.getDataId() != 0){
			CityExt cityExt = cityService.load(cityModel.getDataId(), true);
			cityModel.setCityExt(cityExt);
		}
		
		model.addAttribute(cityModel);
		return "/sys/city/detail";
	}
	
	@RequestMapping(value = "/city/goCreate")
	public String goCreate(@ModelAttribute CityModel cityModel, ModelMap model){
		cityModel.setOperationType("create");
		model.addAttribute(cityModel);
		return "/sys/city/edit";
	}
	
	@RequestMapping(value = "/city/doCreate")
	public String doCreate(@ModelAttribute CityModel cityModel, ModelMap model){
		if(cityModel.getCityExt() != null){
			cityService.create(cityModel.getCityExt());
		}
		
		return "forward:/city/query";
	}
	
	@RequestMapping(value = "/city/goEdit")
	public String goEdit(@ModelAttribute CityModel cityModel, ModelMap model){
		cityModel.setOperationType("edit");
		if(cityModel.getDataId() != 0){
			CityExt cityExt = cityService.load(cityModel.getDataId(), true);
			cityModel.setCityExt(cityExt);
			model.addAttribute(cityModel);
		}
		return "/sys/city/edit";
	}
	
	@RequestMapping(value = "/city/doEdit")
	public String doEdit(@ModelAttribute CityModel cityModel, ModelMap model){
		if(cityModel.getCityExt() != null && cityModel.getCityExt().getId() != 0){
			CityExt cityExt = cityModel.getCityExt();
			CityExt cityExtPer = cityService.load(cityModel.getCityExt().getId(), true);
			cityService.save(cityExt);
		}
		return "forward:/city/query";
	}
	
		@RequestMapping(value = "/city/doDelete")
	public String doDelete(@ModelAttribute CityModel cityModel, ModelMap model){
		if(cityModel.getCityExt() != null){
			cityService.create(cityModel.getCityExt());
		}
		if(cityModel.getDataId() != 0){
			CityExt cityExt = cityService.load(cityModel.getDataId(), true);
			cityService.delete(cityExt);
		}
		return "forward:/city/query";
	}
	
}
