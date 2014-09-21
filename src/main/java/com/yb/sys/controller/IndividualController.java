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

import com.yb.sys.entity.IndividualExt;
import com.yb.sys.model.IndividualModel;
import com.yb.sys.service.IIndividualServiceExt;

@Controller
@Scope("request")
public class IndividualController {

	@Resource(name = "individualService")
	private IIndividualServiceExt individualService;
	
	@RequestMapping(value = "/individual/index")
	public String index(@ModelAttribute IndividualModel individualModel, ModelMap model){
		model.addAttribute(individualModel);
		
		return "/sys/individual/index";
	}
	
	@RequestMapping(value = "/individual/query")
	public String query(@ModelAttribute IndividualModel individualModel, ModelMap model){
		IndividualExt individualQueryCon = individualModel.getIndividualQueryCon();
		List<ICondition> conditions = new ArrayList<ICondition>();
		if(individualQueryCon != null){
		}
		individualModel.setItems(individualService.criteriaQuery(conditions));
		model.addAttribute(individualModel);
		return "/sys/individual/index";
	}
	
	@RequestMapping(value = "/individual/goView")
	public String goView(@ModelAttribute IndividualModel individualModel, ModelMap model){
		if(individualModel.getDataId() != 0){
			IndividualExt individualExt = individualService.load(individualModel.getDataId(), true);
			individualModel.setIndividualExt(individualExt);
		}
		
		model.addAttribute(individualModel);
		return "/sys/individual/detail";
	}
	
	@RequestMapping(value = "/individual/goCreate")
	public String goCreate(@ModelAttribute IndividualModel individualModel, ModelMap model){
    //Yuanguo: 
    //create and edit use the same page (edit.jsp) to enter individual info; edit.jsp 
    //makes use of "operationType" to decide to jump to "doCreate" or "doEdit"; see 
    //edit.jsp;
		individualModel.setOperationType("create");
		model.addAttribute(individualModel);
		return "/sys/individual/edit";
	}
	
	@RequestMapping(value = "/individual/doCreate")
	public String doCreate(@ModelAttribute IndividualModel individualModel, ModelMap model){
		if(individualModel.getIndividualExt() != null){
			individualService.create(individualModel.getIndividualExt());
		}
		
		return "forward:/individual/query";
	}
	
	@RequestMapping(value = "/individual/goEdit")
	public String goEdit(@ModelAttribute IndividualModel individualModel, ModelMap model){
    //Yuanguo: 
    //create and edit use the same page (edit.jsp) to enter individual info; edit.jsp 
    //makes use of "operationType" to decide to jump to "doCreate" or "doEdit"; see 
    //edit.jsp;
		individualModel.setOperationType("edit");
		if(individualModel.getDataId() != 0){
			IndividualExt individualExt = individualService.load(individualModel.getDataId(), true);
			individualModel.setIndividualExt(individualExt);
			model.addAttribute(individualModel);
		}
		return "/sys/individual/edit";
	}
	
	@RequestMapping(value = "/individual/doEdit")
	public String doEdit(@ModelAttribute IndividualModel individualModel, ModelMap model){
		if(individualModel.getIndividualExt() != null && individualModel.getIndividualExt().getId() != 0){
			IndividualExt individualExt = individualModel.getIndividualExt();
			IndividualExt individualExtPer = individualService.load(individualModel.getIndividualExt().getId(), true);
			individualService.save(individualExt);
		}
		return "forward:/individual/query";
	}
	
		@RequestMapping(value = "/individual/doDelete")
	public String doDelete(@ModelAttribute IndividualModel individualModel, ModelMap model){
		if(individualModel.getIndividualExt() != null){
			individualService.create(individualModel.getIndividualExt());
		}
		if(individualModel.getDataId() != 0){
			IndividualExt individualExt = individualService.load(individualModel.getDataId(), true);
			individualService.delete(individualExt);
		}
		return "forward:/individual/query";
	}
}
