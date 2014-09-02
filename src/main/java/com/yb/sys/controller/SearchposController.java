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

import com.yb.sys.entity.SearchposExt;
import com.yb.sys.model.SearchposModel;
import com.yb.sys.service.ISearchposServiceExt;

@Controller
@Scope("request")
public class SearchposController {

	@Resource(name = "searchposService")
	private ISearchposServiceExt searchposService;
	
	@RequestMapping(value = "/searchpos/index")
	public String index(@ModelAttribute SearchposModel searchposModel, ModelMap model){
		model.addAttribute(searchposModel);
		
		return "/sys/searchpos/index";
	}
	
	@RequestMapping(value = "/searchpos/query")
	public String query(@ModelAttribute SearchposModel searchposModel, ModelMap model){
		SearchposExt searchposQueryCon = searchposModel.getSearchposQueryCon();
		List<ICondition> conditions = new ArrayList<ICondition>();
		if(searchposQueryCon != null){
		}
		searchposModel.setItems(searchposService.criteriaQuery(conditions));
		model.addAttribute(searchposModel);
		return "/sys/searchpos/index";
	}
	
	@RequestMapping(value = "/searchpos/goView")
	public String goView(@ModelAttribute SearchposModel searchposModel, ModelMap model){
		if(searchposModel.getDataId() != 0){
			SearchposExt searchposExt = searchposService.load(searchposModel.getDataId(), true);
			searchposModel.setSearchposExt(searchposExt);
		}
		
		model.addAttribute(searchposModel);
		return "/sys/searchpos/detail";
	}
	
	@RequestMapping(value = "/searchpos/goCreate")
	public String goCreate(@ModelAttribute SearchposModel searchposModel, ModelMap model){
		searchposModel.setOperationType("create");
		model.addAttribute(searchposModel);
		return "/sys/searchpos/edit";
	}
	
	@RequestMapping(value = "/searchpos/doCreate")
	public String doCreate(@ModelAttribute SearchposModel searchposModel, ModelMap model){
		if(searchposModel.getSearchposExt() != null){
			searchposService.create(searchposModel.getSearchposExt());
		}
		
		return "forward:/searchpos/query";
	}
	
	@RequestMapping(value = "/searchpos/goEdit")
	public String goEdit(@ModelAttribute SearchposModel searchposModel, ModelMap model){
		searchposModel.setOperationType("edit");
		if(searchposModel.getDataId() != 0){
			SearchposExt searchposExt = searchposService.load(searchposModel.getDataId(), true);
			searchposModel.setSearchposExt(searchposExt);
			model.addAttribute(searchposModel);
		}
		return "/sys/searchpos/edit";
	}
	
	@RequestMapping(value = "/searchpos/doEdit")
	public String doEdit(@ModelAttribute SearchposModel searchposModel, ModelMap model){
		if(searchposModel.getSearchposExt() != null && searchposModel.getSearchposExt().getId() != 0){
			SearchposExt searchposExt = searchposModel.getSearchposExt();
			SearchposExt searchposExtPer = searchposService.load(searchposModel.getSearchposExt().getId(), true);
			searchposService.save(searchposExt);
		}
		return "forward:/searchpos/query";
	}
	
		@RequestMapping(value = "/searchpos/doDelete")
	public String doDelete(@ModelAttribute SearchposModel searchposModel, ModelMap model){
		if(searchposModel.getSearchposExt() != null){
			searchposService.create(searchposModel.getSearchposExt());
		}
		if(searchposModel.getDataId() != 0){
			SearchposExt searchposExt = searchposService.load(searchposModel.getDataId(), true);
			searchposService.delete(searchposExt);
		}
		return "forward:/searchpos/query";
	}
	
}
