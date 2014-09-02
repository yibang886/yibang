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
import com.yb.sys.entity.EducationExt;

public class EducationDao extends HibernateDaoSupport implements IEducationDao{

	private final static Logger logger = Logger.getLogger(EducationDao.class);
	
	public EducationExt load(final Long id, boolean useCache)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("EducationDao.load - 'id' can not be null");
        }
        this.getHibernateTemplate().setCacheQueries(useCache);
        
        return this.getHibernateTemplate().get(EducationExt.class, id);
    }
	
	public EducationExt create(final EducationExt educationExt)
    {
        if (educationExt == null)
        {
            throw new IllegalArgumentException("EducationDao.create - 'educationExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        Object identifier = this.getHibernateTemplate().save(educationExt);
        educationExt.setId((Long)identifier);
        return educationExt;
    }
	
	public EducationExt save(com.yb.sys.entity.EducationExt educationExt)
    {
        if (educationExt == null)
        {
            throw new IllegalArgumentException("EducationDao.save - 'educationExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        return this.getHibernateTemplate().merge(educationExt);
    }
	
	public void update(EducationExt educationExt)
    {
        if (educationExt == null)
        {
            throw new IllegalArgumentException("EducationDao.update - 'educationExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().update(educationExt);
    }
	
	public void delete(Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("EducationDao.remove - 'id' can not be null");
        }
        EducationExt entity = this.load(id,true);
        if (entity != null)
        {
            this.delete(entity);
        }
    }
	
	public void delete(EducationExt educationExt)
    {
        if (educationExt == null)
        {
            throw new IllegalArgumentException("EducationDao.remove - 'educationExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().delete(educationExt);
    }
	
	public List<EducationExt> criteriaQuery(final Collection<ICondition> conditions) 
	{
        return criteriaQuery(conditions, null, 0, 0);
    }

    
    public List<EducationExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
    {
        return criteriaQuery(conditions, orders, 0, 0);
    }
    
	public List<EducationExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize) {
		org.springframework.orm.hibernate3.HibernateCallback<List<EducationExt>> callback = new org.springframework.orm.hibernate3.HibernateCallback<List<EducationExt>>() {
			public List<EducationExt> doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {

				session.setCacheMode(CacheMode.NORMAL);

				org.hibernate.Criteria criteria = session.createCriteria(EducationExt.class);

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
       	
       	org.hibernate.Criteria criteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(EducationExt.class);
       	
       	if (conditions != null) {
             ExpressionUtil.generateQueryExpression(conditions, criteria);
         }
        	
       	int count=((Number) criteria .setProjection(org.hibernate.criterion.Projections.rowCount()).uniqueResult()).intValue(); 
        	
        return count; 
    }
}
