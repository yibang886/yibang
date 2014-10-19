package com.yb.sys.entity;

import java.io.Serializable;

public class Company implements Serializable
{
  private static final long serialVersionUID = 1L;

  private Long id;
  
  public Long getId() 
  {
    return id;
  }

  public void setId(Long id) 
  {
    this.id = id;
  }
  
  private String name;
  
  public String getName()
  {
    return name;
  }
  
  public void setName(String name)
  {
    this.name = name;
  }
  private Long city_id;
  
  public Long getCity_id()
  {
    return city_id;
  }
  
  public void setCity_id(Long city_id)
  {
    this.city_id = city_id;
  }
  private String address;
  
  public String getAddress()
  {
    return address;
  }
  
  public void setAddress(String address)
  {
    this.address = address;
  }
  private String website;
  
  public String getWebsite()
  {
    return website;
  }
  
  public void setWebsite(String website)
  {
    this.website = website;
  }
  private String inroduct;
  
  public String getInroduct()
  {
    return inroduct;
  }
  
  public void setInroduct(String inroduct)
  {
    this.inroduct = inroduct;
  }
  private String logo_suffix;
  
  public String getLogo_suffix()
  {
    return logo_suffix;
  }
  
  public void setLogo_suffix(String logo_suffix)
  {
    this.logo_suffix = logo_suffix;
  }
  private String authfile_suffix;
  
  public String getAuthfile_suffix()
  {
    return authfile_suffix;
  }
  
  public void setAuthfile_suffix(String authfile_suffix)
  {
    this.authfile_suffix = authfile_suffix;
  }
  private Long auth_pass;
  
  public Long getAuth_pass()
  {
    return auth_pass;
  }
  
  public void setAuth_pass(Long auth_pass)
  {
    this.auth_pass = auth_pass;
  }
  private Long valid_pass;
  
  public Long getValid_pass()
  {
    return valid_pass;
  }
  
  public void setValid_pass(Long valid_pass)
  {
    this.valid_pass = valid_pass;
  }
  private Long recompos_id;
  
  public Long getRecompos_id()
  {
    return recompos_id;
  }
  
  public void setRecompos_id(Long recompos_id)
  {
    this.recompos_id = recompos_id;
  }

  public boolean equals(Object object)
  {
    if (this == object)
    {
        return true;
    }
    if (!(object instanceof Company))
    {
        return false;
    }
    final Company that = (Company)object;
    if (this.id == null || that.getId() == null || !this.id.equals(that.getId()))
    {
        return false;
    }
    return true;
  }
  
  public int hashCode() 
  {
    int hashCode = 0;
    hashCode = 29 * hashCode + (id == null ? 0 : id.hashCode());
    return hashCode;
  }
  
  public String toString() 
  {
    try
    {
      return org.apache.commons.lang3.builder.ReflectionToStringBuilder.toString(this);
    } 
    catch (Exception e)
    {
      return "";
    }
  }
  
  public Company cloneCompany ()
  {
    Company newObj = null;
    try
    {
        newObj = (Company)org.apache.commons.beanutils.BeanUtils.cloneBean(this);            
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
