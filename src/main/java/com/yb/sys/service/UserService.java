package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.dao.UserDao;
import com.yb.sys.entity.UserExt;

public class UserService implements IUserService{

	private UserDao userDao;
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserExt load(final Long id, boolean useCache)
	{
		return userDao.load(id, useCache);
	}

	public UserExt create(final UserExt userExt)
	{
		return userDao.create(userExt);
	}

	public UserExt save(UserExt userExt)
	{
		return userDao.save(userExt);
	}

	public void update(UserExt userExt)
	{
		userDao.update(userExt);
	}

	public void delete(Long id)
	{
		userDao.delete(id);
	}

	public void delete(UserExt userExt)
	{
		userDao.delete(userExt);
	}

	public List<UserExt> criteriaQuery(final Collection<ICondition> conditions)
	{
		return userDao.criteriaQuery(conditions);
	}

	public List<UserExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
	{
		return userDao.criteriaQuery(conditions, orders);
	}

	public List<UserExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize)
	{
		return userDao.criteriaQuery(conditions, orders, currpage, pagesize);
	}

	public int criteriaQueryCount(final Collection<ICondition> conditions)
	{
		return userDao.criteriaQueryCount(conditions);
	}

}
