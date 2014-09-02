package com.common.hibernate;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

public class LtCondition implements ICondition
{
  private String propertyName;
  private Object value;

  public LtCondition(String propertyName, Object value)
  {
    this.propertyName = propertyName;
    this.value = value;
  }

  public Criterion generateExpression()
  {
    return Expression.lt(this.propertyName, this.value);
  }
}
