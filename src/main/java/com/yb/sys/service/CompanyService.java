package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.common.hibernate.AssocCriteria;
import com.yb.sys.dao.CompanyDao;
import com.yb.sys.entity.CompanyExt;

public class CompanyService implements ICompanyService{

	private CompanyDao companyDao;
	
	public CompanyDao getCompanyDao() {
		return companyDao;
	}

	public void setCompanyDao(CompanyDao companyDao) {
		this.companyDao = companyDao;
	}

	public CompanyExt load(final Long id, boolean useCache)
	{
		return companyDao.load(id, useCache);
	}

	public CompanyExt create(final CompanyExt companyExt)
	{
		return companyDao.create(companyExt);
	}

	public CompanyExt save(CompanyExt companyExt)
	{
		return companyDao.save(companyExt);
	}

	public void update(CompanyExt companyExt)
	{
		companyDao.update(companyExt);
	}

	public void delete(Long id)
	{
		companyDao.delete(id);
	}

	public void delete(CompanyExt companyExt)
	{
		companyDao.delete(companyExt);
	}

	public List<CompanyExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return companyDao.criteriaQuery(conditions);
	}

	public List<CompanyExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return companyDao.criteriaQuery(conditions, orders);
	}

	public List<CompanyExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return companyDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public List<CompanyExt> criteriaQuery(
      final Collection<ICondition> conditions, 
      final Collection<Order> orders, 
      final List<AssocCriteria> assocCriterias,
      final int currpage, 
      final int pagesize)
  {
    return companyDao.criteriaQuery(conditions, orders, assocCriterias, currpage, pagesize);
  }

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return companyDao.criteriaQueryCount(conditions);
	}

}
