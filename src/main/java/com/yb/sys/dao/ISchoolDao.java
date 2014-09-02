package com.yb.sys.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.SchoolExt;

public interface ISchoolDao {
	
	public SchoolExt load(final Long id, boolean useCache);

	public SchoolExt create(final com.yb.sys.entity.SchoolExt schoolExt);

	public SchoolExt save(com.yb.sys.entity.SchoolExt schoolExt);

	public void update(SchoolExt schoolExt);

	public void delete(Long id);

	public void delete(SchoolExt schoolExt);

	public List<SchoolExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<SchoolExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<SchoolExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);

}
