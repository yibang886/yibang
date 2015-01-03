package com.common.hibernate;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

public class InCondition implements ICondition
{
  private String propertyName;
  private Object[] value;

  public InCondition(String propertyName, Object[] value)
  {
    this.propertyName = propertyName;
    this.value = value;
  }

  public Criterion generateExpression()
  {
    return Expression.in(this.propertyName, this.value);
  }
}
