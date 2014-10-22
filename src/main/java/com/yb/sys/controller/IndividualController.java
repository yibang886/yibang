package com.yb.sys.controller;

import java.util.Calendar;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.Map;
import java.io.File;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.common.hibernate.*;
import com.common.mail.MailUtil;

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
import com.common.upload.ReceivedData;

import com.common.config.ConfigService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@Scope("request")
public class IndividualController {

  private static final Logger logger = LoggerFactory.getLogger(IndividualController.class);

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

	@Resource(name = "configService")
	private ConfigService configService;



	@RequestMapping(value = "/individual/index")
	public String index(@ModelAttribute IndividualModel individualModel, ModelMap model){
		model.addAttribute(individualModel);
		
		return "/sys/individual/index";
	}
	
	@RequestMapping(value = "/individual/query")
	public String query(@ModelAttribute IndividualModel individualModel, ModelMap model){
		IndividualExt individualQueryCon = individualModel.getIndividualQueryCon();
    logger.debug("individualQueryCon is null? "+ (individualQueryCon==null));

		List<ICondition> conditions = new ArrayList<ICondition>();

		if(individualQueryCon != null){
      generateConditions(conditions, individualQueryCon);
		}

		individualModel.setItems(individualService.criteriaQuery(conditions));
		model.addAttribute(individualModel);
		return "/sys/individual/index";
	}
	
	@RequestMapping(value = "/individual/goView")
	public String goView(@ModelAttribute IndividualModel individualModel, ModelMap model){

		individualModel.setOperationType("view");
		if(individualModel.getDataId() != 0){
			IndividualExt individualExt = individualService.load(individualModel.getDataId(), true);
			individualModel.setIndividualExt(individualExt);
		}
		
		model.addAttribute(individualModel);
		return "/sys/individual/detail";
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

    IndividualExt queryCon = entityModel.getIndividualQueryCon();
    logger.debug("queryCon==null? "+(queryCon==null) );

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
      individualExt.settranscert_suffix(individualExtPer.gettranscert_suffix());
      individualExt.setlangcert_suffix(individualExtPer.getlangcert_suffix());
      individualExt.setprofcert_suffix(individualExtPer.getprofcert_suffix());
      individualExt.setauthfile_suffix(individualExtPer.getauthfile_suffix());

			individualService.save(individualExt);

      //set parameters for upload page;
      entityModel.setDataId(individualExt.getId());

      entityModel.setFileType("photo"); //upload photo next;

      entityModel.setOperationType("edit");

  	  model.addAttribute("entityModel",entityModel);

      return "/sys/individual/upload";
		}

