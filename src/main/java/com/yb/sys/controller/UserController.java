package com.yb.sys.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.common.hibernate.*;

import com.yb.sys.entity.UserExt;
import com.yb.sys.model.UserModel;
import com.yb.sys.service.IUserServiceExt;
import com.common.img.ImageUtil;
import com.common.upload.UploadUtil;
import com.common.upload.ReceivedFile;
import com.common.upload.ReceivedData;

import com.common.config.ConfigService;

import com.yb.sys.entity.IndividualExt;
import com.yb.sys.service.IIndividualServiceExt;
import com.yb.sys.entity.CompanyExt;
import com.yb.sys.service.ICompanyServiceExt;

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
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@Scope("request")
public class UserController {

  private static final Logger logger = LoggerFactory.getLogger(UserController.class);

  @Resource(name = "userService")
  private IUserServiceExt userService;

  @Resource(name = "individualService")
  private IIndividualServiceExt individualService;

  @Resource(name = "companyService")
  private ICompanyServiceExt companyService;

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

  

  @RequestMapping(value = "/user/login")
  public String login(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, HttpServletRequest request, ModelMap map)
  {
    if(email!=null&&!email.isEmpty())
    {
      List<ICondition> conditions = new ArrayList<ICondition>();
      conditions.add(new EqCondition("email",email));
      List<UserExt> userList = userService.criteriaQuery(conditions);
      if(userList.size()==1 && userList.get(0).getpassword()!=null)
      {
        UserExt userExt = userList.get(0);
        if(userExt.getpassword().equals(password))
        {
          session.setAttribute("user", userExt);
          return "../../../login";
        }
        else
        {
          map.addAttribute("error", "用户名不存在或者密码错误");
        }
      }
      else
      {
        map.addAttribute("error", "用户名不存在或者密码错误");
      }
    }
    else
    {
      map.addAttribute("error", "用户名不存在或者密码错误");
    }
    return "../../../login";
  }

  @RequestMapping(value = "/user/logout")
  public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
  {
    session.setAttribute("user", null);
    return "../../../sessionout";
  }
  
  @RequestMapping(value = "/user/index")
  public String index(@ModelAttribute UserModel userModel, ModelMap model){

    //even for index page, we don't show admin account;
    List<ICondition> conditions = new ArrayList<ICondition>();
    generateConditions(conditions, null);
    
    float allNum = userService.criteriaQueryCount(conditions);
    userModel.setPageCount((int)Math.ceil(allNum/userModel.getPageSize()));
    userModel.setItems(userService.criteriaQuery(conditions, null, userModel.getCurrentPage(), userModel.getPageSize()));

    model.addAttribute(userModel);
    return "/sys/user/index";
  }
  
