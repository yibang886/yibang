package com.yb.sys.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.TranstypeExt;

public interface ITranstypeDao {
	
	public TranstypeExt load(final Long id, boolean useCache);

	public TranstypeExt create(final com.yb.sys.entity.TranstypeExt transtypeExt);

	public TranstypeExt save(com.yb.sys.entity.TranstypeExt transtypeExt);

	public void update(TranstypeExt transtypeExt);

	public void delete(Long id);

	public void delete(TranstypeExt transtypeExt);

	public List<TranstypeExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<TranstypeExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<TranstypeExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);

}
