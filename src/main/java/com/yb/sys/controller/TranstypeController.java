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

import com.yb.sys.entity.TranstypeExt;
import com.yb.sys.model.TranstypeModel;
import com.yb.sys.service.ITranstypeServiceExt;

@Controller
@Scope("request")
public class TranstypeController {

	@Resource(name = "transtypeService")
	private ITranstypeServiceExt transtypeService;
	
	@RequestMapping(value = "/transtype/index")
	public String index(@ModelAttribute TranstypeModel transtypeModel, ModelMap model){
		model.addAttribute(transtypeModel);
		
		return "/sys/transtype/index";
	}
	
	@RequestMapping(value = "/transtype/query")
	public String query(@ModelAttribute TranstypeModel transtypeModel, ModelMap model){
		TranstypeExt transtypeQueryCon = transtypeModel.getTranstypeQueryCon();
		List<ICondition> conditions = new ArrayList<ICondition>();
		if(transtypeQueryCon != null){
		}
		transtypeModel.setItems(transtypeService.criteriaQuery(conditions));
		model.addAttribute(transtypeModel);
		return "/sys/transtype/index";
	}
	
	@RequestMapping(value = "/transtype/goView")
	public String goView(@ModelAttribute TranstypeModel transtypeModel, ModelMap model){
		if(transtypeModel.getDataId() != 0){
			TranstypeExt transtypeExt = transtypeService.load(transtypeModel.getDataId(), true);
			transtypeModel.setTranstypeExt(transtypeExt);
		}
		
		model.addAttribute(transtypeModel);
		return "/sys/transtype/detail";
	}
	
	@RequestMapping(value = "/transtype/goCreate")
	public String goCreate(@ModelAttribute TranstypeModel transtypeModel, ModelMap model){
		transtypeModel.setOperationType("create");
		model.addAttribute(transtypeModel);
		return "/sys/transtype/edit";
	}
	
	@RequestMapping(value = "/transtype/doCreate")
	public String doCreate(@ModelAttribute TranstypeModel transtypeModel, ModelMap model){
		if(transtypeModel.getTranstypeExt() != null){
			transtypeService.create(transtypeModel.getTranstypeExt());
		}
		
		return "forward:/transtype/query";
	}
	
	@RequestMapping(value = "/transtype/goEdit")
	public String goEdit(@ModelAttribute TranstypeModel transtypeModel, ModelMap model){
		transtypeModel.setOperationType("edit");
		if(transtypeModel.getDataId() != 0){
			TranstypeExt transtypeExt = transtypeService.load(transtypeModel.getDataId(), true);
			transtypeModel.setTranstypeExt(transtypeExt);
			model.addAttribute(transtypeModel);
		}
		return "/sys/transtype/edit";
	}
	
	@RequestMapping(value = "/transtype/doEdit")
	public String doEdit(@ModelAttribute TranstypeModel transtypeModel, ModelMap model){
		if(transtypeModel.getTranstypeExt() != null && transtypeModel.getTranstypeExt().getId() != 0){
			TranstypeExt transtypeExt = transtypeModel.getTranstypeExt();
			TranstypeExt transtypeExtPer = transtypeService.load(transtypeModel.getTranstypeExt().getId(), true);
			transtypeService.save(transtypeExt);
		}
		return "forward:/transtype/query";
	}
	
		@RequestMapping(value = "/transtype/doDelete")
	public String doDelete(@ModelAttribute TranstypeModel transtypeModel, ModelMap model){
		if(transtypeModel.getTranstypeExt() != null){
			transtypeService.create(transtypeModel.getTranstypeExt());
		}
		if(transtypeModel.getDataId() != 0){
			TranstypeExt transtypeExt = transtypeService.load(transtypeModel.getDataId(), true);
			transtypeService.delete(transtypeExt);
		}
		return "forward:/transtype/query";
	}
	
}
