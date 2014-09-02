package com.yb.sys.entity;

import java.io.Serializable;

public class Mainpos implements Serializable{

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
	
	private String mainpos;
	
	public String getmainpos(){
		return mainpos;
	}
	
	public void setmainpos(String mainpos){
		this.mainpos = mainpos;
	}

	public boolean equals(Object object)
    {
        if (this == object)
        {
            return true;
        }
        if (!(object instanceof Mainpos))
        {
            return false;
        }
        final Mainpos that = (Mainpos)object;
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
	
	public Mainpos cloneMainpos (){
        
		Mainpos newObj = null;
        try
        {
            newObj = (Mainpos)org.apache.commons.beanutils.BeanUtils.cloneBean(this);            
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