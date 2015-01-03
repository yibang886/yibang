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
import com.yb.sys.entity.IndividualExt;

public class IndividualDao extends HibernateDaoSupport implements IIndividualDao{

	private final static Logger logger = Logger.getLogger(IndividualDao.class);
	
	public IndividualExt load(final Long id, boolean useCache)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("IndividualDao.load - 'id' can not be null");
        }
        this.getHibernateTemplate().setCacheQueries(useCache);
        
        return this.getHibernateTemplate().get(IndividualExt.class, id);
    }
	
	public IndividualExt create(final IndividualExt individualExt)
    {
        if (individualExt == null)
        {
            throw new IllegalArgumentException("IndividualDao.create - 'individualExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        Object identifier = this.getHibernateTemplate().save(individualExt);
        individualExt.setId((Long)identifier);
        return individualExt;
    }
	
	public IndividualExt save(com.yb.sys.entity.IndividualExt individualExt)
    {
        if (individualExt == null)
        {
            throw new IllegalArgumentException("IndividualDao.save - 'individualExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        return this.getHibernateTemplate().merge(individualExt);
    }
	
	public void update(IndividualExt individualExt)
    {
        if (individualExt == null)
        {
            throw new IllegalArgumentException("IndividualDao.update - 'individualExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().update(individualExt);
    }
	
	public void delete(Long id)
    {
        if (id == null)
        {
            throw new IllegalArgumentException("IndividualDao.remove - 'id' can not be null");
        }
        IndividualExt entity = this.load(id,true);
        if (entity != null)
        {
            this.delete(entity);
        }
    }
	
	public void delete(IndividualExt individualExt)
    {
        if (individualExt == null)
        {
            throw new IllegalArgumentException("IndividualDao.remove - 'individualExt' can not be null");
        }
        this.getHibernateTemplate().setFlushMode(org.springframework.orm.hibernate3.HibernateTemplate.FLUSH_AUTO);
        this.getHibernateTemplate().delete(individualExt);
    }
	
	public List<IndividualExt> criteriaQuery(final Collection<ICondition> conditions) 
	{
        return criteriaQuery(conditions, null, 0, 0);
    }

    
    public List<IndividualExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders)
    {
        return criteriaQuery(conditions, orders, 0, 0);
    }
    
	public List<IndividualExt> criteriaQuery(final Collection<ICondition> conditions, final Collection<Order> orders, final int currpage, final int pagesize) {
		org.springframework.orm.hibernate3.HibernateCallback<List<IndividualExt>> callback = new org.springframework.orm.hibernate3.HibernateCallback<List<IndividualExt>>() {
			public List<IndividualExt> doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException {

				session.setCacheMode(CacheMode.NORMAL);

				org.hibernate.Criteria criteria = session.createCriteria(IndividualExt.class);

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

	public List<IndividualExt> criteriaQuery(
      final Collection<ICondition> conditions, 
      final Collection<Order> orders, 
      final List<AssocCriteria> assocCriterias,
      final int currpage, 
      final int pagesize)
  {
		org.springframework.orm.hibernate3.HibernateCallback<List<IndividualExt>> callback = new org.springframework.orm.hibernate3.HibernateCallback<List<IndividualExt>>() 
    {
			public List<IndividualExt> doInHibernate(org.hibernate.Session session) throws org.hibernate.HibernateException 
      {

				session.setCacheMode(CacheMode.NORMAL);

				org.hibernate.Criteria criteria = session.createCriteria(IndividualExt.class);

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

				if ((pagesize > 0) && (currpage > 0)) 
        {
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
       	
       	org.hibernate.Criteria criteria = getHibernateTemplate().getSessionFactory().getCurrentSession().createCriteria(IndividualExt.class);
       	
       	if (conditions != null) {
             ExpressionUtil.generateQueryExpression(conditions, criteria);
         }
        	
       	int count=((Number) criteria .setProjection(org.hibernate.criterion.Projections.rowCount()).uniqueResult()).intValue(); 
        	
        return count; 
    }
}
