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

import com.yb.sys.entity.UserExt;
import com.yb.sys.model.UserModel;
import com.yb.sys.service.IUserServiceExt;

@Controller
@Scope("request")
public class UserController {

	@Resource(name = "userService")
	private IUserServiceExt userService;
	
	@RequestMapping(value = "/user/index")
	public String index(@ModelAttribute UserModel userModel, ModelMap model){
		model.addAttribute(userModel);
		
		return "/sys/user/index";
	}
	
	@RequestMapping(value = "/user/query")
	public String query(@ModelAttribute UserModel userModel, ModelMap model){
		UserExt userQueryCon = userModel.getUserQueryCon();
		List<ICondition> conditions = new ArrayList<ICondition>();
		if(userQueryCon != null){
		}
		userModel.setItems(userService.criteriaQuery(conditions));
		model.addAttribute(userModel);
		return "/sys/user/index";
	}
	
	@RequestMapping(value = "/user/goView")
	public String goView(@ModelAttribute UserModel userModel, ModelMap model){
		if(userModel.getDataId() != 0){
			UserExt userExt = userService.load(userModel.getDataId(), true);
			userModel.setUserExt(userExt);
		}
		
		model.addAttribute(userModel);
		return "/sys/user/detail";
	}
	
	@RequestMapping(value = "/user/goCreate")
	public String goCreate(@ModelAttribute UserModel userModel, ModelMap model){
		userModel.setOperationType("create");
		model.addAttribute(userModel);
		return "/sys/user/edit";
	}
	
	@RequestMapping(value = "/user/doCreate")
	public String doCreate(@ModelAttribute UserModel userModel, ModelMap model){
		if(userModel.getUserExt() != null){
			userService.create(userModel.getUserExt());
		}
		
		return "forward:/user/query";
	}
	
	@RequestMapping(value = "/user/goEdit")
	public String goEdit(@ModelAttribute UserModel userModel, ModelMap model){
		userModel.setOperationType("edit");
		if(userModel.getDataId() != 0){
			UserExt userExt = userService.load(userModel.getDataId(), true);
			userModel.setUserExt(userExt);
			model.addAttribute(userModel);
		}
		return "/sys/user/edit";
	}
	
	@RequestMapping(value = "/user/doEdit")
	public String doEdit(@ModelAttribute UserModel userModel, ModelMap model){
		if(userModel.getUserExt() != null && userModel.getUserExt().getId() != 0){
			UserExt userExt = userModel.getUserExt();
			UserExt userExtPer = userService.load(userModel.getUserExt().getId(), true);
			userService.save(userExt);
		}
		return "forward:/user/query";
	}
	
		@RequestMapping(value = "/user/doDelete")
	public String doDelete(@ModelAttribute UserModel userModel, ModelMap model){
		if(userModel.getUserExt() != null){
			userService.create(userModel.getUserExt());
		}
		if(userModel.getDataId() != 0){
			UserExt userExt = userService.load(userModel.getDataId(), true);
			userService.delete(userExt);
		}
		return "forward:/user/query";
	}
	
}
