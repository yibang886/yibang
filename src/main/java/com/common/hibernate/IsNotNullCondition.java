package com.common.hibernate;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

public class IsNotNullCondition implements ICondition
{
  private String propertyName;

  public IsNotNullCondition(String propertyName)
  {
    this.propertyName = propertyName;
  }

  public Criterion generateExpression()
  {
    return Expression.isNotNull(this.propertyName);
  }
}
