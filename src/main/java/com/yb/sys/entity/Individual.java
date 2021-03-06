package com.yb.sys.entity;

import java.util.Set;
import java.util.TreeSet;

import java.io.Serializable;
import com.yb.sys.entity.UserExt;
import com.yb.sys.entity.LanguageExt;
import com.yb.sys.entity.TranstypeExt;
import com.yb.sys.entity.FieldExt;
import com.yb.sys.entity.DoctypeExt;
import com.yb.sys.entity.EducationExt;
import com.yb.sys.entity.SchoolExt;
import com.yb.sys.entity.CityExt;
import com.yb.sys.entity.SchoolExt;
import com.yb.sys.entity.RecomposExt;

public class Individual implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long id;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
  private UserExt user; 
	
	public UserExt getuser(){
		return user;
	}
	
	public void setuser(UserExt user){
		this.user = user;
	}

	private String name;
	
	public String getname(){
		return name;
	}
	
	public void setname(String name){
		this.name = name;
	}
	private Long gender;
	
	public Long getgender(){
		return gender;
	}
	
	public void setgender(Long gender){
		this.gender = gender;
	}

  /*
	private Long edu_id;
	
	public Long getedu_id(){
		return edu_id;
	}
	
	public void setedu_id(Long edu_id){
		this.edu_id = edu_id;
	}
  */

  private EducationExt education;
  public EducationExt geteducation()
  {
    return education;
  }
  public void seteducation(EducationExt education)
  {
    this.education = education;
  }

  /*
	private Long sch_id;
	
	public Long getsch_id(){
		return sch_id;
	}
	
	public void setsch_id(Long sch_id){
		this.sch_id = sch_id;
	}
  */

  private SchoolExt school;
  public SchoolExt getschool()
  {
    return school;
  }
  public void setschool(SchoolExt school)
  {
    this.school = school;
  }

	private Long birth_year;
	
	public Long getbirth_year(){
		return birth_year;
	}
	
	public void setbirth_year(Long birth_year){
		this.birth_year = birth_year;
	}

  private CityExt city;
  public CityExt getcity()
  {
    return city;
  }
  public void setcity(CityExt city)
  {
    this.city =city;
  }

	private String mainpage;
	
	public String getmainpage(){
		return mainpage;
	}
	
	public void setmainpage(String mainpage){
		this.mainpage = mainpage;
	}
	private Long workstyle;
	
	public Long getworkstyle(){
		return workstyle;
	}
	
	public void setworkstyle(Long workstyle){
		this.workstyle = workstyle;
	}
	private String langcert;
	
	public String getlangcert(){
		return langcert;
	}
	
	public void setlangcert(String langcert){
		this.langcert = langcert;
	}
	private String transcert;
	
	public String gettranscert(){
		return transcert;
	}
	
	public void settranscert(String transcert){
		this.transcert = transcert;
	}
	private String profcert;
	
	public String getprofcert(){
		return profcert;
	}
	
	public void setprofcert(String profcert){
		this.profcert = profcert;
	}
	private Long exp_year;
	
	public Long getexp_year(){
		return exp_year;
	}
	
	public void setexp_year(Long exp_year){
		this.exp_year = exp_year;
	}
	private Long exp_trans;
	
	public Long getexp_trans(){
		return exp_trans;
	}
	
	public void setexp_trans(Long exp_trans){
		this.exp_trans = exp_trans;
	}
	private String works;
	
	public String getworks(){
		return works;
	}
	
	public void setworks(String works){
		this.works = works;
	}
	private String introduct;
	
	public String getintroduct(){
		return introduct;
	}
	
	public void setintroduct(String introduct){
		this.introduct = introduct;
	}
	private String photo;
	
	public String getphoto(){
		return photo;
	}
	
	public void setphoto(String photo){
		this.photo = photo;
	}
	private String authfile;
	
	public String getauthfile(){
		return authfile;
	}
	
	public void setauthfile(String authfile){
		this.authfile = authfile;
	}
	private Long auth_pass;
	
	public Long getauth_pass(){
		return auth_pass;
	}
	
	public void setauth_pass(Long auth_pass){
		this.auth_pass = auth_pass;
	}

  private Long valid_pass;
  public Long getvalid_pass()
  {
    return valid_pass;
  }
  public void setvalid_pass(Long valid_pass)
  {
    this.valid_pass = valid_pass;
  }
  
  private RecomposExt recompos;
  public RecomposExt getrecompos()
  {
    return recompos;
  }
  public void setrecompos(RecomposExt recompos)
  {
    this.recompos = recompos;
  }

  private Set<LanguageExt> languages = new TreeSet<LanguageExt>();
  public void addlanguage (LanguageExt language)
  {
    this.languages.add(language);
  }
  public Set<LanguageExt> getlanguages()
  {
    return this.languages;
  }
  public void setlanguages (Set<LanguageExt> languages)
  {
    this.languages = languages;
  }

  private Set<TranstypeExt> transtypes = new TreeSet<TranstypeExt>();
  public void addtranstype (TranstypeExt transtype)
  {
    this.transtypes.add(transtype);
  }
  public Set<TranstypeExt> gettranstypes()
  {
    return this.transtypes;
  }
  public void settranstypes (Set<TranstypeExt> transtypes)
  {
    this.transtypes = transtypes;
  }

  private Set<FieldExt> fields = new TreeSet<FieldExt>();
  public void addfield (FieldExt field)
  {
    this.fields.add(field);
  }
  public Set<FieldExt> getfields()
  {
    return this.fields;
  }
  public void setfields (Set<FieldExt> fields)
  {
    this.fields = fields;
  }

  private Set<DoctypeExt> doctypes = new TreeSet<DoctypeExt>();
  public void adddoctype (DoctypeExt doctype)
  {
    this.doctypes.add(doctype);
  }
  public Set<DoctypeExt> getdoctypes()
  {
    return this.doctypes;
  }
  public void setdoctypes (Set<DoctypeExt> doctypes)
  {
    this.doctypes = doctypes;
  }


	public boolean equals(Object object)
    {
        if (this == object)
        {
            return true;
        }
        if (!(object instanceof Individual))
        {
            return false;
        }
        final Individual that = (Individual)object;
        if (this.id == null || that.getId() == null || !this.id.equals(that.getId()))
        {
            return false;
        }
        return true;
    }
	
	public int hashCode() {
		int hashCode = 0;
		hashCode = 29 * hashCode + (id == null ? 0 : id.hashCode());
		return hashCode;
	}
	
	public String toString() {
		try {
			return org.apache.commons.lang3.builder.ReflectionToStringBuilder.toString(this);
		} catch (Exception e) {
			return "";
		}

	}
	
	public Individual cloneIndividual (){
        
		Individual newObj = null;
        try
        {
            newObj = (Individual)org.apache.commons.beanutils.BeanUtils.cloneBean(this);            
        } catch (IllegalAccessException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InstantiationException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (java.lang.reflect.InvocationTargetException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (NoSuchMethodException e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return newObj;
	}
}
