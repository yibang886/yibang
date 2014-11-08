package com.yb.sys.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.Map;
import java.util.Calendar;
import java.util.Properties;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.common.hibernate.*;

import com.common.upload.UploadUtil;
import com.common.upload.ReceivedFile;
import com.common.upload.ReceivedData;
import com.common.img.ImageUtil;
import com.common.mail.MailUtil;

import com.yb.sys.entity.CompanyExt;
import com.yb.sys.model.CompanyModel;
import com.yb.sys.service.ICompanyServiceExt;

import com.yb.sys.entity.CityExt;
import com.yb.sys.model.CityModel;
import com.yb.sys.service.ICityServiceExt;
import com.yb.sys.entity.RecomposExt;
import com.yb.sys.model.RecomposModel;
import com.yb.sys.service.IRecomposServiceExt;
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

import com.common.config.ConfigService;

@Controller
@Scope("request")
public class CompanyController 
{
  private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);

  @Resource(name = "companyService")
  private ICompanyServiceExt companyService;

  //Added by Yuanguo: when go to edit page, user should be alloed to select living city and etc. 
  //These service beans are used to load the enumerations.
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

  
  @RequestMapping(value = "/company/index")
  public String index(@ModelAttribute CompanyModel entityModel, 
                                      ModelMap modelMap, 
                                      HttpServletRequest request, 
                                      HttpServletResponse response)
  {
    modelMap.addAttribute("entityModel", entityModel);
    return "/sys/company/index";
  }
  
  @RequestMapping(value = "/company/query")
  public String query(@ModelAttribute CompanyModel entityModel,
                                      ModelMap modelMap, 
                                      HttpServletRequest request, 
                                      HttpServletResponse response)
  {
    CompanyExt queryCon = entityModel.getCompanyQueryCon();
    List<ICondition> conditions = new ArrayList<ICondition>();
    if(queryCon != null)
    {
      generateConditions(conditions, queryCon);
    }

    float allNum = companyService.criteriaQueryCount(conditions);
    entityModel.setPageCount((int)Math.ceil(allNum/entityModel.getPageSize()));

		entityModel.setItems(companyService.criteriaQuery(conditions, null, entityModel.getCurrentPage(), entityModel.getPageSize()));

    modelMap.addAttribute("entityModel", entityModel);
    return "/sys/company/index";
  }
  
  @RequestMapping(value = "/company/goView")
  public String goView(@ModelAttribute CompanyModel entityModel,
                                       ModelMap modelMap,
                                       HttpServletRequest request,
                                       HttpServletResponse response)
  {
    entityModel.setOperationType("view");
    if(entityModel.getDataId() != 0)
    {
      CompanyExt companyExt = companyService.load(entityModel.getDataId(), true);
      entityModel.setCompanyExt(companyExt);
    }
    
    modelMap.addAttribute("entityModel", entityModel);
    return "/sys/company/detail";
  }
  
  @RequestMapping(value = "/company/goCreate")
  public String goCreate(@ModelAttribute CompanyModel entityModel, 
                                         ModelMap modelMap,
                                         HttpServletRequest request,
                                         HttpServletResponse response)
  {
    entityModel.setOperationType("create");
    modelMap.addAttribute("entityModel", entityModel);
    return "/sys/company/edit";
  }
  
  @RequestMapping(value = "/company/doCreate")
  public String doCreate(@ModelAttribute CompanyModel entityModel, 
                                         ModelMap modelMap,
                                         HttpServletRequest request,
                                         HttpServletResponse response)
  {
    CompanyExt companyExt = entityModel.getCompanyExt();
    if(companyExt != null)
    {
      companyService.create(companyExt);
    }

    return "forward:/company/query";
  }
  
  @RequestMapping(value = "/company/goEdit")
  public String goEdit(@ModelAttribute CompanyModel entityModel, 
                                       ModelMap modelMap,
                                       HttpServletRequest request,
                                       HttpServletResponse response)
  {
    entityModel.setOperationType("edit");
    if(entityModel.getDataId() != 0)
    {
      CompanyExt companyExt = companyService.load(entityModel.getDataId(), true);
      entityModel.setCompanyExt(companyExt);

      //pass enumerations like cities, educations, schools and etc to company/edit.jsp
      List<ICondition> conditions = new ArrayList<ICondition>();
      entityModel.setCityEnum(cityService.criteriaQuery(conditions));
      entityModel.setRecomposEnum(recomposService.criteriaQuery(conditions));
      entityModel.setLanguageEnum(languageService.criteriaQuery(conditions));
      entityModel.setFieldEnum(fieldService.criteriaQuery(conditions));
      entityModel.setTranstypeEnum(transtypeService.criteriaQuery(conditions));
      entityModel.setDoctypeEnum(doctypeService.criteriaQuery(conditions));

      modelMap.addAttribute("entityModel", entityModel);
    }
    return "/sys/company/edit";
  }
  
  @RequestMapping(value = "/company/doEdit")
  public String doEdit(@ModelAttribute CompanyModel entityModel, 
                                       ModelMap modelMap,
                                       HttpServletRequest request,
                                       HttpServletResponse response)
  {
    if(entityModel.getCompanyExt() != null && entityModel.getCompanyExt().getId() != 0)
    {
      CompanyExt companyExt = entityModel.getCompanyExt();

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
      companyExt.setLanguages(languages);

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
      companyExt.setFields(fields);

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
      companyExt.setTranstypes(transtypes);

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
      companyExt.setDoctypes(doctypes);

      CompanyExt companyExtPer = companyService.load(entityModel.getCompanyExt().getId(), true);

      //We don't set these fields in edit.jsp, so we need to keep the existing values, or they will become null;
      companyExt.setLogo(companyExtPer.getLogo());
      companyExt.setAuthfile(companyExtPer.getAuthfile());

      companyService.save(companyExt);

      //set parameters for upload page;
      entityModel.setDataId(companyExt.getId());
      entityModel.setFileType("logo"); //upload logo next;
      entityModel.setOperationType("edit");
  	  modelMap.addAttribute("entityModel",entityModel);

      return "/sys/company/upload";
    }
		return "/invalid";
  }

	@RequestMapping(value = "/company/doUploadFile")
	public String doUploadFile(@ModelAttribute CompanyModel entityModel, 
                                             ModelMap modelMap, 
                                             HttpServletRequest request, 
                                             HttpServletResponse response)
  {
    Long compId = Long.parseLong(request.getParameter("dataId"));

		if( compId == 0){
      logger.error("DataId ("+compId+") is invalid");
      return "/invalid";
		}

    String fileType = request.getParameter("fileType");
    int skip = Integer.parseInt(request.getParameter("skip"));

    logger.debug("compId="+compId+", fileType="+fileType+", skip="+skip);

    entityModel.setDataId(compId); 
    entityModel.setOperationType("edit");

    String view;
    if(fileType.equals("logo"))
    {
      entityModel.setFileType("authentication_file"); //upload authentication_file next;
      view = "/sys/company/upload";
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

      String localPath = "/ybstore/company/"+compId+"/"+fileType;
      String filePath = configService.getProperty("docBase")+localPath;

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

        CompanyExt company = companyService.load(compId, true);

        if(fileType.equals("logo"))
        {
          //generate a large logo and a small logo 
          //ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), Integer.parseInt(configService.getProperty("logo.small.width")), 1f);
          //ImageUtil.resize(rawFile, new File(filePath+"/large"+suffix), Integer.parseInt(configService.getProperty("logo.large.width")), 1f);

          company.setLogo(localPath+"/raw"+suffix);
        }
        else if(fileType.equals("authentication_file"))
        {
          //ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), 200, 1f);
          company.setAuthfile(localPath+"/raw"+suffix);
        }
           
        companyService.save(company);

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
    //pass companyQueryCon; because the "enctype" of upload form is "multipart/form-data", companyQueryCon 
    //can not be bound by Spring automatically, thus, we receive the fileds and bind it ourselves;
    Map<String,String> textMap = receivedData.getTextMap();

    CompanyExt queryCon = new CompanyExt();
    if(textMap.containsKey("companyQueryCon.auth_pass"))
    {
      try{
        Long value = Long.parseLong(textMap.get("companyQueryCon.auth_pass"));
        queryCon.setAuth_pass(value);
      }
      catch(Throwable e)
      {
        logger.error("Exception caught!");
        e.printStackTrace();
      }
    }
    if(textMap.containsKey("companyQueryCon.valid_pass"))
    {
      try{
        Long value = Long.parseLong(textMap.get("companyQueryCon.valid_pass"));
        queryCon.setValid_pass(value);
      }
      catch(Throwable e)
      {
        logger.error("Exception caught!");
        e.printStackTrace();
      }
    }

    entityModel.setCompanyQueryCon(queryCon);
    modelMap.addAttribute("entityModel",entityModel);

    if(fileType.equals("authentication_file")) //last step of uploading, so go to query page;
    {
      //Yuanguo: Simply returning "forward:/company/query" can pass the *original* companyQueryCon in entityModel (in this case, 
      //the original companyQueryCon is null because the form is "multipart/form-data" and Spring doesn't bind it automatically) to 
      //query() function; but the modification on companyQueryCon (like above) doesn't take effect; I don't know why;
      //Thus, do the query here and return directly to index.jsp instead of forwarding to /company/query;
  		//return "forward:/company/query";
  		List<ICondition> conditions = new ArrayList<ICondition>();
  
      generateConditions(conditions, queryCon);
  
  		entityModel.setItems(companyService.criteriaQuery(conditions));
  		return "/sys/company/index";
    }
    else  // not last step of uploading, so go to next step;
    {
      return view;
    }
  }

	@RequestMapping(value = "/company/goAuthenticate")
	public String goAuthenticate(@ModelAttribute CompanyModel entityModel, 
                                               ModelMap modelMap,
                                               HttpServletRequest request, 
                                               HttpServletResponse response)
  {
    logger.debug("companyQueryCon is null? "+(entityModel.getCompanyQueryCon() == null));

		entityModel.setOperationType("authenticate");

		if(entityModel.getDataId() != 0){
			CompanyExt companyExt = companyService.load(entityModel.getDataId(), true);
			entityModel.setCompanyExt(companyExt);
		}
		
		modelMap.addAttribute("entityModel", entityModel);
		return "/sys/company/detail";
	}

	@RequestMapping(value = "/company/goValidate")
	public String goValidate(@ModelAttribute CompanyModel entityModel, 
                                           ModelMap modelMap,
                                           HttpServletRequest request, 
                                           HttpServletResponse response)
  {
		entityModel.setOperationType("validate");

		if(entityModel.getDataId() != 0){
			CompanyExt companyExt = companyService.load(entityModel.getDataId(), true);
			entityModel.setCompanyExt(companyExt);
		}
		
		modelMap.addAttribute("entityModel",entityModel);
		return "/sys/company/detail";
	}

	@RequestMapping(value = "/company/doValidateAuthenticate")
	public String doValidateAuthenticate(
            @ModelAttribute CompanyModel entityModel, 
            ModelMap modelMap, 
            HttpServletRequest request, 
            HttpServletResponse response)
  {
    String submitOrCancel = request.getParameter("submitOrCancel");
    String operation = request.getParameter("operationType");

    if(operation.equals("authenticate") || operation.equals("validate"))
    {
      if(submitOrCancel.equals("submit"))
      {
        Long compId = Long.parseLong(request.getParameter("compId"));
    
        if(compId != 0)
        {
          CompanyExt company = companyService.load(compId, true);
    
          if(company != null)
          {
            String result = request.getParameter("result");
        
            Long dbResult = 0L;
            boolean sendMail = false;
            if(result.equals("pass"))
            {
              logger.info(operation+" passed for company (id="+compId+")");
              dbResult = 1L;
              sendMail = true;
            }
            else if(result.equals("fail"))
            {
              logger.info(operation+" failed for company (id="+compId+")");
              dbResult = 2L;
              sendMail = true;
            }
            else
            {
              logger.info(operation+" not performed for company (id="+compId+")");
              dbResult = 0L;
              sendMail = false;
            }

            String operationCN;

            if(operation.equals("authenticate")) 
            {
              company.setAuth_pass(dbResult);
              operationCN="认证";
            }
            else
            {
              company.setValid_pass(dbResult);
              operationCN="审核";
            }

            companyService.save(company);

            if(sendMail)
            {
              logger.info("send mail...");
              String emailContent = request.getParameter("emailContent");
              logger.debug(emailContent);

              String from = "yibang886@163.com";
              String passwd = "yibang887";
              String to = company.getUser().getemail();
              String title = "译邦网"+operationCN+"结果";

              if(MailUtil.sendMail(from, passwd, to, title, emailContent)==false)
              logger.error("failed to send email to "+to);
            }
          }
          else
          {
            logger.error(operation+"failed because cannot load company by id "+compId);
          }
        }
        else
        {
          logger.error(operation+"failed because company id ("+compId+") is invalid");
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

    CompanyExt queryCon = entityModel.getCompanyQueryCon();
    logger.debug("auth_pass:"+queryCon.getAuth_pass());

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
    queryCon.setLanguages(languages);

    //Yuanguo: Simply returning "forward:/company/query" can pass the *original* companyQueryCon in entityModel to 
    //query() function; but the modification on companyQueryCon (like above) doesn't take effect; I don't know why;
    //Thus, do the query here and return directly to index.jsp instead of forwarding to /company/query;

		//return "forward:/company/query";
		List<ICondition> conditions = new ArrayList<ICondition>();

    generateConditions(conditions, queryCon);

		entityModel.setItems(companyService.criteriaQuery(conditions));
		modelMap.addAttribute("entityModel", entityModel);
		return "/sys/company/index";
	}
  
  @RequestMapping(value = "/company/doDelete")
  public String doDelete(@ModelAttribute CompanyModel entityModel, 
                                         ModelMap modelMap,
                                         HttpServletRequest request,
                                         HttpServletResponse response)
  {
    if(entityModel.getCompanyExt() != null)
    {
      companyService.create(entityModel.getCompanyExt());
    }
    if(entityModel.getDataId() != 0)
    {
      CompanyExt companyExt = companyService.load(entityModel.getDataId(), true);
      companyService.delete(companyExt);
    }
    return "forward:/company/query";
  }

  private static void generateConditions(List<ICondition> condList, CompanyExt queryCon)
  {
    if(queryCon!=null)
    {
      if(queryCon.getAuth_pass()!=null && queryCon.getAuth_pass() < 3L)
      {
        condList.add(new EqCondition("auth_pass", queryCon.getAuth_pass()));
        logger.debug("add condition: auth_pass = "+queryCon.getAuth_pass());
      }
      if(queryCon.getValid_pass()!=null && queryCon.getValid_pass() < 3L)
      {
        condList.add(new EqCondition("valid_pass", queryCon.getValid_pass()));
        logger.debug("add condition: valid_pass = "+queryCon.getValid_pass());
      }
    }
  }
}
