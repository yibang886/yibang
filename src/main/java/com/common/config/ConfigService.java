package com.common.config;

import java.lang.String;
import java.util.Properties;

public class ConfigService
{
  private Properties properties;
  public Properties getProperties()
  {
    return properties;
  }
  public void setProperties(Properties properties)
  {
    this.properties = properties;
  }

  public String getProperty(String name)
  {
    return properties.getProperty(name);
  }
}
