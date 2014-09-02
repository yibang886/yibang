package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.dao.EducationDao;
import com.yb.sys.entity.EducationExt;

public class EducationService implements IEducationService{

	private EducationDao educationDao;
	
	public EducationDao getEducationDao() {
		return educationDao;
	}

	public void setEducationDao(EducationDao educationDao) {
		this.educationDao = educationDao;
	}

	public EducationExt load(final Long id, boolean useCache)
	{
		return educationDao.load(id, useCache);
	}

	public EducationExt create(final EducationExt educationExt)
	{
		return educationDao.create(educationExt);
	}

	public EducationExt save(EducationExt educationExt)
	{
		return educationDao.save(educationExt);
	}

	public void update(EducationExt educationExt)
	{
		educationDao.update(educationExt);
	}

	public void delete(Long id)
	{
		educationDao.delete(id);
	}

	public void delete(EducationExt educationExt)
	{
		educationDao.delete(educationExt);
	}

	public List<EducationExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return educationDao.criteriaQuery(conditions);
	}

	public List<EducationExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return educationDao.criteriaQuery(conditions, orders);
	}

	public List<EducationExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return educationDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return educationDao.criteriaQueryCount(conditions);
	}

}
