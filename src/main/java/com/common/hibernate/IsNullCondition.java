package com.common.hibernate;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

public class IsNullCondition implements ICondition
{
  private String propertyName;

  public IsNullCondition(String propertyName)
  {
    this.propertyName = propertyName;
  }

  public Criterion generateExpression()
  {
    return Expression.isNull(this.propertyName);
  }
}
