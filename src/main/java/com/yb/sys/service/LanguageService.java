package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.dao.LanguageDao;
import com.yb.sys.entity.LanguageExt;

public class LanguageService implements ILanguageService{

	private LanguageDao languageDao;
	
	public LanguageDao getLanguageDao() {
		return languageDao;
	}

	public void setLanguageDao(LanguageDao languageDao) {
		this.languageDao = languageDao;
	}

	public LanguageExt load(final Long id, boolean useCache)
	{
		return languageDao.load(id, useCache);
	}

	public LanguageExt create(final LanguageExt languageExt)
	{
		return languageDao.create(languageExt);
	}

	public LanguageExt save(LanguageExt languageExt)
	{
		return languageDao.save(languageExt);
	}

	public void update(LanguageExt languageExt)
	{
		languageDao.update(languageExt);
	}

	public void delete(Long id)
	{
		languageDao.delete(id);
	}

	public void delete(LanguageExt languageExt)
	{
		languageDao.delete(languageExt);
	}

	public List<LanguageExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return languageDao.criteriaQuery(conditions);
	}

	public List<LanguageExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return languageDao.criteriaQuery(conditions, orders);
	}

	public List<LanguageExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return languageDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return languageDao.criteriaQueryCount(conditions);
	}

}
