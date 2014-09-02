package com.yb.sys.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.criterion.Order;

import com.common.hibernate.ICondition;
import com.yb.sys.entity.LanguageExt;

public interface ILanguageDao {
	
	public LanguageExt load(final Long id, boolean useCache);

	public LanguageExt create(final com.yb.sys.entity.LanguageExt languageExt);

	public LanguageExt save(com.yb.sys.entity.LanguageExt languageExt);

	public void update(LanguageExt languageExt);

	public void delete(Long id);

	public void delete(LanguageExt languageExt);

	public List<LanguageExt> criteriaQuery(final Collection<ICondition> conditions);

	public List<LanguageExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders);

	public List<LanguageExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize);

	public int criteriaQueryCount(final Collection<ICondition> conditions);

}
