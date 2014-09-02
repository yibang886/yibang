package com.yb.sys.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.MainposExt;

public interface IMainposDao {
	
	public MainposExt load(final Long id, boolean useCache);

	public MainposExt create(final com.yb.sys.entity.MainposExt mainposExt);

	public MainposExt save(com.yb.sys.entity.MainposExt mainposExt);

	public void update(MainposExt mainposExt);

	public void delete(Long id);

	public void delete(MainposExt mainposExt);

	public List<MainposExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<MainposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<MainposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);

}
