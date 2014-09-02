package com.common.hibernate;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

public class LeCondition implements ICondition
{
  private String propertyName;
  private Object value;

  public LeCondition(String propertyName, Object value)
  {
    this.propertyName = propertyName;
    this.value = value;
  }

  public Criterion generateExpression()
  { 
    return Expression.le(this.propertyName, this.value);
  }
}
