package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.dao.RecomposDao;
import com.yb.sys.entity.RecomposExt;

public class RecomposService implements IRecomposService{

	private RecomposDao recomposDao;
	
	public RecomposDao getRecomposDao() {
		return recomposDao;
	}

	public void setRecomposDao(RecomposDao recomposDao) {
		this.recomposDao = recomposDao;
	}

	public RecomposExt load(final Long id, boolean useCache)
	{
		return recomposDao.load(id, useCache);
	}

	public RecomposExt create(final RecomposExt recomposExt)
	{
		return recomposDao.create(recomposExt);
	}

	public RecomposExt save(RecomposExt recomposExt)
	{
		return recomposDao.save(recomposExt);
	}

	public void update(RecomposExt recomposExt)
	{
		recomposDao.update(recomposExt);
	}

	public void delete(Long id)
	{
		recomposDao.delete(id);
	}

	public void delete(RecomposExt recomposExt)
	{
		recomposDao.delete(recomposExt);
	}

	public List<RecomposExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return recomposDao.criteriaQuery(conditions);
	}

	public List<RecomposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return recomposDao.criteriaQuery(conditions, orders);
	}

	public List<RecomposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return recomposDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return recomposDao.criteriaQueryCount(conditions);
	}

}
