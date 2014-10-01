package com.yb.sys.entity;

import java.io.Serializable;

import com.yb.sys.entity.IndividualExt;

public class User implements Serializable{

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

  private IndividualExt individual; 
	
	public IndividualExt getindividual(){
		return individual;
	}
	
	public void setindividual(IndividualExt individual){
		this.individual = individual;
	}
	
	private String email;
	
	public String getemail(){
		return email;
	}
	
	public void setemail(String email){
		this.email = email;
	}
	private String password;
	
	public String getpassword(){
		return password;
	}
	
	public void setpassword(String password){
		this.password = password;
	}
	private String tel;
	
	public String gettel(){
		return tel;
	}
	
	public void settel(String tel){
		this.tel = tel;
	}
	private String mobile;
	
	public String getmobile(){
		return mobile;
	}
	
	public void setmobile(String mobile){
		this.mobile = mobile;
	}
	private String fax;
	
	public String getfax(){
		return fax;
	}
	
	public void setfax(String fax){
		this.fax = fax;
	}
	private String qq;
	
	public String getqq(){
		return qq;
	}
	
	public void setqq(String qq){
		this.qq = qq;
	}
	private String weixin;
	
	public String getweixin(){
		return weixin;
	}
	
	public void setweixin(String weixin){
		this.weixin = weixin;
	}

  private Long user_type;

  public Long getuser_type()
  {
    return user_type;
  }
  public void setuser_type(Long user_type)
  {
    this.user_type = user_type;
  }

	private Long coin;
	
	public Long getcoin(){
		return coin;
	}
	
	public void setcoin(Long coin){
		this.coin = coin;
	}

	public boolean equals(Object object)
    {
        if (this == object)
        {
            return true;
        }
        if (!(object instanceof User))
        {
            return false;
        }
        final User that = (User)object;
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
	
	public User cloneUser (){
        
		User newObj = null;
        try
        {
            newObj = (User)org.apache.commons.beanutils.BeanUtils.cloneBean(this);            
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
