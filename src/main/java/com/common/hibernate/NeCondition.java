package com.common.hibernate;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

public class NeCondition implements ICondition
{
  private String propertyName;
  private Object value;

  public NeCondition(String propertyName, Object value)
  {
    this.propertyName = propertyName;
    this.value = value;
  }

  public Criterion generateExpression()
  {
    return Expression.ne(this.propertyName, this.value);
  }
}
