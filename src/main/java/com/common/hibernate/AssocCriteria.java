package com.common.hibernate;

import java.util.List;

import org.hibernate.criterion.Order;

/*
 * This class stands for "Conditions, Orders and etc created on an associated instance";
 */
public class AssocCriteria
{
  private String propName;

  private List<ICondition> conditions;
  private List<Order> orders;

  public AssocCriteria(String propName, List<ICondition> conditions, List<Order> orders)
  {
    this.propName = propName;
    this.conditions = conditions;
    this.orders = orders;
  }

  public String getPropName()
  {
    return propName;
  }
  public void setPropName(String propName)
  {
    this.propName = propName;
  }

  public List<ICondition> getConditions()
  {
    return conditions;
  }
  public void setConditions(List<ICondition> conditions)
  {
    this.conditions = conditions;
  }

  public List<Order> getOrders()
  {
    return orders;
  }
  public void setOrders(List<Order> orders)
  {
    this.orders = orders;
  }
}
