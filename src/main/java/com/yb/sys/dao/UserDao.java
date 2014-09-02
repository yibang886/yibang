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
import com.yb.sys.entity.UserExt;

public class UserDao extends HibernateDaoSupport implements IUserDao{

	private final static Logger logger = Logger.getLogger(UserDao.class);
	
	public UserExt load(final Long id, boolean useCache)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("UserDao.load - 'id' can not be null");
        }
        this.getHibernateTemplate().setCacheQueries(useCache);
        
        return this.getHibernateTemplate().get(UserExt.class, id);
    }
	
	public UserExt create(final UserExt userExt)
    {
        if (userExt == null)
        {
            throw new IllegalArgumentException("UserDao.create - 'userExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        Object identifier = this.getHibernateTemplate().save(userExt);
        userExt.setId((Long)identifier);
        return userExt;
    }
	
	public UserExt save(com.yb.sys.entity.UserExt userExt)
    {
        if (userExt == null)
        {
            throw new IllegalArgumentException("UserDao.save - 'userExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        return this.getHibernateTemplate().merge(userExt);
    }
	
	public void update(UserExt userExt)
    {
        if (userExt == null)
        {
            throw new IllegalArgumentException("UserDao.update - 'userExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().update(userExt);
    }
	
	public void delete(Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("UserDao.remove - 'id' can not be null");
        }
        UserExt entity = this.load(id,true);
        if (entity != null)
        {
            this.delete(entity);
        }
    }
	
	public void delete(UserExt userExt)
    {
        if (userExt == null)
        {
            throw new IllegalArgumentException("UserDao.remove - 'userExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().delete(userExt);
    }
	
	public List<UserExt> criteriaQuery(final Collection<ICondition> conditions) 
	{
        return criteriaQuery(conditions, null, 0, 0);
    }

    
    public List<UserExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
    {
        return criteriaQuery(conditions, orders, 0, 0);
    }
    
	public List<UserExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize) {
		org.springframework.orm.hibernate3.HibernateCallback<List<UserExt>> callback = new org.springframework.orm.hibernate3.HibernateCallback<List<UserExt>>() {
			public List<UserExt> doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {

				session.setCacheMode(CacheMode.NORMAL);

				org.hibernate.Criteria criteria = session.createCriteria(UserExt.class);

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
       	
       	org.hibernate.Criteria criteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(UserExt.class);
       	
       	if (conditions != null) {
             ExpressionUtil.generateQueryExpression(conditions, criteria);
         }
        	
       	int count=((Number) criteria .setProjection(org.hibernate.criterion.Projections.rowCount()).uniqueResult()).intValue(); 
        	
        return count; 
    }
}
