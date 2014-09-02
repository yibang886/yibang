package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.dao.SchoolDao;
import com.yb.sys.entity.SchoolExt;

public class SchoolService implements ISchoolService{

	private SchoolDao schoolDao;
	
	public SchoolDao getSchoolDao() {
		return schoolDao;
	}

	public void setSchoolDao(SchoolDao schoolDao) {
		this.schoolDao = schoolDao;
	}

	public SchoolExt load(final Long id, boolean useCache)
	{
		return schoolDao.load(id, useCache);
	}

	public SchoolExt create(final SchoolExt schoolExt)
	{
		return schoolDao.create(schoolExt);
	}

	public SchoolExt save(SchoolExt schoolExt)
	{
		return schoolDao.save(schoolExt);
	}

	public void update(SchoolExt schoolExt)
	{
		schoolDao.update(schoolExt);
	}

	public void delete(Long id)
	{
		schoolDao.delete(id);
	}

	public void delete(SchoolExt schoolExt)
	{
		schoolDao.delete(schoolExt);
	}

	public List<SchoolExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return schoolDao.criteriaQuery(conditions);
	}

	public List<SchoolExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return schoolDao.criteriaQuery(conditions, orders);
	}

	public List<SchoolExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return schoolDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return schoolDao.criteriaQueryCount(conditions);
	}

}
