package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.dao.MainposDao;
import com.yb.sys.entity.MainposExt;

public class MainposService implements IMainposService{

	private MainposDao mainposDao;
	
	public MainposDao getMainposDao() {
		return mainposDao;
	}

	public void setMainposDao(MainposDao mainposDao) {
		this.mainposDao = mainposDao;
	}

	public MainposExt load(final Long id, boolean useCache)
	{
		return mainposDao.load(id, useCache);
	}

	public MainposExt create(final MainposExt mainposExt)
	{
		return mainposDao.create(mainposExt);
	}

	public MainposExt save(MainposExt mainposExt)
	{
		return mainposDao.save(mainposExt);
	}

	public void update(MainposExt mainposExt)
	{
		mainposDao.update(mainposExt);
	}

	public void delete(Long id)
	{
		mainposDao.delete(id);
	}

	public void delete(MainposExt mainposExt)
	{
		mainposDao.delete(mainposExt);
	}

	public List<MainposExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return mainposDao.criteriaQuery(conditions);
	}

	public List<MainposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return mainposDao.criteriaQuery(conditions, orders);
	}

	public List<MainposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return mainposDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return mainposDao.criteriaQueryCount(conditions);
	}

}
