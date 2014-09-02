package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.UserExt;

public interface IUserService {

	public UserExt load(final Long id, boolean useCache);

	public UserExt create(final UserExt userExt);

	public UserExt save(UserExt userExt);

	public void update(UserExt userExt);

	public void delete(Long id);

	public void delete(UserExt userExt);

	public List<UserExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<UserExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<UserExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);
}
