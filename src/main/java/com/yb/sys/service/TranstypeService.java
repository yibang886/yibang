package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.dao.TranstypeDao;
import com.yb.sys.entity.TranstypeExt;

public class TranstypeService implements ITranstypeService{

	private TranstypeDao transtypeDao;
	
	public TranstypeDao getTranstypeDao() {
		return transtypeDao;
	}

	public void setTranstypeDao(TranstypeDao transtypeDao) {
		this.transtypeDao = transtypeDao;
	}

	public TranstypeExt load(final Long id, boolean useCache)
	{
		return transtypeDao.load(id, useCache);
	}

	public TranstypeExt create(final TranstypeExt transtypeExt)
	{
		return transtypeDao.create(transtypeExt);
	}

	public TranstypeExt save(TranstypeExt transtypeExt)
	{
		return transtypeDao.save(transtypeExt);
	}

	public void update(TranstypeExt transtypeExt)
	{
		transtypeDao.update(transtypeExt);
	}

	public void delete(Long id)
	{
		transtypeDao.delete(id);
	}

	public void delete(TranstypeExt transtypeExt)
	{
		transtypeDao.delete(transtypeExt);
	}

	public List<TranstypeExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return transtypeDao.criteriaQuery(conditions);
	}

	public List<TranstypeExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return transtypeDao.criteriaQuery(conditions, orders);
	}

	public List<TranstypeExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return transtypeDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return transtypeDao.criteriaQueryCount(conditions);
	}

}
