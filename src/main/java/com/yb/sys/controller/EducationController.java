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

import com.yb.sys.entity.EducationExt;
import com.yb.sys.model.EducationModel;
import com.yb.sys.service.IEducationServiceExt;

@Controller
@Scope("request")
public class EducationController {

	@Resource(name = "educationService")
	private IEducationServiceExt educationService;
	
	@RequestMapping(value = "/education/index")
	public String index(@ModelAttribute EducationModel educationModel, ModelMap model){
		model.addAttribute(educationModel);
		
		return "/sys/education/index";
	}
	
	@RequestMapping(value = "/education/query")
	public String query(@ModelAttribute EducationModel educationModel, ModelMap model){
		EducationExt educationQueryCon = educationModel.getEducationQueryCon();
		List<ICondition> conditions = new ArrayList<ICondition>();
		if(educationQueryCon != null){
		}
		educationModel.setItems(educationService.criteriaQuery(conditions));
		model.addAttribute(educationModel);
		return "/sys/education/index";
	}
	
	@RequestMapping(value = "/education/goView")
	public String goView(@ModelAttribute EducationModel educationModel, ModelMap model){
		if(educationModel.getDataId() != 0){
			EducationExt educationExt = educationService.load(educationModel.getDataId(), true);
			educationModel.setEducationExt(educationExt);
		}
		
		model.addAttribute(educationModel);
		return "/sys/education/detail";
	}
	
	@RequestMapping(value = "/education/goCreate")
	public String goCreate(@ModelAttribute EducationModel educationModel, ModelMap model){
		educationModel.setOperationType("create");
		model.addAttribute(educationModel);
		return "/sys/education/edit";
	}
	
	@RequestMapping(value = "/education/doCreate")
	public String doCreate(@ModelAttribute EducationModel educationModel, ModelMap model){
		if(educationModel.getEducationExt() != null){
			educationService.create(educationModel.getEducationExt());
		}
		
		return "forward:/education/query";
	}
	
	@RequestMapping(value = "/education/goEdit")
	public String goEdit(@ModelAttribute EducationModel educationModel, ModelMap model){
		educationModel.setOperationType("edit");
		if(educationModel.getDataId() != 0){
			EducationExt educationExt = educationService.load(educationModel.getDataId(), true);
			educationModel.setEducationExt(educationExt);
			model.addAttribute(educationModel);
		}
		return "/sys/education/edit";
	}
	
	@RequestMapping(value = "/education/doEdit")
	public String doEdit(@ModelAttribute EducationModel educationModel, ModelMap model){
		if(educationModel.getEducationExt() != null && educationModel.getEducationExt().getId() != 0){
			EducationExt educationExt = educationModel.getEducationExt();
			EducationExt educationExtPer = educationService.load(educationModel.getEducationExt().getId(), true);
			educationService.save(educationExt);
		}
		return "forward:/education/query";
	}
	
		@RequestMapping(value = "/education/doDelete")
	public String doDelete(@ModelAttribute EducationModel educationModel, ModelMap model){
		if(educationModel.getEducationExt() != null){
			educationService.create(educationModel.getEducationExt());
		}
		if(educationModel.getDataId() != 0){
			EducationExt educationExt = educationService.load(educationModel.getDataId(), true);
			educationService.delete(educationExt);
		}
		return "forward:/education/query";
	}
	
}
