package com.yb.sys.entity;

import java.io.Serializable;

public class Doctype implements Serializable{

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
	
	private String doctype;
	
	public String getdoctype(){
		return doctype;
	}
	
	public void setdoctype(String doctype){
		this.doctype = doctype;
	}

	public boolean equals(Object object)
    {
        if (this == object)
        {
            return true;
        }
        if (!(object instanceof Doctype))
        {
            return false;
        }
        final Doctype that = (Doctype)object;
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
	
	public Doctype cloneDoctype (){
        
		Doctype newObj = null;
        try
        {
            newObj = (Doctype)org.apache.commons.beanutils.BeanUtils.cloneBean(this);            
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