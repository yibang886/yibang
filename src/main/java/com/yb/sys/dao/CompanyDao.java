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
import com.common.hibernate.AssocCriteria;
import com.yb.sys.entity.CompanyExt;

public class CompanyDao extends HibernateDaoSupport implements ICompanyDao{

	private final static Logger logger = Logger.getLogger(CompanyDao.class);
	
	public CompanyExt load(final Long id, boolean useCache)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("CompanyDao.load - 'id' can not be null");
        }
        this.getHibernateTemplate().setCacheQueries(useCache);
        
        return this.getHibernateTemplate().get(CompanyExt.class, id);
    }
	
	public CompanyExt create(final CompanyExt companyExt)
    {
        if (companyExt == null)
        {
            throw new IllegalArgumentException("CompanyDao.create - 'companyExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        Object identifier = this.getHibernateTemplate().save(companyExt);
        companyExt.setId((Long)identifier);
        return companyExt;
    }
	
	public CompanyExt save(com.yb.sys.entity.CompanyExt companyExt)
    {
        if (companyExt == null)
        {
            throw new IllegalArgumentException("CompanyDao.save - 'companyExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        return this.getHibernateTemplate().merge(companyExt);
    }
	
	public void update(CompanyExt companyExt)
    {
        if (companyExt == null)
        {
            throw new IllegalArgumentException("CompanyDao.update - 'companyExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().update(companyExt);
    }
	
	public void delete(Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("CompanyDao.remove - 'id' can not be null");
        }
        CompanyExt entity = this.load(id,true);
        if (entity != null)
        {
            this.delete(entity);
        }
    }
	
	public void delete(CompanyExt companyExt)
    {
        if (companyExt == null)
        {
            throw new IllegalArgumentException("CompanyDao.remove - 'companyExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().delete(companyExt);
    }
	
	public List<CompanyExt> criteriaQuery(final Collection<ICondition> conditions) 
	{
        return criteriaQuery(conditions, null, 0, 0);
    }

    
    public List<CompanyExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
    {
        return criteriaQuery(conditions, orders, 0, 0);
    }
    
	public List<CompanyExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize) {
		org.springframework.orm.hibernate3.HibernateCallback<List<CompanyExt>> callback = new org.springframework.orm.hibernate3.HibernateCallback<List<CompanyExt>>() {
			public List<CompanyExt> doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {

				session.setCacheMode(CacheMode.NORMAL);

				org.hibernate.Criteria criteria = session.createCriteria(CompanyExt.class);

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


	public List<CompanyExt> criteriaQuery(
      final Collection<ICondition> conditions, 
      final Collection<Order> orders, 
      final List<AssocCriteria> assocCriterias,
      final int currpage, 
      final int pagesize) 
  {
    org.springframework.orm.hibernate3.HibernateCallback<List<CompanyExt>> callback = new org.springframework.orm.hibernate3.HibernateCallback<List<CompanyExt>>()
    {
      public List<CompanyExt> doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException
      {
        session.setCacheMode(CacheMode.NORMAL);
        org.hibernate.Criteria criteria = session.createCriteria(CompanyExt.class);

				if (conditions != null) 
        {
					ExpressionUtil.generateQueryExpression(conditions, criteria);
				}

				if (orders != null) 
        {
					ExpressionUtil.generateOrderExpression(orders, criteria);
				}

        //add assoc criterias;
        if(assocCriterias!=null)
        {
          for(AssocCriteria assocCriteria : assocCriterias)
          {
            org.hibernate.Criteria c = criteria.createCriteria(assocCriteria.getPropName());
            if(assocCriteria.getConditions() != null)
            {
              ExpressionUtil.generateQueryExpression(assocCriteria.getConditions(), c);
            }

            if(assocCriteria.getOrders() != null)
            {
              ExpressionUtil.generateOrderExpression(assocCriteria.getOrders(), c);
            }
          }
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
       	
       	org.hibernate.Criteria criteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(CompanyExt.class);
       	
       	if (conditions != null) {
             ExpressionUtil.generateQueryExpression(conditions, criteria);
         }
        	
       	int count=((Number) criteria .setProjection(org.hibernate.criterion.Projections.rowCount()).uniqueResult()).intValue(); 
        	
        return count; 
    }
}
