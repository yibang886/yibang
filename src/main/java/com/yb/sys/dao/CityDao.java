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
import com.yb.sys.entity.CityExt;

public class CityDao extends HibernateDaoSupport implements ICityDao{

	private final static Logger logger = Logger.getLogger(CityDao.class);
	
	public CityExt load(final Long id, boolean useCache)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("CityDao.load - 'id' can not be null");
        }
        this.getHibernateTemplate().setCacheQueries(useCache);
        
        return this.getHibernateTemplate().get(CityExt.class, id);
    }
	
	public CityExt create(final CityExt cityExt)
    {
        if (cityExt == null)
        {
            throw new IllegalArgumentException("CityDao.create - 'cityExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        Object identifier = this.getHibernateTemplate().save(cityExt);
        cityExt.setId((Long)identifier);
        return cityExt;
    }
	
	public CityExt save(com.yb.sys.entity.CityExt cityExt)
    {
        if (cityExt == null)
        {
            throw new IllegalArgumentException("CityDao.save - 'cityExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        return this.getHibernateTemplate().merge(cityExt);
    }
	
	public void update(CityExt cityExt)
    {
        if (cityExt == null)
        {
            throw new IllegalArgumentException("CityDao.update - 'cityExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().update(cityExt);
    }
	
	public void delete(Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("CityDao.remove - 'id' can not be null");
        }
        CityExt entity = this.load(id,true);
        if (entity != null)
        {
            this.delete(entity);
        }
    }
	
	public void delete(CityExt cityExt)
    {
        if (cityExt == null)
        {
            throw new IllegalArgumentException("CityDao.remove - 'cityExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().delete(cityExt);
    }
	
	public List<CityExt> criteriaQuery(final Collection<ICondition> conditions) 
	{
        return criteriaQuery(conditions, null, 0, 0);
    }

    
    public List<CityExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
    {
        return criteriaQuery(conditions, orders, 0, 0);
    }
    
	public List<CityExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize) {
		org.springframework.orm.hibernate3.HibernateCallback<List<CityExt>> callback = new org.springframework.orm.hibernate3.HibernateCallback<List<CityExt>>() {
			public List<CityExt> doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {

				session.setCacheMode(CacheMode.NORMAL);

				org.hibernate.Criteria criteria = session.createCriteria(CityExt.class);

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
       	
       	org.hibernate.Criteria criteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(CityExt.class);
       	
       	if (conditions != null) {
             ExpressionUtil.generateQueryExpression(conditions, criteria);
         }
        	
       	int count=((Number) criteria .setProjection(org.hibernate.criterion.Projections.rowCount()).uniqueResult()).intValue(); 
        	
        return count; 
    }
}
