package com.yb.sys.controller;

import java.util.Calendar;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
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

	@Resource(name = "languageService")
	private ILanguageServiceExt languageService;
  
	@Resource(name = "fieldService")
	private IFieldServiceExt fieldService;

	@Resource(name = "transtypeService")
	private ITranstypeServiceExt transtypeService;
	
	@Resource(name = "doctypeService")
	private IDoctypeServiceExt doctypeService;



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
	
  //Yuanguo: individual/edit.jsp has two usecases: 
  //   1. user entity publishes (creates) an individual enity; 
  //   2. individual entity modification operation; 
  //in individual/edit.jsp (or company/edit.jsp), we don't bother to differentiate between "userModel" 
  //and "indvidualModel", so we use "entityModel" generally.  
	@RequestMapping(value = "/individual/goEdit")
	public String goEdit(@ModelAttribute IndividualModel entityModel, ModelMap model){

    //For usecase 1, edit.jsp should return to /user/goPublish; and for usecase 2, edit.jsp should return 
    //to /individual/doEdit. The edit.jsp knows which usecase by "operationType";
		entityModel.setOperationType("edit");

		if(entityModel.getDataId() != 0){
			IndividualExt individualExt = individualService.load(entityModel.getDataId(), true);
			entityModel.setIndividualExt(individualExt);

      //pass enumerations like cities, educations, schools and etc to individual/edit.jsp
      List<ICondition> conditions = new ArrayList<ICondition>();
      entityModel.setCityEnum(cityService.criteriaQuery(conditions));
      entityModel.setEducationEnum(educationService.criteriaQuery(conditions));
      entityModel.setSchoolEnum(schoolService.criteriaQuery(conditions));
      entityModel.setRecomposEnum(recomposService.criteriaQuery(conditions));
      entityModel.setLanguageEnum(languageService.criteriaQuery(conditions));
      entityModel.setFieldEnum(fieldService.criteriaQuery(conditions));
      entityModel.setTranstypeEnum(transtypeService.criteriaQuery(conditions));
      entityModel.setDoctypeEnum(doctypeService.criteriaQuery(conditions));
      
			model.addAttribute("entityModel",entityModel);
		}
		return "/sys/individual/edit";
	}
	
	@RequestMapping(value = "/individual/doEdit")
	public String doEdit(@ModelAttribute IndividualModel entityModel, ModelMap model, HttpServletRequest request){

		if(entityModel.getIndividualExt() != null && entityModel.getIndividualExt().getId() != 0){

			IndividualExt individualExt = entityModel.getIndividualExt();

      //get languages selected by language checkbox
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

      //get fields selected by field checkbox
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

      //get transtypes slected by transtype checkbox
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

      //get doctypes selected by doctype checkbox
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

			IndividualExt individualExtPer = individualService.load(entityModel.getIndividualExt().getId(), true);

      //We don't set these fields in edit.jsp, so we need to keep the existing values, or they will become null;
      individualExt.setphoto_suffix(individualExtPer.getphoto_suffix());
      individualExt.settrans_cert(individualExtPer.gettrans_cert());
      individualExt.setlang_cert(individualExtPer.getlang_cert());
      individualExt.setprof_cert(individualExtPer.getprof_cert());
      individualExt.setauth_file(individualExtPer.getauth_file());

			individualService.save(individualExt);

      entityModel.setDataId(individualExt.getId());

      entityModel.setFileType("photo"); //upload photo next;

      entityModel.setOperationType("edit");

  	  model.addAttribute("entityModel",entityModel);

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

    entityModel.setOperationType("edit");

    if(fileType.equals("photo"))
    {
      if(skip == 0)
      {
        System.out.println("Yuanguo: receiving photo");

        String filePath = "/var/www/ybfiles/individual/"+indivId+"/photo";

        //add time stamp to the file suffix so that "src" in <img src="..."/> will change when the photo
        //is updated. As a result, browser will re-load the image instead of using the cached one;
        List<ReceivedFile> files = UploadUtil.receive(request, filePath, "." + Calendar.getInstance().getTimeInMillis());

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

          //we assume that only one file is received.
          File rawFile = files.get(0).getFile();
          String suffix = files.get(0).getSuffix();

          ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), 50, 1f);
          ImageUtil.resize(rawFile, new File(filePath+"/large"+suffix), 200, 1f);

          IndividualExt individual = individualService.load(indivId, true);
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
      request.setAttribute("entityModel",entityModel); //this is the same as model.addAttribute("entityModel",entityModel);

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
