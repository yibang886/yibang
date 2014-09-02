package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.FieldExt;

public interface IFieldService {

	public FieldExt load(final Long id, boolean useCache);

	public FieldExt create(final FieldExt fieldExt);

	public FieldExt save(FieldExt fieldExt);

	public void update(FieldExt fieldExt);

	public void delete(Long id);

	public void delete(FieldExt fieldExt);

	public List<FieldExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<FieldExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<FieldExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);
}
