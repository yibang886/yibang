package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.MainposExt;

public interface IMainposService {

	public MainposExt load(final Long id, boolean useCache);

	public MainposExt create(final MainposExt mainposExt);

	public MainposExt save(MainposExt mainposExt);

	public void update(MainposExt mainposExt);

	public void delete(Long id);

	public void delete(MainposExt mainposExt);

	public List<MainposExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<MainposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<MainposExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);
}
