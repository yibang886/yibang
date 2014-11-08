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

import com.yb.sys.entity.FieldExt;
import com.yb.sys.model.FieldModel;
import com.yb.sys.service.IFieldServiceExt;

@Controller
@Scope("request")
public class FieldController {

	@Resource(name = "fieldService")
	private IFieldServiceExt fieldService;
	
	@RequestMapping(value = "/field/index")
	public String index(@ModelAttribute FieldModel fieldModel, ModelMap model){
		model.addAttribute(fieldModel);
		
		return "/sys/field/index";
	}
	
	@RequestMapping(value = "/field/query")
	public String query(@ModelAttribute FieldModel fieldModel, ModelMap model){
		FieldExt fieldQueryCon = fieldModel.getFieldQueryCon();
		List<ICondition> conditions = new ArrayList<ICondition>();
		if(fieldQueryCon != null){
		}

    float allNum = fieldService.criteriaQueryCount(conditions);
    fieldModel.setPageCount((int)Math.ceil(allNum/fieldModel.getPageSize()));

		fieldModel.setItems(fieldService.criteriaQuery(conditions, null, fieldModel.getCurrentPage(), fieldModel.getPageSize()));

		model.addAttribute(fieldModel);
		return "/sys/field/index";
	}
	
	@RequestMapping(value = "/field/goView")
	public String goView(@ModelAttribute FieldModel fieldModel, ModelMap model){
		if(fieldModel.getDataId() != 0){
			FieldExt fieldExt = fieldService.load(fieldModel.getDataId(), true);
			fieldModel.setFieldExt(fieldExt);
		}
		
		model.addAttribute(fieldModel);
		return "/sys/field/detail";
	}
	
	@RequestMapping(value = "/field/goCreate")
	public String goCreate(@ModelAttribute FieldModel fieldModel, ModelMap model){
		fieldModel.setOperationType("create");
		model.addAttribute(fieldModel);
		return "/sys/field/edit";
	}
	
	@RequestMapping(value = "/field/doCreate")
	public String doCreate(@ModelAttribute FieldModel fieldModel, ModelMap model){
		if(fieldModel.getFieldExt() != null){
			fieldService.create(fieldModel.getFieldExt());
		}
		
		return "forward:/field/query";
	}
	
	@RequestMapping(value = "/field/goEdit")
	public String goEdit(@ModelAttribute FieldModel fieldModel, ModelMap model){
		fieldModel.setOperationType("edit");
		if(fieldModel.getDataId() != 0){
			FieldExt fieldExt = fieldService.load(fieldModel.getDataId(), true);
			fieldModel.setFieldExt(fieldExt);
			model.addAttribute(fieldModel);
		}
		return "/sys/field/edit";
	}
	
	@RequestMapping(value = "/field/doEdit")
	public String doEdit(@ModelAttribute FieldModel fieldModel, ModelMap model){
		if(fieldModel.getFieldExt() != null && fieldModel.getFieldExt().getId() != 0){
			FieldExt fieldExt = fieldModel.getFieldExt();
			FieldExt fieldExtPer = fieldService.load(fieldModel.getFieldExt().getId(), true);
			fieldService.save(fieldExt);
		}
		return "forward:/field/query";
	}
	
		@RequestMapping(value = "/field/doDelete")
	public String doDelete(@ModelAttribute FieldModel fieldModel, ModelMap model){
		if(fieldModel.getFieldExt() != null){
			fieldService.create(fieldModel.getFieldExt());
		}
		if(fieldModel.getDataId() != 0){
			FieldExt fieldExt = fieldService.load(fieldModel.getDataId(), true);
			fieldService.delete(fieldExt);
		}
		return "forward:/field/query";
	}
	
}
