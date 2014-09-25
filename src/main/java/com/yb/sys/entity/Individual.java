package com.yb.sys.entity;

import java.io.Serializable;
import com.yb.sys.entity.UserExt;

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
	private Long edu_id;
	
	public Long getedu_id(){
		return edu_id;
	}
	
	public void setedu_id(Long edu_id){
		this.edu_id = edu_id;
	}
	private Long sch_id;
	
	public Long getsch_id(){
		return sch_id;
	}
	
	public void setsch_id(Long sch_id){
		this.sch_id = sch_id;
	}
	private Long birth_year;
	
	public Long getbirth_year(){
		return birth_year;
	}
	
	public void setbirth_year(Long birth_year){
		this.birth_year = birth_year;
	}
	private Long city_id;
	
	public Long getcity_id(){
		return city_id;
	}
	
	public void setcity_id(Long city_id){
		this.city_id = city_id;
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
	private String lang_cert;
	
	public String getlang_cert(){
		return lang_cert;
	}
	
	public void setlang_cert(String lang_cert){
		this.lang_cert = lang_cert;
	}
	private String trans_cert;
	
	public String gettrans_cert(){
		return trans_cert;
	}
	
	public void settrans_cert(String trans_cert){
		this.trans_cert = trans_cert;
	}
	private String prof_cert;
	
	public String getprof_cert(){
		return prof_cert;
	}
	
	public void setprof_cert(String prof_cert){
		this.prof_cert = prof_cert;
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
	private String auth_file;
	
	public String getauth_file(){
		return auth_file;
	}
	
	public void setauth_file(String auth_file){
		this.auth_file = auth_file;
	}
	private Long auth_pass;
	
	public Long getauth_pass(){
		return auth_pass;
	}
	
	public void setauth_pass(Long auth_pass){
		this.auth_pass = auth_pass;
	}
	private Long recompos_id;
	
	public Long getrecompos_id(){
		return recompos_id;
	}
	
	public void setrecompos_id(Long recompos_id){
		this.recompos_id = recompos_id;
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
