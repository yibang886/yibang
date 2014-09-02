package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.dao.DoctypeDao;
import com.yb.sys.entity.DoctypeExt;

public class DoctypeService implements IDoctypeService{

	private DoctypeDao doctypeDao;
	
	public DoctypeDao getDoctypeDao() {
		return doctypeDao;
	}

	public void setDoctypeDao(DoctypeDao doctypeDao) {
		this.doctypeDao = doctypeDao;
	}

	public DoctypeExt load(final Long id, boolean useCache)
	{
		return doctypeDao.load(id, useCache);
	}

	public DoctypeExt create(final DoctypeExt doctypeExt)
	{
		return doctypeDao.create(doctypeExt);
	}

	public DoctypeExt save(DoctypeExt doctypeExt)
	{
		return doctypeDao.save(doctypeExt);
	}

	public void update(DoctypeExt doctypeExt)
	{
		doctypeDao.update(doctypeExt);
	}

	public void delete(Long id)
	{
		doctypeDao.delete(id);
	}

	public void delete(DoctypeExt doctypeExt)
	{
		doctypeDao.delete(doctypeExt);
	}

	public List<DoctypeExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return doctypeDao.criteriaQuery(conditions);
	}

	public List<DoctypeExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return doctypeDao.criteriaQuery(conditions, orders);
	}

	public List<DoctypeExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return doctypeDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return doctypeDao.criteriaQueryCount(conditions);
	}

}
