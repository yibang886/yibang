package com.yb.sys.entity;

import java.util.Set;
import java.util.TreeSet;
import java.io.Serializable;
import java.lang.Comparable;

public class Doctype implements Serializable, Comparable<Doctype>{

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

  private Set<CompanyExt> companies = new TreeSet<CompanyExt>();
  public void addcompany(CompanyExt company)
  {
    this.companies.add(company);
  }
  public Set<CompanyExt> getcompanies()
  {
    return this.companies;
  }
  public void setcompanies(Set<CompanyExt> companies)
  {
    this.companies = companies;
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

  public int compareTo(Doctype other)
  {
    if(id<other.id)
      return -1;
    if(id>other.id)
      return 1;
    return 0;
  }
}
