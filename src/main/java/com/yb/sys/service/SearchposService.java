package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.dao.SearchposDao;
import com.yb.sys.entity.SearchposExt;

public class SearchposService implements ISearchposService{

	private SearchposDao searchposDao;
	
	public SearchposDao getSearchposDao() {
		return searchposDao;
	}

	public void setSearchposDao(SearchposDao searchposDao) {
		this.searchposDao = searchposDao;
	}

	public SearchposExt load(final Long id, boolean useCache)
	{
		return searchposDao.load(id, useCache);
	}

	public SearchposExt create(final SearchposExt searchposExt)
	{
		return searchposDao.create(searchposExt);
	}

	public SearchposExt save(SearchposExt searchposExt)
	{
		return searchposDao.save(searchposExt);
	}

	public void update(SearchposExt searchposExt)
	{
		searchposDao.update(searchposExt);
	}

	public void delete(Long id)
	{
		searchposDao.delete(id);
	}

	public void delete(SearchposExt searchposExt)
	{
		searchposDao.delete(searchposExt);
	}

	public List<SearchposExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return searchposDao.criteriaQuery(conditions);
	}

	public List<SearchposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return searchposDao.criteriaQuery(conditions, orders);
	}

	public List<SearchposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return searchposDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return searchposDao.criteriaQueryCount(conditions);
	}

}
