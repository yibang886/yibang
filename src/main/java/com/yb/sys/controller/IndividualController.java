package com.yb.sys.controller;

import java.util.ArrayList;
import java.util.List;
import java.io.File;

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

import com.yb.sys.entity.EducationExt;
import com.yb.sys.model.EducationModel;
import com.yb.sys.service.IEducationServiceExt;
import com.yb.sys.entity.CityExt;
import com.yb.sys.model.CityModel;
import com.yb.sys.service.ICityServiceExt;
import com.yb.sys.entity.RecomposExt;
import com.yb.sys.model.RecomposModel;
import com.yb.sys.service.IRecomposServiceExt;
import com.yb.sys.entity.SchoolExt;
import com.yb.sys.model.SchoolModel;
import com.yb.sys.service.ISchoolServiceExt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.img.ImageUtil;
import com.common.upload.UploadUtil;
import com.common.upload.ReceivedFile;

@Controller
@Scope("request")
public class IndividualController {

	@Resource(name = "individualService")
	private IIndividualServiceExt individualService;

  //Added by Yuanguo: when go to edit page, user should be alloed to select living city, education, school and etc. 
  //These service beans are used to load the enumerations.
	@Resource(name = "educationService")
	private IEducationServiceExt educationService;

	@Resource(name = "schoolService")
	private ISchoolServiceExt schoolService;

	@Resource(name = "cityService")
	private ICityServiceExt cityService;

	@Resource(name = "recomposService")
	private IRecomposServiceExt recomposService;
  

	
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

      //Yuanguo: pass enumerations like cities, educations, schools and etc to edit.jsp
      List<ICondition> conditions = new ArrayList<ICondition>();
      individualModel.setCityEnum(cityService.criteriaQuery(conditions));
      individualModel.setEducationEnum(educationService.criteriaQuery(conditions));
      individualModel.setSchoolEnum(schoolService.criteriaQuery(conditions));
      individualModel.setRecomposEnum(recomposService.criteriaQuery(conditions));
      
			model.addAttribute(individualModel);
		}
		return "/sys/individual/edit";
	}
	
	@RequestMapping(value = "/individual/doEdit")
	public String doEdit(@ModelAttribute IndividualModel entityModel, ModelMap model){

		if(entityModel.getIndividualExt() != null && entityModel.getIndividualExt().getId() != 0){
			IndividualExt individualExt = entityModel.getIndividualExt();
			IndividualExt individualExtPer = individualService.load(entityModel.getIndividualExt().getId(), true);
			individualService.save(individualExt);

      entityModel.setDataId(individualExt.getId());
      entityModel.setFileType("photo"); //upload photo next;
  	  model.addAttribute("entityModel",entityModel);
    
      //individual/upload.jsp is used in two use cases: 1. user publishes a individual; 2. individual modify. 
      //Thus, we make a 'mark' so that upload.jsp knows which case it is; see /user/upload.jsp;
      model.addAttribute("usecase", new String("modify"));

      return "/sys/individual/upload";
		}

		return "/invalid";
	}

  //Yuanguo: we want to receive uploaded file by HttpServletRequest, thus we use this kind of controller which 
  //takes request and response as parameters;
	@RequestMapping(value = "/individual/doUploadFile")
	public String doUploadFile(HttpServletRequest request, HttpServletResponse response)
  {
    System.out.println("Yuanguo: In IndividualController.doUploadFile()");

    Long indivId = Long.parseLong(request.getParameter("dataId"));

    System.out.println("Yuanguo: indivId = "+indivId);

		if( indivId == 0){
      //throw Exception("DataId is invalid for doUploadFile() function");
      System.out.println("Yuanguo: DataId is invalid for doUploadFile() function");
      return "/invalid";
		}

    String fileType = request.getParameter("fileType");
    int skip = Integer.parseInt(request.getParameter("skip"));

    System.out.println("Yuanguo: In doUploadFile, indivId="+indivId+", fileType="+fileType+", skip="+skip);

    IndividualModel entityModel = new IndividualModel();
    entityModel.setDataId(indivId); 

    request.setAttribute("usecase", new String("modify"));

    if(fileType.equals("photo"))
    {
      if(skip == 0)
      {
        System.out.println("Yuanguo: receiving photo");

        String filePath = "/var/www/ybfiles/individual/"+indivId+"/photo";

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

          IndividualExt individual = individualService.load(indivId, true);
          individual.setphoto_suffix(suffix);
          individualService.save(individual);

            System.out.println("Yuanguo: Saved");
        }
      }
      else
      {
        System.out.println("Yuanguo: skip upload photo");
      }

      entityModel.setFileType("language_cert"); //upload language_cert next;
      request.setAttribute("entityModel",entityModel); //this is the same as model.addAttribute(entityModel);

      return "/sys/individual/upload";
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
      entityModel.setFileType("translation_cert"); //upload translation_cert next;
      request.setAttribute("entityModel",entityModel);
      return "/sys/individual/upload";
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
      entityModel.setFileType("profession_cert"); //upload profession_cert next;
      request.setAttribute("entityModel",entityModel);
      return "/sys/individual/upload";
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
      entityModel.setFileType("authentication_file"); //upload authentication_file next;
      request.setAttribute("entityModel",entityModel);
      return "/sys/individual/upload";
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
      request.setAttribute("entityModel",entityModel);
      return "forward:/individual/query";
    }
    else
    {
      //throw Exception("Failed to upload file because fileType("+fileType+") is invalid");
      System.out.println("Yuanguo: Failed to upload file because fileType("+fileType+") is invalid");
      return "/invalid";
    }
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
