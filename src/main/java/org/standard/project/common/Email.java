package org.standard.project.common;

import java.util.Date;

import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;

public class Email {

		public static void sendFindIdResult(String customerID, String customerEmail) throws MessagingException{
			final String bodyEncoding = "UTF-8"; //콘텐츠 인코딩
			final String username = "noreply@vinocturne.cafe24.com";//"noreply@vinocturne.cafe24.com";  // like yourname@outlook.com
		    final String password = "standard1@";   // password here
		    String fromEmail = "noreply@ourstandard.shop";
			String fromUsername = "OURSTANDARD MANAGER";
			String subject ="ourstandard 아이디찾기 결과";
		    
		    // 메일에 출력할 텍스트
		    StringBuffer sb = new StringBuffer();
		    sb.append("<h3>안녕하세요</h3>\n");
		    sb.append("<h4>스탠다드 운영진입니다</h4>\n");
		    sb.append("<h4>아이디 찾기 결과입니다. 고객님의 아이디는 </h4>\n"+"<h2>"+customerID+"</h2>");
		    sb.append("<h4>입니다.</h4>");
		    
		    String html = sb.toString();
		    
		    // 메일 옵션 설정
		    Properties props = new Properties();    
		    props.put("mail.smtp.auth", "true");
		       props.put("mail.smtp.starttls.enable", "true");
		       props.put("mail.smtp.host", "smtp.cafe24.com");
		       props.put("mail.smtp.port", "25");
		    
		    try {
		      // 메일 서버  인증 계정 설정
		      Authenticator auth = new Authenticator() {
		        protected PasswordAuthentication getPasswordAuthentication() {
		          return new PasswordAuthentication(username, password);
		        }
		      };
		      
		      // 메일 세션 생성
		      Session session = Session.getInstance(props, auth);
		      
		      // 메일 송/수신 옵션 설정
		      Message message = new MimeMessage(session);
		      message.setFrom(new InternetAddress(fromEmail, fromUsername));
		      message.setRecipients(RecipientType.TO, InternetAddress.parse(customerEmail, false));
		      message.setSubject(subject);
		      message.setSentDate(new Date());
		      
		      // 메일 콘텐츠 설정
		      Multipart mParts = new MimeMultipart();
		      MimeBodyPart mTextPart = new MimeBodyPart();
		      MimeBodyPart mFilePart = null;
		 
		      // 메일 콘텐츠 - 내용
		      mTextPart.setText(html, bodyEncoding, "html");
		      mParts.addBodyPart(mTextPart);
		            
		      // 메일 콘텐츠 설정
		      message.setContent(mParts);
		      
		      // MIME 타입 설정
		      MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
		      MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
		      MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
		      MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
		      MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
		      MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
		      CommandMap.setDefaultCommandMap(MailcapCmdMap);
		 
		      // 메일 발송
		      Transport.send( message );
		      
		    } catch ( Exception e ) {
		      e.printStackTrace();
		    }
		    
		}

		public static void sendTempPWD(String customerID, String customerEmail, String tempPWD) {
			final String bodyEncoding = "UTF-8"; //콘텐츠 인코딩
			final String username = "noreply@vinocturne.cafe24.com";//"noreply@vinocturne.cafe24.com";  // like yourname@outlook.com
		    final String password = "standard1@";   // password here
		    String fromEmail = "noreply@ourstandard.shop";
			String fromUsername = "OURSTANDARD MANAGER";
			String subject ="ourstandard 임시비밀번호 발송";
		    
		    // 메일에 출력할 텍스트
		    StringBuffer sb = new StringBuffer();
		    sb.append("<h3>안녕하세요!"+customerID+"님!</h3>\n");
		    sb.append("<h4>스탠다드 운영진입니다</h4>\n");
		    sb.append("<h4>임시 비밀번호 발송해드립니다. 고객님의 임시 비밀번호는 </h4>\n"+"<h2>"+tempPWD+"</h2>");
		    sb.append("<h4>입니다.</h4>");
		    
		    String html = sb.toString();
		    
		    // 메일 옵션 설정
		    Properties props = new Properties();    
		    props.put("mail.smtp.auth", "true");
		       props.put("mail.smtp.starttls.enable", "true");
		       props.put("mail.smtp.host", "smtp.cafe24.com");
		       props.put("mail.smtp.port", "25");
		    
		    try {
		      // 메일 서버  인증 계정 설정
		      Authenticator auth = new Authenticator() {
		        protected PasswordAuthentication getPasswordAuthentication() {
		          return new PasswordAuthentication(username, password);
		        }
		      };
		      
		      // 메일 세션 생성
		      Session session = Session.getInstance(props, auth);
		      
		      // 메일 송/수신 옵션 설정
		      Message message = new MimeMessage(session);
		      message.setFrom(new InternetAddress(fromEmail, fromUsername));
		      message.setRecipients(RecipientType.TO, InternetAddress.parse(customerEmail, false));
		      message.setSubject(subject);
		      message.setSentDate(new Date());
		      
		      // 메일 콘텐츠 설정
		      Multipart mParts = new MimeMultipart();
		      MimeBodyPart mTextPart = new MimeBodyPart();
		      MimeBodyPart mFilePart = null;
		 
		      // 메일 콘텐츠 - 내용
		      mTextPart.setText(html, bodyEncoding, "html");
		      mParts.addBodyPart(mTextPart);
		            
		      // 메일 콘텐츠 설정
		      message.setContent(mParts);
		      
		      // MIME 타입 설정
		      MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
		      MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
		      MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
		      MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
		      MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
		      MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
		      CommandMap.setDefaultCommandMap(MailcapCmdMap);
		 
		      // 메일 발송
		      Transport.send( message );
		      
		    } catch ( Exception e ) {
		      e.printStackTrace();
		    }
		    
		}

			
		}
//public static void main(String[] args) {
//final String username = "noreply@vinocturne.cafe24.com";//"noreply@vinocturne.cafe24.com";  // like yourname@outlook.com
//final String password = "standard1@";   // password here
//String fromEmail = "noreply@ourstandard.shop";
// String fromUsername = "SYSTEM MANAGER";
//Properties props = new Properties();
//props.put("mail.smtp.auth", "true");
//props.put("mail.smtp.starttls.enable", "true");
//props.put("mail.smtp.host", "smtp.cafe24.com");
//props.put("mail.smtp.port", "25");
//
//
//
//Session session = Session.getInstance(props,
//  new javax.mail.Authenticator() {
//    @Override
//    protected PasswordAuthentication getPasswordAuthentication() {
//        return new PasswordAuthentication(username, password);
//    }
//  });
//session.setDebug(true);
//
//try {
//
//    Message message = new MimeMessage(session);
//    message.setFrom(new InternetAddress(fromEmail));
//    message.setRecipients(Message.RecipientType.TO,
//        InternetAddress.parse("vinocturne@naver.com"));   // like inzi769@gmail.com
//    message.setSubject("제목 자바 이멜 테스트");
//    message.setText("이거슨 카페24메일에서 구글을 연동해서 자바로 보내는 이메일이다.");
//
//    Transport.send(message);
//
//    System.out.println("Done");
//
//} catch (MessagingException e) {
//    throw new RuntimeException(e);
//}
//}
		
			


