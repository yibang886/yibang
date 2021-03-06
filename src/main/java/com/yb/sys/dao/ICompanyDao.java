package com.yb.sys.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.common.hibernate.AssocCriteria;
import com.yb.sys.entity.CompanyExt;

public interface ICompanyDao {
	
	public CompanyExt load(final Long id, boolean useCache);

	public CompanyExt create(final com.yb.sys.entity.CompanyExt companyExt);

	public CompanyExt save(com.yb.sys.entity.CompanyExt companyExt);

	public void update(CompanyExt companyExt);

	public void delete(Long id);

	public void delete(CompanyExt companyExt);

	public List<CompanyExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<CompanyExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<CompanyExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);
	public List<CompanyExt> criteriaQuery(
      final Collection<ICondition> conditions, 
      final Collection<Order> orders, 
      final List<AssocCriteria> assocCriterias,
      final int currpage, 
      final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);

}
