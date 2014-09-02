package com.common.hibernate;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

public class GeCondition implements ICondition
{
  private String propertyName;
  private Object value;

  public GeCondition(String propertyName, Object value)
  {
    this.propertyName = propertyName;
    this.value = value;
  }

  public Criterion generateExpression()
  {
    return Expression.ge(this.propertyName, this.value);
  }
}
