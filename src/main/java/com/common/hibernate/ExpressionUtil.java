package com.common.hibernate;

import java.util.Collection;
import java.util.Iterator;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;

public class ExpressionUtil
{
  public static Criteria generateQueryExpression(Collection<ICondition> conditions, Criteria criteria)
  {
    Iterator iterator = conditions.iterator();

    while (iterator.hasNext()) {
      ICondition condition = (ICondition)iterator.next();
      criteria.add(condition.generateExpression());
    }

    return criteria;
  }

  public static Criteria generateOrderExpression(Collection<Order> orders, Criteria criteria) {
    Iterator iterator = orders.iterator();

    while (iterator.hasNext()) {
          Order order = (Order)iterator.next();
        criteria.addOrder(order);
    }

    return criteria;
  }
}
