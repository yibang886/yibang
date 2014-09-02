package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.DoctypeExt;

public interface IDoctypeService {

	public DoctypeExt load(final Long id, boolean useCache);

	public DoctypeExt create(final DoctypeExt doctypeExt);

	public DoctypeExt save(DoctypeExt doctypeExt);

	public void update(DoctypeExt doctypeExt);

	public void delete(Long id);

	public void delete(DoctypeExt doctypeExt);

	public List<DoctypeExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<DoctypeExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<DoctypeExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);
}