  @RequestMapping(value = "/user/query")
  public String query(@ModelAttribute UserModel userModel, ModelMap model){
    UserExt userQueryCon = userModel.getUserQueryCon();
    List<ICondition> conditions = new ArrayList<ICondition>();
    generateConditions(conditions, userQueryCon);

    float allNum = userService.criteriaQueryCount(conditions);
    userModel.setPageCount((int)Math.ceil(allNum/userModel.getPageSize()));

    userModel.setItems(userService.criteriaQuery(conditions, null, userModel.getCurrentPage(), userModel.getPageSize()));

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

      String email = userModel.getUserExt().getemail();
      String tel = userModel.getUserExt().gettel();
      String mob = userModel.getUserExt().getmobile();
      String fax = userModel.getUserExt().getfax();
      String qq = userModel.getUserExt().getqq();
      String wx = userModel.getUserExt().getweixin();

      if(email!=null) email = email.trim();
      if(tel!=null) tel = tel.trim();
      if(mob!=null) mob = mob.trim();
      if(fax!=null) fax = fax.trim();
      if(qq!=null) qq = qq.trim();
      if(wx!=null) wx = wx.trim(); 

      if(email!=null && !email.equals(""))
        userModel.getUserExt().setemail(email);
      else
        userModel.getUserExt().setemail(null);

      if(tel!=null && !tel.equals(""))
        userModel.getUserExt().settel(tel);
      else
        userModel.getUserExt().settel(null);
      
      if(mob!=null && !mob.equals(""))
        userModel.getUserExt().setmobile(mob);
      else
        userModel.getUserExt().setmobile(null);

      if(fax!=null && !fax.equals(""))
        userModel.getUserExt().setfax(fax);
      else
        userModel.getUserExt().setfax(null);

      if(qq!=null && !qq.equals(""))
        userModel.getUserExt().setqq(qq);
      else
        userModel.getUserExt().setqq(null);

      if(wx!=null && !wx.equals(""))
        userModel.getUserExt().setweixin(wx);
      else
        userModel.getUserExt().setweixin(null);

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

      String email = userModel.getUserExt().getemail();
      String tel = userModel.getUserExt().gettel();
      String mob = userModel.getUserExt().getmobile();
      String fax = userModel.getUserExt().getfax();
      String qq = userModel.getUserExt().getqq();
      String wx = userModel.getUserExt().getweixin();

      if(email!=null) email = email.trim();
      if(tel!=null) tel = tel.trim();
      if(mob!=null) mob = mob.trim();
      if(fax!=null) fax = fax.trim();
      if(qq!=null) qq = qq.trim();
      if(wx!=null) wx = wx.trim(); 

      if(email!=null && !email.equals(""))
        userModel.getUserExt().setemail(email);
      else
        userModel.getUserExt().setemail(null);

      if(tel!=null && !tel.equals(""))
        userModel.getUserExt().settel(tel);
      else
        userModel.getUserExt().settel(null);
      
      if(mob!=null && !mob.equals(""))
        userModel.getUserExt().setmobile(mob);
      else
        userModel.getUserExt().setmobile(null);

      if(fax!=null && !fax.equals(""))
        userModel.getUserExt().setfax(fax);
      else
        userModel.getUserExt().setfax(null);

      if(qq!=null && !qq.equals(""))
        userModel.getUserExt().setqq(qq);
      else
        userModel.getUserExt().setqq(null);

      if(wx!=null && !wx.equals(""))
        userModel.getUserExt().setweixin(wx);
      else
        userModel.getUserExt().setweixin(null);

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
        logger.info("Cannot delete user entity before corresponding individual is deleted");
	model.addAttribute("title", "操作非法");
        model.addAttribute("err_msg", "你已经发布了个人译员翻译服务，请先删除翻译服务，然后才能删除用户。");
        return "../../../err_info";
      }

      if(userExt.getcompany() != null)
      {
        logger.info("Cannot delete user entity before corresponding company is deleted");
	model.addAttribute("title", "操作非法");
        model.addAttribute("err_msg", "你已经发布了翻译公司翻译服务，请先删除翻译服务，然后才能删除用户。");
        return "../../../err_info";
      }

