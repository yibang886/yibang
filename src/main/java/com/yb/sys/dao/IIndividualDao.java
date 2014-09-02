package com.yb.sys.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.IndividualExt;

public interface IIndividualDao {
	
	public IndividualExt load(final Long id, boolean useCache);

	public IndividualExt create(final com.yb.sys.entity.IndividualExt individualExt);

	public IndividualExt save(com.yb.sys.entity.IndividualExt individualExt);

	public void update(IndividualExt individualExt);

	public void delete(Long id);

	public void delete(IndividualExt individualExt);

	public List<IndividualExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<IndividualExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<IndividualExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);

}
