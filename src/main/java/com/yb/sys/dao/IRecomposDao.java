package com.yb.sys.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.RecomposExt;

public interface IRecomposDao {
	
	public RecomposExt load(final Long id, boolean useCache);

	public RecomposExt create(final com.yb.sys.entity.RecomposExt recomposExt);

	public RecomposExt save(com.yb.sys.entity.RecomposExt recomposExt);

	public void update(RecomposExt recomposExt);

	public void delete(Long id);

	public void delete(RecomposExt recomposExt);

	public List<RecomposExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<RecomposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<RecomposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);

}
