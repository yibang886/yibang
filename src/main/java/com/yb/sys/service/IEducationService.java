package com.yb.sys.service;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.EducationExt;

public interface IEducationService {

	public EducationExt load(final Long id, boolean useCache);

	public EducationExt create(final EducationExt educationExt);

	public EducationExt save(EducationExt educationExt);

	public void update(EducationExt educationExt);

	public void delete(Long id);

	public void delete(EducationExt educationExt);

	public List<EducationExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<EducationExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<EducationExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);
}
