package com.mail;

import java.util.*;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	public static void send(String email,String sub, String msg, String Hmail,String pass)
	{
		Properties props = new Properties();
		
		props.put("mail.smtp.host","smtp.gmail.com");
		props.put("mail.smtp.port","587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		
		Session session = Session.getInstance(props,new javax.mail.Authenticator()
				{
			protected PasswordAuthentication getPasswordAuthentication(){
				return new PasswordAuthentication(Hmail,pass);
			}
				});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(Hmail));
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(email));
			message.setSubject(sub);
			message.setText(msg);
			
			Transport.send(message);
		}catch(Exception EX)
		{
			EX.printStackTrace();
		}
		
	}

}
