package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.dao.CityDao;
import com.yb.sys.entity.CityExt;

public class CityService implements ICityService{

	private CityDao cityDao;
	
	public CityDao getCityDao() {
		return cityDao;
	}

	public void setCityDao(CityDao cityDao) {
		this.cityDao = cityDao;
	}

	public CityExt load(final Long id, boolean useCache)
	{
		return cityDao.load(id, useCache);
	}

	public CityExt create(final CityExt cityExt)
	{
		return cityDao.create(cityExt);
	}

	public CityExt save(CityExt cityExt)
	{
		return cityDao.save(cityExt);
	}

	public void update(CityExt cityExt)
	{
		cityDao.update(cityExt);
	}

	public void delete(Long id)
	{
		cityDao.delete(id);
	}

	public void delete(CityExt cityExt)
	{
		cityDao.delete(cityExt);
	}

	public List<CityExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return cityDao.criteriaQuery(conditions);
	}

	public List<CityExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return cityDao.criteriaQuery(conditions, orders);
	}

	public List<CityExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return cityDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return cityDao.criteriaQueryCount(conditions);
	}

}
