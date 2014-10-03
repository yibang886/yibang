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
import com.common.img.ImageUtil;
import com.common.upload.UploadUtil;
import com.common.upload.ReceivedFile;

import com.yb.sys.entity.IndividualExt;
import com.yb.sys.service.IIndividualServiceExt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;

@Controller
@Scope("request")
public class UserController {

	@Resource(name = "userService")
	private IUserServiceExt userService;

	@Resource(name = "individualService")
	private IIndividualServiceExt individualService;
	
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

	@RequestMapping(value = "/user/goPublish")
	public String goPublish(@ModelAttribute UserModel userModel, ModelMap model){
    /*
     * program gets here from index.jsp (see line: user/goPublish.action?dataId=${ var.id }), so
     * dataId should be the ID of the user;
     */
    Long userId = userModel.getDataId();
		if( userId == 0){
      //throw Exception("DataId is invalid for goPublish() function");
      System.out.println("Yuanguo: DataId is invalid for goPublish() function");
      return "/invalid";
		}

  	UserExt userExt = userService.load(userId, true);
    if(userExt == null)
    {
      //throw Exception("Failed to load user by ID:"+userId);
      System.out.println("Failed to load user by ID:"+userId);
      return "/invalid";
    }

  	userModel.setUserExt(userExt);

    if(userExt.getuser_type()==0) //自由译员
    {
      IndividualExt indiv = individualService.load(userId, true);  //individual has the same Id as user;
      if(indiv != null)
      {
        //throw Exception("User has already published translation service");
        System.out.println("Yuanguo: User has already published translation service");
        return "/invalid";
      }

      //create a new intance of IndividualExt; it will be passed to publish_indiv.jsp and its properties 
      //will be set with value there.
      userModel.setIndividualExt(new IndividualExt());
  	  model.addAttribute(userModel);

		  return "/sys/user/publish_indiv";
    }
    else if(userExt.getuser_type()==1) //翻译公司
    {
    }
    else
    {
      //throw Exception("Cannot publish translation service because user_type is invalid");
      System.out.println("Yuanguo: Cannot publish translation service because user_type is invalid");
      return "/invalid";
    }

    return "/invalid";
	}

	@RequestMapping(value = "/user/doPublish")
	public String doPublish(@ModelAttribute UserModel userModel, ModelMap model){

    System.out.println("Yuanguo: In doPublish");

    UserExt userExt = userModel.getUserExt();

    if(userExt.getuser_type()==0) //自由译员
    {
      //get the IndividualExt instance created in goPublish() and populated with value in publish_indiv.jsp;
      IndividualExt individualExt = userModel.getIndividualExt();
       
      //individual has a one-to-one relationship with user, thus set the same 'id' with the related user; see
      //Individual.hbm.xml;
      individualExt.setId(userExt.getId());

      individualService.create(individualExt);

      userModel.setDataId(userExt.getId()); 
      userModel.setFileType("photo"); //upload photo next;
  	  model.addAttribute(userModel);

		  return "/sys/user/upload_indiv";
    }
    else if(userExt.getuser_type()==1) //翻译公司
    {
    }
    else
    {
      //throw Exception("Cannot publish translation service because user_type is invalid");
      System.out.println("Yuanguo: Cannot publish translation service because user_type is invalid");
      return "/invalid";
    }

		return "/invalid";
  }

