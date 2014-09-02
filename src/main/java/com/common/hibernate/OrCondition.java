package com.common.hibernate;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;

public class OrCondition implements ICondition
{
  private ICondition con1;
  private ICondition con2;

  public OrCondition(ICondition con1, ICondition con2)
  {
    this.con1 = con1;
    this.con2 = con2;
  }

  public Criterion generateExpression()
  {
    return Expression.or(this.con1.generateExpression(), this.con2.generateExpression());
  }
}
