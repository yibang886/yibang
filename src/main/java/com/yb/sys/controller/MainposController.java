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

import com.yb.sys.entity.MainposExt;
import com.yb.sys.model.MainposModel;
import com.yb.sys.service.IMainposServiceExt;

@Controller
@Scope("request")
public class MainposController {

	@Resource(name = "mainposService")
	private IMainposServiceExt mainposService;
	
	@RequestMapping(value = "/mainpos/index")
	public String index(@ModelAttribute MainposModel mainposModel, ModelMap model){
		model.addAttribute(mainposModel);
		
		return "/sys/mainpos/index";
	}
	
	@RequestMapping(value = "/mainpos/query")
	public String query(@ModelAttribute MainposModel mainposModel, ModelMap model){
		MainposExt mainposQueryCon = mainposModel.getMainposQueryCon();
		List<ICondition> conditions = new ArrayList<ICondition>();
		if(mainposQueryCon != null){
		}
		mainposModel.setItems(mainposService.criteriaQuery(conditions));
		model.addAttribute(mainposModel);
		return "/sys/mainpos/index";
	}
	
	@RequestMapping(value = "/mainpos/goView")
	public String goView(@ModelAttribute MainposModel mainposModel, ModelMap model){
		if(mainposModel.getDataId() != 0){
			MainposExt mainposExt = mainposService.load(mainposModel.getDataId(), true);
			mainposModel.setMainposExt(mainposExt);
		}
		
		model.addAttribute(mainposModel);
		return "/sys/mainpos/detail";
	}
	
	@RequestMapping(value = "/mainpos/goCreate")
	public String goCreate(@ModelAttribute MainposModel mainposModel, ModelMap model){
		mainposModel.setOperationType("create");
		model.addAttribute(mainposModel);
		return "/sys/mainpos/edit";
	}
	
	@RequestMapping(value = "/mainpos/doCreate")
	public String doCreate(@ModelAttribute MainposModel mainposModel, ModelMap model){
		if(mainposModel.getMainposExt() != null){
			mainposService.create(mainposModel.getMainposExt());
		}
		
		return "forward:/mainpos/query";
	}
	
	@RequestMapping(value = "/mainpos/goEdit")
	public String goEdit(@ModelAttribute MainposModel mainposModel, ModelMap model){
		mainposModel.setOperationType("edit");
		if(mainposModel.getDataId() != 0){
			MainposExt mainposExt = mainposService.load(mainposModel.getDataId(), true);
			mainposModel.setMainposExt(mainposExt);
			model.addAttribute(mainposModel);
		}
		return "/sys/mainpos/edit";
	}
	
	@RequestMapping(value = "/mainpos/doEdit")
	public String doEdit(@ModelAttribute MainposModel mainposModel, ModelMap model){
		if(mainposModel.getMainposExt() != null && mainposModel.getMainposExt().getId() != 0){
			MainposExt mainposExt = mainposModel.getMainposExt();
			MainposExt mainposExtPer = mainposService.load(mainposModel.getMainposExt().getId(), true);
			mainposService.save(mainposExt);
		}
		return "forward:/mainpos/query";
	}
	
		@RequestMapping(value = "/mainpos/doDelete")
	public String doDelete(@ModelAttribute MainposModel mainposModel, ModelMap model){
		if(mainposModel.getMainposExt() != null){
			mainposService.create(mainposModel.getMainposExt());
		}
		if(mainposModel.getDataId() != 0){
			MainposExt mainposExt = mainposService.load(mainposModel.getDataId(), true);
			mainposService.delete(mainposExt);
		}
		return "forward:/mainpos/query";
	}
	
}
