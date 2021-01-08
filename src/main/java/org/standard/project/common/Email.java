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
//	public static void main(String[] args) throws MessagingException {
//		sendFindIdResult("xun","xun415@naver.com");
//	}
		public static void sendFindIdResult(String customerID, String customerEmail) throws MessagingException{
			final String bodyEncoding = "UTF-8"; //콘텐츠 인코딩
		    //제목
		    String subject = "아이디 찾기 결과";
		    //보내는 사람 이메일
		    String fromEmail = "noreply@ourstandard.shop";
		    //보내는 사람
		    String fromUsername = "SYSTEM MANAGER";
		    //받는 사람 이메일
		    String toEmail = customerEmail; // 콤마(,)로 여러개 나열
		    //태훈 프로젝트용 구글 아이디
		    final String username = "noreply@ourstandard.shop"; 
		    //비밀번호 일단 표시 안함
		    final String password = "standard1@";
		    
		    // 메일에 출력할 텍스트
		    StringBuffer sb = new StringBuffer();
		    sb.append("<h3>안녕하세요</h3>\n");
		    sb.append("<h4>스탠다드 운영진입니다</h4>\n");
		    sb.append("<h4>아이디 찾기 결과입니다. 고객님의 아이디는 </h4>\n"+"<h2>"+customerID+"</h2>");
		    sb.append("<h4>입니다.</h4>");
		    
		    String html = sb.toString();
		    
		    // 메일 옵션 설정
		    Properties props = new Properties();    
		    props.put("mail.transport.protocol","smtp");
		    props.put("mail.smtp.host","mw-002.cafe24.com");
		    props.put("mail.smtp.port","25");
		    props.put("mail.smtp.auth","true");
		 
		    props.put("mail.smtp.quitwait", "false");
		    props.put("mail.smtp.socketFactory.port","25");
		    props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		    props.put("mail.smtp.socketFactory.fallback","false");
		    
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
		      message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
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
		    //제목
		    String subject = "임시 비밀번호 발송";
		    //보내는 사람 이메일
		    String fromEmail = "noreply@ourstandard.shop";
		    //보내는 사람
		    String fromUsername = "SYSTEM MANAGER";
		    //받는 사람 이메일
		    String toEmail = customerEmail; // 콤마(,)로 여러개 나열
		    final String username = "noreply@ourstandard.shop"; 
		    final String password = "standard1@";
		    
		    // 메일에 출력할 텍스트
		    StringBuffer sb = new StringBuffer();
		    sb.append("<h3>안녕하세요!"+customerID+"님!</h3>\n");
		    sb.append("<h4>스탠다드 운영진입니다</h4>\n");
		    sb.append("<h4>임시 비밀번호 발송해드립니다. 고객님의 임시 비밀번호는 </h4>\n"+"<h2>"+tempPWD+"</h2>");
		    sb.append("<h4>입니다.</h4>");
		    
		    String html = sb.toString();
		    
		    // 메일 옵션 설정
		    Properties props = new Properties();    
		    props.put("mail.transport.protocol","smtp");
		    props.put("mail.smtp.host","mw-002.cafe24.com");
		    props.put("mail.smtp.port","587");
		    props.put("mail.smtp.auth","true");
		 
		    props.put("mail.smtp.quitwait","false");
		    props.put("mail.smtp.socketFactory.port","587");
		    props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		    props.put("mail.smtp.socketFactory.fallback","false");
		    
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
		      message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
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
		
			


