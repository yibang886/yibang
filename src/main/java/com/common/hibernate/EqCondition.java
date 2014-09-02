package com.common.hibernate;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

public class EqCondition implements ICondition
{
  private String propertyName;
  private Object value;

  public EqCondition(String propertyName, Object value)
  {
    this.propertyName = propertyName;
    this.value = value;
  }

  public Criterion generateExpression()
  {
    return Expression.eq(this.propertyName, this.value);
  }
}
