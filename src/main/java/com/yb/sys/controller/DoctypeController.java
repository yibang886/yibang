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

import com.yb.sys.entity.DoctypeExt;
import com.yb.sys.model.DoctypeModel;
import com.yb.sys.service.IDoctypeServiceExt;

@Controller
@Scope("request")
public class DoctypeController {

	@Resource(name = "doctypeService")
	private IDoctypeServiceExt doctypeService;
	
	@RequestMapping(value = "/doctype/index")
	public String index(@ModelAttribute DoctypeModel doctypeModel, ModelMap model){
		model.addAttribute(doctypeModel);
		
		return "/sys/doctype/index";
	}
	
	@RequestMapping(value = "/doctype/query")
	public String query(@ModelAttribute DoctypeModel doctypeModel, ModelMap model){
		DoctypeExt doctypeQueryCon = doctypeModel.getDoctypeQueryCon();
		List<ICondition> conditions = new ArrayList<ICondition>();
		if(doctypeQueryCon != null){
		}
		doctypeModel.setItems(doctypeService.criteriaQuery(conditions));
		model.addAttribute(doctypeModel);
		return "/sys/doctype/index";
	}
	
	@RequestMapping(value = "/doctype/goView")
	public String goView(@ModelAttribute DoctypeModel doctypeModel, ModelMap model){
		if(doctypeModel.getDataId() != 0){
			DoctypeExt doctypeExt = doctypeService.load(doctypeModel.getDataId(), true);
			doctypeModel.setDoctypeExt(doctypeExt);
		}
		
		model.addAttribute(doctypeModel);
		return "/sys/doctype/detail";
	}
	
	@RequestMapping(value = "/doctype/goCreate")
	public String goCreate(@ModelAttribute DoctypeModel doctypeModel, ModelMap model){
		doctypeModel.setOperationType("create");
		model.addAttribute(doctypeModel);
		return "/sys/doctype/edit";
	}
	
	@RequestMapping(value = "/doctype/doCreate")
	public String doCreate(@ModelAttribute DoctypeModel doctypeModel, ModelMap model){
		if(doctypeModel.getDoctypeExt() != null){
			doctypeService.create(doctypeModel.getDoctypeExt());
		}
		
		return "forward:/doctype/query";
	}
	
	@RequestMapping(value = "/doctype/goEdit")
	public String goEdit(@ModelAttribute DoctypeModel doctypeModel, ModelMap model){
		doctypeModel.setOperationType("edit");
		if(doctypeModel.getDataId() != 0){
			DoctypeExt doctypeExt = doctypeService.load(doctypeModel.getDataId(), true);
			doctypeModel.setDoctypeExt(doctypeExt);
			model.addAttribute(doctypeModel);
		}
		return "/sys/doctype/edit";
	}
	
	@RequestMapping(value = "/doctype/doEdit")
	public String doEdit(@ModelAttribute DoctypeModel doctypeModel, ModelMap model){
		if(doctypeModel.getDoctypeExt() != null && doctypeModel.getDoctypeExt().getId() != 0){
			DoctypeExt doctypeExt = doctypeModel.getDoctypeExt();
			DoctypeExt doctypeExtPer = doctypeService.load(doctypeModel.getDoctypeExt().getId(), true);
			doctypeService.save(doctypeExt);
		}
		return "forward:/doctype/query";
	}
	
		@RequestMapping(value = "/doctype/doDelete")
	public String doDelete(@ModelAttribute DoctypeModel doctypeModel, ModelMap model){
		if(doctypeModel.getDoctypeExt() != null){
			doctypeService.create(doctypeModel.getDoctypeExt());
		}
		if(doctypeModel.getDataId() != 0){
			DoctypeExt doctypeExt = doctypeService.load(doctypeModel.getDataId(), true);
			doctypeService.delete(doctypeExt);
		}
		return "forward:/doctype/query";
	}
	
}
