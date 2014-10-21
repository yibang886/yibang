package com.common.config;

import java.lang.String;
import java.util.Properties;

/*
 * this service can/should be used like this:
 *  1. add configuration items in Spring context.xml (normally root-context.xml), so Spring will instantiate a bean of this class;
 *       <bean id="configService" class="com.common.config.ConfigService">
 *         <property name="properties">
 *           <props>
 *             <prop key="itemName1">itemValue1</prop>
 *             <prop key="itemName2">itemValue2</prop>
 *             ......
 *           </props>
 *         </property>
 *       </bean>
 *  2. whenever needed, import this service bean:
 *       @Resource(name = "configService")^M
 *       private ConfigService configService;^M
 *
 *  3. get config value like this:
 *       String value1 = configService.getProperty(itemName1);
 *       String value2 = configService.getProperty(itemName2);
 *
 *  the magic is that, Spring will intialize the class member
 *       private Properties properties
 *  automatically be the configuration
 *      <prop key="itemName1">itemValue1</prop>
 *      <prop key="itemName2">itemValue2</prop>
 *      ......
 */

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
