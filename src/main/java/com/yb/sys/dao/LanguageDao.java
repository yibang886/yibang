package com.yb.sys.dao;

import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.hibernate.CacheMode;
import org.hibernate.criterion.Order;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

import com.common.hibernate.ExpressionUtil;
import com.common.hibernate.ICondition;
import com.yb.sys.entity.LanguageExt;

public class LanguageDao extends HibernateDaoSupport implements ILanguageDao{

	private final static Logger logger = Logger.getLogger(LanguageDao.class);
	
	public LanguageExt load(final Long id, boolean useCache)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("LanguageDao.load - 'id' can not be null");
        }
        this.getHibernateTemplate().setCacheQueries(useCache);
        
        return this.getHibernateTemplate().get(LanguageExt.class, id);
    }
	
	public LanguageExt create(final LanguageExt languageExt)
    {
        if (languageExt == null)
        {
            throw new IllegalArgumentException("LanguageDao.create - 'languageExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        Object identifier = this.getHibernateTemplate().save(languageExt);
        languageExt.setId((Long)identifier);
        return languageExt;
    }
	
	public LanguageExt save(com.yb.sys.entity.LanguageExt languageExt)
    {
        if (languageExt == null)
        {
            throw new IllegalArgumentException("LanguageDao.save - 'languageExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        return this.getHibernateTemplate().merge(languageExt);
    }
	
	public void update(LanguageExt languageExt)
    {
        if (languageExt == null)
        {
            throw new IllegalArgumentException("LanguageDao.update - 'languageExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().update(languageExt);
    }
	
	public void delete(Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("LanguageDao.remove - 'id' can not be null");
        }
        LanguageExt entity = this.load(id,true);
        if (entity != null)
        {
            this.delete(entity);
        }
    }
	
	public void delete(LanguageExt languageExt)
    {
        if (languageExt == null)
        {
            throw new IllegalArgumentException("LanguageDao.remove - 'languageExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().delete(languageExt);
    }
	
	public List<LanguageExt> criteriaQuery(final Collection<ICondition> conditions) 
	{
        return criteriaQuery(conditions, null, 0, 0);
    }

    
    public List<LanguageExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
    {
        return criteriaQuery(conditions, orders, 0, 0);
    }
    
	public List<LanguageExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize) {
		org.springframework.orm.hibernate3.HibernateCallback<List<LanguageExt>> callback = new org.springframework.orm.hibernate3.HibernateCallback<List<LanguageExt>>() {
			public List<LanguageExt> doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {

				session.setCacheMode(CacheMode.NORMAL);

				org.hibernate.Criteria criteria = session.createCriteria(LanguageExt.class);

				if (conditions != null) {
					ExpressionUtil.generateQueryExpression(conditions, criteria);
				}

				if (orders != null) {
					ExpressionUtil.generateOrderExpression(orders, criteria);
				}

				if ((pagesize > 0) && (currpage > 0)) {
					criteria.setFirstResult(pagesize * (currpage - 1));
					criteria.setMaxResults(pagesize);
				}

				return criteria.list();
			}
		};

		return getHibernateTemplate().execute(callback);
	}
	
	public int criteriaQueryCount(final Collection<ICondition> conditions) { 
       	this.getHibernateTemplate().setCacheQueries(true);
       	
       	org.hibernate.Criteria criteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(LanguageExt.class);
       	
       	if (conditions != null) {
             ExpressionUtil.generateQueryExpression(conditions, criteria);
         }
        	
       	int count=((Number) criteria .setProjection(org.hibernate.criterion.Projections.rowCount()).uniqueResult()).intValue(); 
        	
        return count; 
    }
}
