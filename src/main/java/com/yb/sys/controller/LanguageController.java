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

import com.yb.sys.entity.LanguageExt;
import com.yb.sys.model.LanguageModel;
import com.yb.sys.service.ILanguageServiceExt;

@Controller
@Scope("request")
public class LanguageController {

	@Resource(name = "languageService")
	private ILanguageServiceExt languageService;
	
	@RequestMapping(value = "/language/index")
	public String index(@ModelAttribute LanguageModel languageModel, ModelMap model){
		model.addAttribute(languageModel);
		
		return "/sys/language/index";
	}
	
	@RequestMapping(value = "/language/query")
	public String query(@ModelAttribute LanguageModel languageModel, ModelMap model){
		LanguageExt languageQueryCon = languageModel.getLanguageQueryCon();
		List<ICondition> conditions = new ArrayList<ICondition>();
		if(languageQueryCon != null){
		}
		languageModel.setItems(languageService.criteriaQuery(conditions));
		model.addAttribute(languageModel);
		return "/sys/language/index";
	}
	
	@RequestMapping(value = "/language/goView")
	public String goView(@ModelAttribute LanguageModel languageModel, ModelMap model){
		if(languageModel.getDataId() != 0){
			LanguageExt languageExt = languageService.load(languageModel.getDataId(), true);
			languageModel.setLanguageExt(languageExt);
		}
		
		model.addAttribute(languageModel);
		return "/sys/language/detail";
	}
	
	@RequestMapping(value = "/language/goCreate")
	public String goCreate(@ModelAttribute LanguageModel languageModel, ModelMap model){
		languageModel.setOperationType("create");
		model.addAttribute(languageModel);
		return "/sys/language/edit";
	}
	
	@RequestMapping(value = "/language/doCreate")
	public String doCreate(@ModelAttribute LanguageModel languageModel, ModelMap model){
		if(languageModel.getLanguageExt() != null){
			languageService.create(languageModel.getLanguageExt());
		}
		
		return "forward:/language/query";
	}
	
	@RequestMapping(value = "/language/goEdit")
	public String goEdit(@ModelAttribute LanguageModel languageModel, ModelMap model){
		languageModel.setOperationType("edit");
		if(languageModel.getDataId() != 0){
			LanguageExt languageExt = languageService.load(languageModel.getDataId(), true);
			languageModel.setLanguageExt(languageExt);
			model.addAttribute(languageModel);
		}
		return "/sys/language/edit";
	}
	
	@RequestMapping(value = "/language/doEdit")
	public String doEdit(@ModelAttribute LanguageModel languageModel, ModelMap model){
		if(languageModel.getLanguageExt() != null && languageModel.getLanguageExt().getId() != 0){
			LanguageExt languageExt = languageModel.getLanguageExt();
			LanguageExt languageExtPer = languageService.load(languageModel.getLanguageExt().getId(), true);
			languageService.save(languageExt);
		}
		return "forward:/language/query";
	}
	
		@RequestMapping(value = "/language/doDelete")
	public String doDelete(@ModelAttribute LanguageModel languageModel, ModelMap model){
		if(languageModel.getLanguageExt() != null){
			languageService.create(languageModel.getLanguageExt());
		}
		if(languageModel.getDataId() != 0){
			LanguageExt languageExt = languageService.load(languageModel.getDataId(), true);
			languageService.delete(languageExt);
		}
		return "forward:/language/query";
	}
	
}
