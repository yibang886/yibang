package com.common.hibernate;

import org.hibernate.criterion.Criterion;

public abstract interface ICondition
{
  public abstract Criterion generateExpression();
}
