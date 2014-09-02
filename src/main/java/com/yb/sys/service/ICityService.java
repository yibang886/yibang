package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.CityExt;

public interface ICityService {

	public CityExt load(final Long id, boolean useCache);

	public CityExt create(final CityExt cityExt);

	public CityExt save(CityExt cityExt);

	public void update(CityExt cityExt);

	public void delete(Long id);

	public void delete(CityExt cityExt);

	public List<CityExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<CityExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<CityExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);
}
