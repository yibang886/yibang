package com.common.mail;

import java.util.Properties;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress;
import javax.mail.Message;
import javax.mail.Transport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MailUtil
{
  private static final Logger logger = LoggerFactory.getLogger(MailUtil.class);

  private static String host = "smtp.163.com";

  public static boolean sendMail(String from, String passwd, String to, String title, String content)
  {
    try{
      Properties props = System.getProperties();
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.auth", "true");

      Session mailsession = Session.getDefaultInstance(props); 
      mailsession.setDebug(false);  
      MimeMessage message = new MimeMessage(mailsession);
      message.setFrom(new InternetAddress(from));
      message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
      message.addRecipient(Message.RecipientType.CC, new InternetAddress(from));
      message.setSubject(title);
      message.setText(content);
      message.saveChanges();
      Transport transport = mailsession.getTransport("smtp");  
      transport.connect(host, from, passwd); 
      transport.sendMessage(message, message.getAllRecipients());  
      transport.close();
      return true;
    }
    catch(Exception e)
    {
      logger.error("Exception occurred when sending email");
      e.printStackTrace();
      return false;
    }
  }
}