		return "/invalid";
	}

  //Yuanguo: we want to receive uploaded file by HttpServletRequest, thus we add  request and response as parameters;
	@RequestMapping(value = "/individual/doUploadFile")
	public String doUploadFile(@ModelAttribute IndividualModel entityModel, ModelMap model, HttpServletRequest request, HttpServletResponse response)
  {
    Long indivId = Long.parseLong(request.getParameter("dataId"));

		if( indivId == 0){
      logger.error("DataId ("+indivId+") is invalid");
      return "/invalid";
		}

    String fileType = request.getParameter("fileType");
    int skip = Integer.parseInt(request.getParameter("skip"));

    logger.debug("indivId="+indivId+", fileType="+fileType+", skip="+skip);

    //IndividualModel entityModel = new IndividualModel();
    entityModel.setDataId(indivId); 

    entityModel.setOperationType("edit");

    String view;
    if(fileType.equals("photo"))
    {
      entityModel.setFileType("language_cert"); //upload language_cert next;
      view = "/sys/individual/upload";
    }
    else if(fileType.equals("language_cert"))
    {
      entityModel.setFileType("translation_cert"); //upload translation_cert next;
      view = "/sys/individual/upload";
    }
    else if(fileType.equals("translation_cert"))
    {
      entityModel.setFileType("profession_cert"); //upload profession_cert next;
      view = "/sys/individual/upload";
    }
    else if(fileType.equals("profession_cert"))
    {
      entityModel.setFileType("authentication_file"); //upload authentication_file next;
      view = "/sys/individual/upload";
    }
    else if(fileType.equals("authentication_file"))
    {
      view = null; //we will query and return to index.jsp directly;
    }
    else
    {
      logger.error("fileType("+fileType+") is invalid, will skip upload the file");
      skip = 1;
      view = "/invalid";
    }

    ReceivedData receivedData; 

    if(skip == 1) //skip receiving file, but we have to receive ordinary fields;
    {
      logger.info("Skip uploading " + fileType);
      receivedData = UploadUtil.receive(request, false, true, null, null);
    }
    else
    {
      logger.info("Receiving " + fileType);

      String filePath = configService.getProperty("docBase")+"/ybstore/individual/"+indivId+"/"+fileType;

      //add time stamp to the file suffix so that "src" in <img src="..."/> will change when the image 
      //is updated. As a result, browser will re-load the image instead of using the cached one;
      receivedData = UploadUtil.receive(request, false, false, filePath, "." + Calendar.getInstance().getTimeInMillis());

      List<ReceivedFile> files = receivedData.getFileList(); 

      if(files == null || files.size() == 0)
      {
        logger.error("error occurred when receiving " + fileType);
      }
      else
      {
        if(files.size() > 1)
        {
          logger.warn("more than 1 images are uploaded, we only care about the first one");
        }

        File rawFile = files.get(0).getFile();
        String suffix = files.get(0).getSuffix();

        IndividualExt individual = individualService.load(indivId, true);

        if(fileType.equals("photo"))
        {
          //generate a large photo and a small photo
          ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), Integer.parseInt(configService.getProperty("photo.small.width")), 1f);
          ImageUtil.resize(rawFile, new File(filePath+"/large"+suffix), Integer.parseInt(configService.getProperty("photo.large.width")), 1f);

          individual.setphoto_suffix(suffix);
        }
        else if(fileType.equals("language_cert"))
        {
          //ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), 200, 1f);
          individual.setlangcert_suffix(suffix);
        }
        else if(fileType.equals("translation_cert"))
        {
          //ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), 200, 1f);
          individual.settranscert_suffix(suffix);
        }
        else if(fileType.equals("profession_cert"))
        {
          //ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), 200, 1f);
          individual.setprofcert_suffix(suffix);
        }
        else if(fileType.equals("authentication_file"))
        {
          //ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), 200, 1f);
          individual.setauthfile_suffix(suffix);
        }
           
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
          logger.warn("Something is wrong, "+filePath+" is not a folder");
        }
      }
    }

    //whenever file uploading is skipped, we did receive text fields; currently, we are using these text files to
    //pass individualQueryCon; because the "enctype" of upload form is "multipart/form-data", individualQueryCon 
    //can not be bound by Spring automatically, thus, we receive the fileds and bind it ourselves;
    Map<String,String> textMap = receivedData.getTextMap();

    IndividualExt queryCon = new IndividualExt();
    if(textMap.containsKey("individualQueryCon.auth_pass"))
    {
      try{
        Long value = Long.parseLong(textMap.get("individualQueryCon.auth_pass"));
        queryCon.setauth_pass(value);
      }
      catch(Throwable e)
      {
        logger.error("Exception caught!");
        e.printStackTrace();
      }
    }
    if(textMap.containsKey("individualQueryCon.valid_pass"))
    {
      try{
        Long value = Long.parseLong(textMap.get("individualQueryCon.valid_pass"));
        queryCon.setvalid_pass(value);
      }
      catch(Throwable e)
      {
        logger.error("Exception caught!");
        e.printStackTrace();
      }
    }

    entityModel.setIndividualQueryCon(queryCon);
    model.addAttribute("entityModel",entityModel);

    if(fileType.equals("authentication_file")) //last step of uploading, so go to query page;
    {
      //Yuanguo: Simply returning "forward:/individual/query" can pass the *original* individualQueryCon in entityModel (in this case, 
      //the original individualQueryCon is null because the form is "multipart/form-data" and Spring doesn't bind it automatically) to 
      //query() function; but the modification on individualQueryCon (like above) doesn't take effect; I don't know why;
      //Thus, do the query here and return directly to index.jsp instead of forwarding to /individual/query;
  		//return "forward:/individual/query";
  		List<ICondition> conditions = new ArrayList<ICondition>();
  
      generateConditions(conditions, queryCon);
  
  		entityModel.setItems(individualService.criteriaQuery(conditions));
  		return "/sys/individual/index";
    }
    else  // not last step of uploading, so go to next step;
    {
      return view;
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


	@RequestMapping(value = "/individual/goAuthenticate")
	public String goAuthenticate(@ModelAttribute IndividualModel individualModel, ModelMap model){

    logger.debug("individualQueryCon is null? "+(individualModel.getIndividualQueryCon() == null));

		individualModel.setOperationType("authenticate");

		if(individualModel.getDataId() != 0){
			IndividualExt individualExt = individualService.load(individualModel.getDataId(), true);
			individualModel.setIndividualExt(individualExt);
		}
		
		model.addAttribute(individualModel);
		return "/sys/individual/detail";
	}

	@RequestMapping(value = "/individual/doValidateAuthenticate")
	public String doValidateAuthenticate(
            @ModelAttribute IndividualModel entityModel, 
            ModelMap model, 
            HttpServletRequest request, 
            HttpServletResponse response)
  {
    String submitOrCancel = request.getParameter("submitOrCancel");
    String operation = request.getParameter("operationType");

    if(operation.equals("authenticate") || operation.equals("validate"))
    {
      if(submitOrCancel.equals("submit"))
      {
        Long indivId = Long.parseLong(request.getParameter("indivId"));
    
        if(indivId != 0)
        {
          IndividualExt individual = individualService.load(indivId, true);
    
          if(individual != null)
          {
            String result = request.getParameter("result");
        
            Long dbResult = 0L;
            boolean sendMail = false;
            if(result.equals("pass"))
            {
              logger.info(operation+" passed for individual (id="+indivId+")");
              dbResult = 1L;
              sendMail = true;
            }
            else if(result.equals("fail"))
            {
              logger.info(operation+" failed for individual (id="+indivId+")");
              dbResult = 2L;
              sendMail = true;
            }
            else
            {
              logger.info(operation+" not performed for individual (id="+indivId+")");
              dbResult = 0L;
              sendMail = false;
            }

            String operationCN;

            if(operation.equals("authenticate")) 
            {
              individual.setauth_pass(dbResult);
              operationCN="认证";
            }
            else
            {
              individual.setvalid_pass(dbResult);
              operationCN="审核";
            }

            individualService.save(individual);

            if(sendMail)
            {
              logger.info("send mail...");
              String emailContent = request.getParameter("emailContent");
              logger.debug(emailContent);

              String from = "yibang886@163.com";
              String passwd = "yibang887";
              String to = individual.getuser().getemail();
              String title = "译邦网"+operationCN+"结果";

              if(MailUtil.sendMail(from, passwd, to, title, emailContent)==false)
              logger.error("failed to send email to "+to);
            }
          }
          else
          {
            logger.error(operation+"failed because cannot load individual by id "+indivId);
          }
        }
        else
        {
          logger.error(operation+"failed because individual id ("+indivId+") is invalid");
        }
      }
      else
      {
        logger.info(operation+" canceled, so do nothing");
      }
    }
    else
    {
      logger.error("operation ("+operation+") is invalid, so do nothing");
    }


    IndividualExt queryCon = entityModel.getIndividualQueryCon();
    logger.debug("auth_pass:"+queryCon.getauth_pass());

    //get languages selected by language checkbox
    String[] lang_ids = request.getParameterValues("langCheckbox");
    Set<LanguageExt> languages = new TreeSet<LanguageExt>();
    logger.debug("lang_ids==null?" + (lang_ids==null));
    if(lang_ids != null)
    {
      for(String lang_id:lang_ids)
      {
        logger.debug("lang_id: " + lang_id);

        LanguageExt lang = new LanguageExt();
        lang.setId(Long.parseLong(lang_id));
        languages.add(lang);
      }
    }
    queryCon.setlanguages(languages);

    //Yuanguo: Simply returning "forward:/individual/query" can pass the *original* individualQueryCon in entityModel to 
    //query() function; but the modification on individualQueryCon (like above) doesn't take effect; I don't know why;
    //Thus, do the query here and return directly to index.jsp instead of forwarding to /individual/query;

		//return "forward:/individual/query";
		List<ICondition> conditions = new ArrayList<ICondition>();

    generateConditions(conditions, queryCon);

		entityModel.setItems(individualService.criteriaQuery(conditions));
		model.addAttribute(entityModel);
		return "/sys/individual/index";
	}

	@RequestMapping(value = "/individual/goValidate")
	public String goValidate(@ModelAttribute IndividualModel individualModel, ModelMap model){

		individualModel.setOperationType("validate");

		if(individualModel.getDataId() != 0){
			IndividualExt individualExt = individualService.load(individualModel.getDataId(), true);
			individualModel.setIndividualExt(individualExt);
		}
		
		model.addAttribute(individualModel);
		return "/sys/individual/detail";
	}

  private static void generateConditions(List<ICondition> condList, IndividualExt queryCon)
  {
    if(queryCon!=null)
    {
      if(queryCon.getauth_pass()!=null && queryCon.getauth_pass() < 3L)
      {
        condList.add(new EqCondition("auth_pass", queryCon.getauth_pass()));
        logger.debug("add condition: auth_pass = "+queryCon.getauth_pass());
      }
      if(queryCon.getvalid_pass()!=null && queryCon.getvalid_pass() < 3L)
      {
        condList.add(new EqCondition("valid_pass", queryCon.getvalid_pass()));
        logger.debug("add condition: valid_pass = "+queryCon.getvalid_pass());
      }
    }
  }
}
