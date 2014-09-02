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

import com.yb.sys.entity.SchoolExt;
import com.yb.sys.model.SchoolModel;
import com.yb.sys.service.ISchoolServiceExt;

@Controller
@Scope("request")
public class SchoolController {

	@Resource(name = "schoolService")
	private ISchoolServiceExt schoolService;
	
	@RequestMapping(value = "/school/index")
	public String index(@ModelAttribute SchoolModel schoolModel, ModelMap model){
		model.addAttribute(schoolModel);
		
		return "/sys/school/index";
	}
	
	@RequestMapping(value = "/school/query")
	public String query(@ModelAttribute SchoolModel schoolModel, ModelMap model){
		SchoolExt schoolQueryCon = schoolModel.getSchoolQueryCon();
		List<ICondition> conditions = new ArrayList<ICondition>();
		if(schoolQueryCon != null){
		}
		schoolModel.setItems(schoolService.criteriaQuery(conditions));
		model.addAttribute(schoolModel);
		return "/sys/school/index";
	}
	
	@RequestMapping(value = "/school/goView")
	public String goView(@ModelAttribute SchoolModel schoolModel, ModelMap model){
		if(schoolModel.getDataId() != 0){
			SchoolExt schoolExt = schoolService.load(schoolModel.getDataId(), true);
			schoolModel.setSchoolExt(schoolExt);
		}
		
		model.addAttribute(schoolModel);
		return "/sys/school/detail";
	}
	
	@RequestMapping(value = "/school/goCreate")
	public String goCreate(@ModelAttribute SchoolModel schoolModel, ModelMap model){
		schoolModel.setOperationType("create");
		model.addAttribute(schoolModel);
		return "/sys/school/edit";
	}
	
	@RequestMapping(value = "/school/doCreate")
	public String doCreate(@ModelAttribute SchoolModel schoolModel, ModelMap model){
		if(schoolModel.getSchoolExt() != null){
			schoolService.create(schoolModel.getSchoolExt());
		}
		
		return "forward:/school/query";
	}
	
	@RequestMapping(value = "/school/goEdit")
	public String goEdit(@ModelAttribute SchoolModel schoolModel, ModelMap model){
		schoolModel.setOperationType("edit");
		if(schoolModel.getDataId() != 0){
			SchoolExt schoolExt = schoolService.load(schoolModel.getDataId(), true);
			schoolModel.setSchoolExt(schoolExt);
			model.addAttribute(schoolModel);
		}
		return "/sys/school/edit";
	}
	
	@RequestMapping(value = "/school/doEdit")
	public String doEdit(@ModelAttribute SchoolModel schoolModel, ModelMap model){
		if(schoolModel.getSchoolExt() != null && schoolModel.getSchoolExt().getId() != 0){
			SchoolExt schoolExt = schoolModel.getSchoolExt();
			SchoolExt schoolExtPer = schoolService.load(schoolModel.getSchoolExt().getId(), true);
			schoolService.save(schoolExt);
		}
		return "forward:/school/query";
	}
	
		@RequestMapping(value = "/school/doDelete")
	public String doDelete(@ModelAttribute SchoolModel schoolModel, ModelMap model){
		if(schoolModel.getSchoolExt() != null){
			schoolService.create(schoolModel.getSchoolExt());
		}
		if(schoolModel.getDataId() != 0){
			SchoolExt schoolExt = schoolService.load(schoolModel.getDataId(), true);
			schoolService.delete(schoolExt);
		}
		return "forward:/school/query";
	}
	
}