      userService.delete(userExt);
    }
    return "forward:/user/query";
  }

  //Yuanguo: individual/edit.jsp or company/edit.jsp has two usecases: 
  //   1. user entity publishes (creates) an individual enity; 
  //   2. individual/company entity modification operation; 
  @RequestMapping(value = "/user/goPublish")
  public String goPublish(@ModelAttribute UserModel entityModel, ModelMap model){

    //For usecase 1, edit.jsp should return to /user/goPublish; and for usecase 2, edit.jsp should return 
    //to /individual/doEdit (or /company/doEdit). The edit.jsp knows which usecase by "operationType";
    entityModel.setOperationType("publish");

    //program gets here from index.jsp (see line: user/goPublish.action?dataId=${ var.id }), so
    //dataId should be the ID of the user;
    Long userId = entityModel.getDataId();

    if( userId == 0){
      logger.error("DataId ("+userId+") is invalid");
      model.addAttribute("title", "系统故障");
      model.addAttribute("err_msg", "用户ID非法，不能发布翻译服务。");
      return "../../../err_info";
    }

    UserExt userExt = userService.load(userId, true);
    if(userExt == null)
    {
      logger.error("Failed to load user by ID:"+userId);
      model.addAttribute("title", "系统故障");
      model.addAttribute("err_msg", "加载用户失败，不能发布翻译服务。");
      return "../../../err_info";
    }

    //in doPublish() function, we need the userId, so we pass it to edit.jsp and then pass to doPublish();
    entityModel.setDataId(userId);

    //pass enumerations like cities, educations, schools and etc to individual/edit.jsp
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
        logger.info("User has already published translation service");
	model.addAttribute("title", "操作非法");
        model.addAttribute("err_msg", "你已经发布了翻译服务，不能重复发布。请删除后重新发布。");
        return "../../../err_info";
      }

      entityModel.setEducationEnum(educationService.criteriaQuery(conditions));
      entityModel.setSchoolEnum(schoolService.criteriaQuery(conditions));

      //create a new intance of IndividualExt; it will be passed to individual/edit.jsp and it will be populated there.
      entityModel.setIndividualExt(new IndividualExt());

      //Yuanguo: it seems we cannot simply write:
      //         model.addAttribute(entityModel);  
      //although model.addAttribute(userModel) worked fine (when parameter "entityModel" was named userModel before). Is 
      //this because of @ModelAttribute in the function signature?
      //The answer: model.addAttribute(obj) equals to model.addAttribute("objClassNameLowerCaseFirstChar", obj);
      model.addAttribute("entityModel",entityModel);

      return "/sys/individual/edit";
    }
    else if(userExt.getuser_type()==1) //翻译公司
    {
      CompanyExt comp = companyService.load(userId, true); //company has the same Id as user;
      if(comp != null)
      {
        logger.info("User has already published translation service");
	model.addAttribute("title", "操作非法");
        model.addAttribute("err_msg", "你已经发布了翻译服务，不能重复发布。请删除后重新发布。");
        return "../../../err_info";
      }

      //create a new intance of CompanyExt; it will be passed to company/edit.jsp and it will be populated there.
      entityModel.setCompanyExt(new CompanyExt());
      model.addAttribute("entityModel",entityModel);
      return "/sys/company/edit";
    }
    else
    {
      logger.error("Cannot publish translation service because user_type ("+userExt.getuser_type()+") is invalid");
      model.addAttribute("title", "系统故障");
      model.addAttribute("err_msg", "未知错误导致用户类型非法（合法的用户类型为个人译员或翻译公司），不能发布翻译服务。");
      return "../../../err_info";
    }
  }

  @RequestMapping(value = "/user/doPublish")
  public String doPublish(@ModelAttribute UserModel entityModel, ModelMap model, HttpServletRequest request){
    UserExt userExt = userService.load(entityModel.getDataId(), true);

    entityModel.setOperationType("publish");

    Set<LanguageExt> languages = new TreeSet<LanguageExt>();
    Set<FieldExt> fields = new TreeSet<FieldExt>();
    Set<TranstypeExt> transtypes = new TreeSet<TranstypeExt>();
    Set<DoctypeExt> doctypes = new TreeSet<DoctypeExt>();
    if(userExt.getuser_type()==0 || userExt.getuser_type()==1) //user type is valid
    {
      //get languages selected by language checkbox
      String[] lang_ids = request.getParameterValues("langCheckbox");
      if(lang_ids != null)
      {
        for(String lang_id:lang_ids)
        {
          LanguageExt lang = new LanguageExt();
          lang.setId(Long.parseLong(lang_id));
          languages.add(lang);
        }
      }

      //get fields selected by field checkbox
      String[] field_ids = request.getParameterValues("fieldCheckbox");
      if(field_ids != null)
      {
        for(String field_id:field_ids)
        {
          FieldExt field = new FieldExt();
          field.setId(Long.parseLong(field_id));
          fields.add(field);
        }
      }

      //get transtypes slected by transtype checkbox
      String[] transtype_ids = request.getParameterValues("transtypeCheckbox");
      if(transtype_ids != null)
      {
        for(String transtype_id:transtype_ids)
        {
          TranstypeExt transtype = new TranstypeExt();
          transtype.setId(Long.parseLong(transtype_id));
          transtypes.add(transtype);
        }
      }

      //get doctypes selected by doctype checkbox
      String[] doctype_ids = request.getParameterValues("doctypeCheckbox");
      if(doctype_ids != null)
      {
        for(String doctype_id:doctype_ids)
        {
          DoctypeExt doctype = new DoctypeExt();
          doctype.setId(Long.parseLong(doctype_id));
          doctypes.add(doctype);
        }
      }

      if(userExt.getuser_type()==0) //自由译员
      {
        //get the IndividualExt instance created in goPublish() and populated with value in individual/edit.jsp;
        IndividualExt individualExt = entityModel.getIndividualExt();
         
        //individual has a one-to-one relationship with user, thus set the same 'id' with the related user; see
        //Individual.hbm.xml;
        individualExt.setId(userExt.getId());
  
        individualExt.setlanguages(languages);
        individualExt.setfields(fields);
        individualExt.settranstypes(transtypes);
        individualExt.setdoctypes(doctypes);
  
        //save the IndividualExt instance created in goPublish() and populated with value in individual/edit.jsp;
        individualService.create(individualExt);
  
        //pass userId to upload.jsp and then pass to doUploadFile();
        entityModel.setDataId(userExt.getId()); 
  
        entityModel.setFileType("photo"); //upload photo next;
  
        model.addAttribute("entityModel",entityModel);
  
        return "/sys/individual/upload";
      }
      else //翻译公司
      {
        //get the CompanyExt instance created in goPublish() and populated with value in company/edit.jsp;
        CompanyExt companyExt = entityModel.getCompanyExt();
         
        //company has a one-to-one relationship with user, thus set the same 'id' with the related user; see
        //Company.hbm.xml;
        companyExt.setId(userExt.getId());
  
        companyExt.setLanguages(languages);
        companyExt.setFields(fields);
        companyExt.setTranstypes(transtypes);
        companyExt.setDoctypes(doctypes);

        logger.info("create company with id: "+companyExt.getId());
  
        //save the CompanyExt instance created in goPublish() and populated with value in company/edit.jsp;
        companyService.create(companyExt);
  
        //pass userId to upload.jsp and then pass to doUploadFile();
        entityModel.setDataId(userExt.getId()); 
  
        entityModel.setFileType("logo"); //upload logo next;
  
        model.addAttribute("entityModel",entityModel);
  
        return "/sys/company/upload";
      }
    }
    else
    {
      logger.error("Failed to publish translation service because user_type ("+userExt.getuser_type()+") is invalid");
      model.addAttribute("title", "系统故障");
      model.addAttribute("err_msg", "未知错误导致用户类型非法（合法的用户类型为个人译员或翻译公司），不能发布翻译服务。");
      return "../../../err_info";
    }
  }

  //Yuanguo: we want to receive uploaded file by HttpServletRequest, thus we use this kind of controller which 
  //takes request and response as parameters;
  @RequestMapping(value = "/user/doUploadFile")
  public String doUploadFile(HttpServletRequest request, HttpServletResponse response)
  {
    Long userId = Long.parseLong(request.getParameter("dataId"));

    if( userId == 0){
      logger.error("DataId ("+userId+") is invalid");
      request.setAttribute("title", "系统故障");
      request.setAttribute("err_msg", "用户ID非法，不能上传文件。");
      return "../../../err_info";
    }

    UserExt userExt = userService.load(userId, true);
    if(userExt == null)
    {
      logger.error("Failed to load user by ID:"+userId);
      request.setAttribute("title", "系统故障");
      request.setAttribute("err_msg", "加载用户失败，不能上传文件。");
      return "../../../err_info";
    }

    String fileType = request.getParameter("fileType");
    int skip = Integer.parseInt(request.getParameter("skip"));

    logger.debug("userId="+userId+", fileType="+fileType+", skip="+skip);

    UserModel entityModel = new UserModel();
    entityModel.setDataId(userId); 

    entityModel.setOperationType("publish");

    if(userExt.getuser_type() == 0) //个人译员
    {
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
        view = "forward:/user/query";
      }
      else
      {
        logger.error("fileType("+fileType+") is invalid, will skip upload the file");
        skip = 1;

        request.setAttribute("title", "系统故障"); 
        request.setAttribute("err_msg", "未知错误导致所上传的文件类型非法，不能上传文件。");
        view = "../../../err_info";
      }

      if(skip == 0)
      {
        logger.info("Receiving " + fileType);

        String localPath = "/ybstore/individual/"+userId+"/"+fileType;
        String filePath = configService.getProperty("docBase")+localPath;

        //Yuanguo: add a number to the suffix of image file; the number will be updated with system time in 
        //milli seconds every time a new image is uploaded; why?
        //Because, if we don't add the number, when the image is updated, the "src" in <img src="..."/> is 
        //not updated, as a result, the browser will use the cached image instead of reloading the new one. 
        //Someone on internet gave another solution: 
        //     append "?t=Math.random()" to src.
        //however, it will force a reload every time;
        ReceivedData receivedData = UploadUtil.receive(request, true, false, filePath, ".0");
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

          IndividualExt individual = individualService.load(userId, true);

          if(fileType.equals("photo"))
          {
            //generate a large photo and a small photo
            //ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), Integer.parseInt(configService.getProperty("photo.small.width")), 1f);
            //ImageUtil.resize(rawFile, new File(filePath+"/large"+suffix), Integer.parseInt(configService.getProperty("photo.large.width")), 1f);

            individual.setphoto(localPath+"/raw"+suffix);
          }
          else if(fileType.equals("language_cert"))
          {
            //ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), 200, 1f);
            individual.setlangcert(localPath+"/raw"+suffix);
          }
          else if(fileType.equals("translation_cert"))
          {
            //ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), 200, 1f);
            individual.settranscert(localPath+"/raw"+suffix);
          }
          else if(fileType.equals("profession_cert"))
          {
            //ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), 200, 1f);
            individual.setprofcert(localPath+"/raw"+suffix);
          }
          else if(fileType.equals("authentication_file"))
          {
            //ImageUtil.resize(rawFile, new File(filePath+"/small"+suffix), 200, 1f);
            individual.setauthfile(localPath+"/raw"+suffix);
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
      else
      {
        logger.info("Skip uploading " + fileType);
      }

      request.setAttribute("entityModel",entityModel); //this is the same as model.addAttribute("entityModel",entityModel);
      return view;
    }
    else if(userExt.getuser_type()==1) //翻译公司
    {
      String view;
      if(fileType.equals("logo"))
      {
        entityModel.setFileType("authentication_file"); //upload authentication_file next;
        view = "/sys/company/upload";
      }
      else if(fileType.equals("authentication_file"))
      {
        view = "forward:/user/query";
      }
      else
      {
        logger.error("fileType("+fileType+") is invalid, will skip upload the file");
        skip = 1;

        request.setAttribute("title", "系统故障"); 
        request.setAttribute("err_msg", "未知错误导致所上传的文件类型非法，不能上传文件。");
        view = "../../../err_info";
      }

      if(skip == 0)
      {
        logger.info("Receiving " + fileType);

        String localPath = "/ybstore/company/"+userId+"/"+fileType;
        String filePath = configService.getProperty("docBase")+localPath;

        //Yuanguo: add a number to the suffix of image file;
        ReceivedData receivedData = UploadUtil.receive(request, true, false, filePath, ".0");
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

          CompanyExt company = companyService.load(userId, true);

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
      else
      {
        logger.info("Skip uploading " + fileType);
      }

      request.setAttribute("entityModel",entityModel); //this is the same as model.addAttribute("entityModel",entityModel);
      return view;
    }
    else
    {
      logger.error("Fail to upload file because user_type ("+userExt.getuser_type()+") is invalid");
      request.setAttribute("title", "系统故障");
      request.setAttribute("err_msg", "未知错误导致用户类型非法（合法的用户类型为个人译员或翻译公司），不能上传文件。");
      return "../../../err_info";
    }
  }

  private static void generateConditions(List<ICondition> condList, UserExt queryCon)
  {
    condList.add(new NeCondition("user_type",new Long(2L)));
    condList.add(new NeCondition("user_type",new Long(3L)));
    if(queryCon!=null)
    {
    }
  }
}
