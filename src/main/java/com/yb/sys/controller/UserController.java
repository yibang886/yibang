package com.yb.sys.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

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
import com.yb.sys.entity.LanguageExt;
import com.yb.sys.model.LanguageModel;
import com.yb.sys.service.ILanguageServiceExt;
import com.yb.sys.entity.FieldExt;
import com.yb.sys.model.FieldModel;
import com.yb.sys.service.IFieldServiceExt;
import com.yb.sys.entity.TranstypeExt;
import com.yb.sys.model.TranstypeModel;
import com.yb.sys.service.ITranstypeServiceExt;
import com.yb.sys.entity.DoctypeExt;
import com.yb.sys.model.DoctypeModel;
import com.yb.sys.service.IDoctypeServiceExt;

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

	@Resource(name = "languageService")
	private ILanguageServiceExt languageService;
  
	@Resource(name = "fieldService")
	private IFieldServiceExt fieldService;

	@Resource(name = "transtypeService")
	private ITranstypeServiceExt transtypeService;
	
	@Resource(name = "doctypeService")
	private IDoctypeServiceExt doctypeService;


	
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

      if(userExt.getindividual() != null)
      {
        System.out.println("Yuanguo: Please delete translation service first before delet user");
        return "/invalid";
      }

			userService.delete(userExt);
		}
		return "forward:/user/query";
	}

	@RequestMapping(value = "/user/goPublish")
	public String goPublish(@ModelAttribute UserModel entityModel, ModelMap model){

		entityModel.setOperationType("publish");
    /*
     * program gets here from index.jsp (see line: user/goPublish.action?dataId=${ var.id }), so
     * dataId should be the ID of the user;
     */
    Long userId = entityModel.getDataId();
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

    entityModel.setDataId(userId);

		List<ICondition> conditions = new ArrayList<ICondition>();
    entityModel.setCityEnum(cityService.criteriaQuery(conditions));
    entityModel.setRecomposEnum(recomposService.criteriaQuery(conditions));
    entityModel.setLanguageEnum(languageService.criteriaQuery(conditions));
    entityModel.setFieldEnum(fieldService.criteriaQuery(conditions));
    entityModel.setTranstypeEnum(transtypeService.criteriaQuery(conditions));
    entityModel.setDoctypeEnum(doctypeService.criteriaQuery(conditions));

    if(userExt.getuser_type()==0) //自由译员
    {
      IndividualExt indiv = individualService.load(userId, true);  //individual has the same Id as user;
      if(indiv != null)
      {
        //throw Exception("User has already published translation service");
        System.out.println("Yuanguo: User has already published translation service");
        return "/invalid";
      }

      entityModel.setEducationEnum(educationService.criteriaQuery(conditions));
      entityModel.setSchoolEnum(schoolService.criteriaQuery(conditions));

      //create a new intance of IndividualExt; it will be passed to publish_indiv.jsp and its properties 
      //will be set with value there.
      entityModel.setIndividualExt(new IndividualExt());
  	  model.addAttribute("entityModel",entityModel);

		  return "/sys/individual/edit";
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
	public String doPublish(@ModelAttribute UserModel entityModel, ModelMap model, HttpServletRequest request){

    System.out.println("Yuanguo: In doPublish");

    UserExt userExt = userService.load(entityModel.getDataId(), true);

    //individual/upload.jsp (or company/upload.jsp) is used in two use cases: 1. user publishes a 
    //individual; 2. individual modify. Thus, we make a 'mark' so that upload.jsp knows which case 
    //it is; see /user/upload.jsp (or company/upload.jsp).
    model.addAttribute("usecase", new String("publish")); 

    if(userExt.getuser_type()==0) //自由译员
    {
      //get the IndividualExt instance created in goPublish() and populated with value in publish_indiv.jsp;
      IndividualExt individualExt = entityModel.getIndividualExt();

       
      //individual has a one-to-one relationship with user, thus set the same 'id' with the related user; see
      //Individual.hbm.xml;
      individualExt.setId(userExt.getId());

      //language checkbox
      String[] lang_ids = request.getParameterValues("langCheckbox");
      Set<LanguageExt> languages = new TreeSet<LanguageExt>();
      if(lang_ids != null)
      {
        for(String lang_id:lang_ids)
        {
          LanguageExt lang = new LanguageExt();
          lang.setId(Long.parseLong(lang_id));
          languages.add(lang);
        }
      }
      individualExt.setlanguages(languages);

      //field checkbox
      String[] field_ids = request.getParameterValues("fieldCheckbox");
      Set<FieldExt> fields = new TreeSet<FieldExt>();
      if(field_ids != null)
      {
        for(String field_id:field_ids)
        {
          FieldExt field = new FieldExt();
          field.setId(Long.parseLong(field_id));
          fields.add(field);
        }
      }
      individualExt.setfields(fields);

      //transtype checkbox
      String[] transtype_ids = request.getParameterValues("transtypeCheckbox");
      Set<TranstypeExt> transtypes = new TreeSet<TranstypeExt>();
      if(transtype_ids != null)
      {
        for(String transtype_id:transtype_ids)
        {
          TranstypeExt transtype = new TranstypeExt();
          transtype.setId(Long.parseLong(transtype_id));
          transtypes.add(transtype);
        }
      }
      individualExt.settranstypes(transtypes);

      //doctype checkbox
      String[] doctype_ids = request.getParameterValues("doctypeCheckbox");
      Set<DoctypeExt> doctypes = new TreeSet<DoctypeExt>();
      if(doctype_ids != null)
      {
        for(String doctype_id:doctype_ids)
        {
          DoctypeExt doctype = new DoctypeExt();
          doctype.setId(Long.parseLong(doctype_id));
          doctypes.add(doctype);
        }
      }
      individualExt.setdoctypes(doctypes);

      individualService.create(individualExt);

      entityModel.setDataId(userExt.getId()); 
      entityModel.setFileType("photo"); //upload photo next;

      //Yuanguo: in individual/upload.jsp (or company/upload.jsp), we don't bother to differentiate between "userModel" 
      //and "indvidualModel", so we use "entityModel" generally. However, it seems we cannot simply write:
      //         model.addAttribute(entityModel);  
      //although model.addAttribute(userModel) worked fine. Is this because of @ModelAttribute in the function signature? 
  	  model.addAttribute("entityModel",entityModel);

		  return "/sys/individual/upload";
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

    UserModel entityModel = new UserModel();
    entityModel.setDataId(userId); 

    //individual/upload.jsp (or company/upload.jsp) is used in two use cases: 1. user publishes a 
    //individual; 2. individual modify. Thus, we make a 'mark' so that upload.jsp knows which case 
    //it is; see /user/upload.jsp (or company/upload.jsp).
    request.setAttribute("usecase", new String("publish"));

    if(userExt.getuser_type() == 0) //个人译员
    {
      if(fileType.equals("photo"))
      {
        if(skip == 0)
        {
          System.out.println("Yuanguo: receiving photo");

          String filePath = "/var/www/ybfiles/individual/"+userId+"/photo";

          //Yuanguo: add a number to the suffix of photo file and update it with system time in milli seconds 
          //every time a new photo is uploaded; why?
          //Because, if we don't add the number, when photo is updated, the "src" in <img src="..."/> is not 
          //updated, as a result, the browser will use the cached image instead of reload the new one. 
          //Someone on internet gave another solution: 
          //     append "?t=Math.random()" to src.
          //however, it will force a reload every time;
          List<ReceivedFile> files = UploadUtil.receive(request, filePath, ".0");

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

            //delete original files if ther is any;
            File folder = new File(filePath);
            if(folder.isDirectory())
            {
              String[] fileList = folder.list();
              for(int i=0;i<fileList.length;i++)
              {
                if(!fileList[i].endsWith(suffix))
                {
                  File beDeleted = new File(filePath, fileList[i]);
                  beDeleted.delete();
                }
              }
            }
            else
            {
              System.out.println("Yuanguo: warn, something is wrong, "+filePath+" is not a folder");
            }
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
