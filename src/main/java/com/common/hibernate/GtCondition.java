package com.common.hibernate;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

public class GtCondition implements ICondition
{
  private String propertyName;
  private Object value;

  public GtCondition(String propertyName, Object value)
  {
   this.propertyName = propertyName;
   this.value = value;
  }

  public Criterion generateExpression()
  {
    return Expression.gt(this.propertyName, this.value);
  }
}
