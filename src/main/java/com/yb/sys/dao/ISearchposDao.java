package com.yb.sys.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.SearchposExt;

public interface ISearchposDao {
	
	public SearchposExt load(final Long id, boolean useCache);

	public SearchposExt create(final com.yb.sys.entity.SearchposExt searchposExt);

	public SearchposExt save(com.yb.sys.entity.SearchposExt searchposExt);

	public void update(SearchposExt searchposExt);

	public void delete(Long id);

	public void delete(SearchposExt searchposExt);

	public List<SearchposExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<SearchposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<SearchposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);

}
