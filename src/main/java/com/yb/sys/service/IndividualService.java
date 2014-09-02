package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.dao.IndividualDao;
import com.yb.sys.entity.IndividualExt;

public class IndividualService implements IIndividualService{

	private IndividualDao individualDao;
	
	public IndividualDao getIndividualDao() {
		return individualDao;
	}

	public void setIndividualDao(IndividualDao individualDao) {
		this.individualDao = individualDao;
	}

	public IndividualExt load(final Long id, boolean useCache)
	{
		return individualDao.load(id, useCache);
	}

	public IndividualExt create(final IndividualExt individualExt)
	{
		return individualDao.create(individualExt);
	}

	public IndividualExt save(IndividualExt individualExt)
	{
		return individualDao.save(individualExt);
	}

	public void update(IndividualExt individualExt)
	{
		individualDao.update(individualExt);
	}

	public void delete(Long id)
	{
		individualDao.delete(id);
	}

	public void delete(IndividualExt individualExt)
	{
		individualDao.delete(individualExt);
	}

	public List<IndividualExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return individualDao.criteriaQuery(conditions);
	}

	public List<IndividualExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return individualDao.criteriaQuery(conditions, orders);
	}

	public List<IndividualExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return individualDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return individualDao.criteriaQueryCount(conditions);
	}

}
