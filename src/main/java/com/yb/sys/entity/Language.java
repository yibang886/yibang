package com.yb.sys.entity;

import java.util.Set;
import java.util.TreeSet;

import java.io.Serializable;

import java.lang.Comparable;

import com.yb.sys.entity.IndividualExt;

public class Language implements Serializable, Comparable<Language>{

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
	
	private String language;
	
	public String getlanguage(){
		return language;
	}
	
	public void setlanguage(String language){
		this.language = language;
	}

  private Set<IndividualExt> individuals = new TreeSet<IndividualExt>();
  public void addindividual (IndividualExt individual)
  {
    this.individuals.add(individual);
  }
  public Set<IndividualExt> getindividuals()
  {
    return this.individuals;
  }
  public void setindividuals(Set<IndividualExt> individuals)
  {
    this.individuals = individuals;
  }

	public boolean equals(Object object)
    {
        if (this == object)
        {
            return true;
        }
        if (!(object instanceof Language))
        {
            return false;
        }
        final Language that = (Language)object;
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
	
	public Language cloneLanguage (){
        
		Language newObj = null;
        try
        {
            newObj = (Language)org.apache.commons.beanutils.BeanUtils.cloneBean(this);            
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

  public int compareTo(Language other)
  {
    if(id<other.id)
      return -1;
    if(id>other.id)
      return 1;
    return 0;
  }

}
