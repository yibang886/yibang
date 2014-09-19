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

import com.yb.sys.entity.RecomposExt;
import com.yb.sys.model.RecomposModel;
import com.yb.sys.service.IRecomposServiceExt;

@Controller
@Scope("request")
public class RecomposController {

	@Resource(name = "recomposService")
	private IRecomposServiceExt recomposService;
	
	@RequestMapping(value = "/recompos/index")
	public String index(@ModelAttribute RecomposModel recomposModel, ModelMap model){
		model.addAttribute(recomposModel);
		
		return "/sys/recompos/index";
	}
	
	@RequestMapping(value = "/recompos/query")
	public String query(@ModelAttribute RecomposModel recomposModel, ModelMap model){
		RecomposExt recomposQueryCon = recomposModel.getRecomposQueryCon();
		List<ICondition> conditions = new ArrayList<ICondition>();
		if(recomposQueryCon != null){
		}
		recomposModel.setItems(recomposService.criteriaQuery(conditions));
		model.addAttribute(recomposModel);
		return "/sys/recompos/index";
	}
	
	@RequestMapping(value = "/recompos/goView")
	public String goView(@ModelAttribute RecomposModel recomposModel, ModelMap model){
		if(recomposModel.getDataId() != 0){
			RecomposExt recomposExt = recomposService.load(recomposModel.getDataId(), true);
			recomposModel.setRecomposExt(recomposExt);
		}
		
		model.addAttribute(recomposModel);
		return "/sys/recompos/detail";
	}
	
	@RequestMapping(value = "/recompos/goCreate")
	public String goCreate(@ModelAttribute RecomposModel recomposModel, ModelMap model){
		recomposModel.setOperationType("create");
		model.addAttribute(recomposModel);
		return "/sys/recompos/edit";
	}
	
	@RequestMapping(value = "/recompos/doCreate")
	public String doCreate(@ModelAttribute RecomposModel recomposModel, ModelMap model){
		if(recomposModel.getRecomposExt() != null){
			recomposService.create(recomposModel.getRecomposExt());
		}
		
		return "forward:/recompos/query";
	}
	
	@RequestMapping(value = "/recompos/goEdit")
	public String goEdit(@ModelAttribute RecomposModel recomposModel, ModelMap model){
		recomposModel.setOperationType("edit");
		if(recomposModel.getDataId() != 0){
			RecomposExt recomposExt = recomposService.load(recomposModel.getDataId(), true);
			recomposModel.setRecomposExt(recomposExt);
			model.addAttribute(recomposModel);
		}
		return "/sys/recompos/edit";
	}
	
	@RequestMapping(value = "/recompos/doEdit")
	public String doEdit(@ModelAttribute RecomposModel recomposModel, ModelMap model){
		if(recomposModel.getRecomposExt() != null && recomposModel.getRecomposExt().getId() != 0){
			RecomposExt recomposExt = recomposModel.getRecomposExt();
			RecomposExt recomposExtPer = recomposService.load(recomposModel.getRecomposExt().getId(), true);
			recomposService.save(recomposExt);
		}
		return "forward:/recompos/query";
	}
	
		@RequestMapping(value = "/recompos/doDelete")
	public String doDelete(@ModelAttribute RecomposModel recomposModel, ModelMap model){
		if(recomposModel.getRecomposExt() != null){
			recomposService.create(recomposModel.getRecomposExt());
		}
		if(recomposModel.getDataId() != 0){
			RecomposExt recomposExt = recomposService.load(recomposModel.getDataId(), true);
			recomposService.delete(recomposExt);
		}
		return "forward:/recompos/query";
	}
	
}
