package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.dao.FieldDao;
import com.yb.sys.entity.FieldExt;

public class FieldService implements IFieldService{

	private FieldDao fieldDao;
	
	public FieldDao getFieldDao() {
		return fieldDao;
	}

	public void setFieldDao(FieldDao fieldDao) {
		this.fieldDao = fieldDao;
	}

	public FieldExt load(final Long id, boolean useCache)
	{
		return fieldDao.load(id, useCache);
	}

	public FieldExt create(final FieldExt fieldExt)
	{
		return fieldDao.create(fieldExt);
	}

	public FieldExt save(FieldExt fieldExt)
	{
		return fieldDao.save(fieldExt);
	}

	public void update(FieldExt fieldExt)
	{
		fieldDao.update(fieldExt);
	}

	public void delete(Long id)
	{
		fieldDao.delete(id);
	}

	public void delete(FieldExt fieldExt)
	{
		fieldDao.delete(fieldExt);
	}

	public List<FieldExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return fieldDao.criteriaQuery(conditions);
	}

	public List<FieldExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return fieldDao.criteriaQuery(conditions, orders);
	}

	public List<FieldExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return fieldDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return fieldDao.criteriaQueryCount(conditions);
	}

}
