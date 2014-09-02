package com.common.hibernate;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.SimpleExpression;

public class LikeCondition implements ICondition
{
  private String propertyName;
  private String value;
  private MatchMode matchMode = MatchMode.ANYWHERE;

  public LikeCondition(String propertyName, String value)
  {
    this.propertyName = propertyName;
    this.value = value;
    this.matchMode = MatchMode.ANYWHERE;
  }

  public LikeCondition(String propertyName, String value, MatchMode matchMode)
  {
    this.propertyName = propertyName;
    this.value = value;
    this.matchMode = matchMode;
  }

  public Criterion generateExpression()
  {
    return Expression.like(this.propertyName, this.value, this.matchMode).ignoreCase();
  }
}