  //Yuanguo: we want to receive uploaded file by HttpServletRequest, thus we use this kind of controller which 
  //takes request and response as parameters;
	@RequestMapping(value = "/user/doUploadFile")
	public String doUploadFile(HttpServletRequest request, HttpServletResponse response)
  {
    System.out.println("Yuanguo: In doUploadFile");

    Long userId = Long.parseLong(request.getParameter("dataId"));

		if( userId == 0){
      //throw Exception("DataId is invalid for doUploadFile() function");
      System.out.println("Yuanguo: DataId is invalid for doUploadFile() function");
      return "/invalid";
		}

  	UserExt userExt = userService.load(userId, true);
    if(userExt == null)
    {
      //throw Exception("Failed to load user by ID:"+userId);
      System.out.println("Yuanguo: Failed to load user by ID:"+userId);
      return "/invalid";
    }

    String fileType = request.getParameter("fileType");
    int skip = Integer.parseInt(request.getParameter("skip"));

    System.out.println("Yuanguo: In doUploadFile, userId="+userId+", fileType="+fileType+", skip="+skip);

    UserModel userModel = new UserModel();
    userModel.setDataId(userId); 

    if(userExt.getuser_type() == 0) //个人译员
    {
      if(fileType.equals("photo"))
      {
        if(skip == 0)
        {
          System.out.println("Yuanguo: receiving photo");

          String filePath = "/var/www/ybfiles/individual/"+userId+"/photo";

          List<ReceivedFile> files = UploadUtil.receive(request, filePath);

          if(files == null || files.size() == 0)
          {
            //TODO:error 
            System.out.println("Yuanguo: error occurred when receiving photo");
          }
          else 
          {
            if(files.size() != 1)
            {
              //TODO: warning
              System.out.println("Yuanguo: more than 1 photos uploaded");
            }

            File rawFile = files.get(0).getFile();
            String suffix = files.get(0).getSuffix();

            ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), 50, 1f);
            ImageUtil.resize(rawFile, new File(filePath+"/large"+suffix), 200, 1f);

            IndividualExt individual = individualService.load(userId, true);
            individual.setphoto_suffix(suffix);
            individualService.save(individual);
          }
        }
        else
        {
          System.out.println("Yuanguo: skip upload photo");
        }
        userModel.setFileType("language_cert"); //upload language_cert next;
        request.setAttribute("userModel",userModel); //this is the same as model.addAttribute(userModel);
        return "/sys/user/upload_indiv";
      }
      else if(fileType.equals("language_cert"))
      {
        if(skip == 0)
        {
          System.out.println("Yuanguo: TODO, upload language_cert");
        }
        else
        {
          System.out.println("Yuanguo: skip upload language_cert");
        }
        userModel.setFileType("translation_cert"); //upload translation_cert next;
        request.setAttribute("userModel",userModel);
        return "/sys/user/upload_indiv";
      }
      else if(fileType.equals("translation_cert"))
      {
        if(skip == 0)
        {
          System.out.println("Yuanguo: TODO, upload translation_cert");
        }
        else
        {
          System.out.println("Yuanguo: skip upload translation_cert");
        }
        userModel.setFileType("profession_cert"); //upload profession_cert next;
        request.setAttribute("userModel",userModel);
        return "/sys/user/upload_indiv";
      }
      else if(fileType.equals("profession_cert"))
      {
        if(skip == 0)
        {
          System.out.println("Yuanguo: TODO, upload profession_cert");
        }
        else
        {
          System.out.println("Yuanguo: skip upload profession_cert");
        }
        userModel.setFileType("authentication_file"); //upload authentication_file next;
        request.setAttribute("userModel",userModel);
        return "/sys/user/upload_indiv";
      }
      else if(fileType.equals("authentication_file"))
      {
        if(skip == 0)
        {
          System.out.println("Yuanguo: TODO, upload authentication_file");
        }
        else
        {
          System.out.println("Yuanguo: skip upload authentication_file");
        }
        request.setAttribute("userModel",userModel);
        return "forward:/user/query";
      }
      else
      {
        //throw Exception("Failed to upload file because fileType("+fileType+") is invalid");
        System.out.println("Yuanguo: Failed to upload file because fileType("+fileType+") is invalid");
        return "/invalid";
      }
    }
    else if(userExt.getuser_type()==1) //翻译公司
    {
    }
    else
    {
      //throw Exception("Fail to upload file because user_type is invalid");
      System.out.println("Yuanguo: Fail to upload file because user_type is invalid");
      return "/invalid";
    }

    return "/invalid";
  }
}
