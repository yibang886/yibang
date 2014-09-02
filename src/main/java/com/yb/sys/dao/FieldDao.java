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
import com.yb.sys.entity.FieldExt;

public class FieldDao extends HibernateDaoSupport implements IFieldDao{

	private final static Logger logger = Logger.getLogger(FieldDao.class);
	
	public FieldExt load(final Long id, boolean useCache)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("FieldDao.load - 'id' can not be null");
        }
        this.getHibernateTemplate().setCacheQueries(useCache);
        
        return this.getHibernateTemplate().get(FieldExt.class, id);
    }
	
	public FieldExt create(final FieldExt fieldExt)
    {
        if (fieldExt == null)
        {
            throw new IllegalArgumentException("FieldDao.create - 'fieldExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        Object identifier = this.getHibernateTemplate().save(fieldExt);
        fieldExt.setId((Long)identifier);
        return fieldExt;
    }
	
	public FieldExt save(com.yb.sys.entity.FieldExt fieldExt)
    {
        if (fieldExt == null)
        {
            throw new IllegalArgumentException("FieldDao.save - 'fieldExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        return this.getHibernateTemplate().merge(fieldExt);
    }
	
	public void update(FieldExt fieldExt)
    {
        if (fieldExt == null)
        {
            throw new IllegalArgumentException("FieldDao.update - 'fieldExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().update(fieldExt);
    }
	
	public void delete(Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("FieldDao.remove - 'id' can not be null");
        }
        FieldExt entity = this.load(id,true);
        if (entity != null)
        {
            this.delete(entity);
        }
    }
	
	public void delete(FieldExt fieldExt)
    {
        if (fieldExt == null)
        {
            throw new IllegalArgumentException("FieldDao.remove - 'fieldExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().delete(fieldExt);
    }
	
	public List<FieldExt> criteriaQuery(final Collection<ICondition> conditions) 
	{
        return criteriaQuery(conditions, null, 0, 0);
    }

    
    public List<FieldExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
    {
        return criteriaQuery(conditions, orders, 0, 0);
    }
    
	public List<FieldExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize) {
		org.springframework.orm.hibernate3.HibernateCallback<List<FieldExt>> callback = new org.springframework.orm.hibernate3.HibernateCallback<List<FieldExt>>() {
			public List<FieldExt> doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {

				session.setCacheMode(CacheMode.NORMAL);

				org.hibernate.Criteria criteria = session.createCriteria(FieldExt.class);

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
       	
       	org.hibernate.Criteria criteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(FieldExt.class);
       	
       	if (conditions != null) {
             ExpressionUtil.generateQueryExpression(conditions, criteria);
         }
        	
       	int count=((Number) criteria .setProjection(org.hibernate.criterion.Projections.rowCount()).uniqueResult()).intValue(); 
        	
        return count; 
    }
}
