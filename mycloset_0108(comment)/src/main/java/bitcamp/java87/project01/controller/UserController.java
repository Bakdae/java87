package bitcamp.java87.project01.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.Gson;

import bitcamp.java87.project01.domain.EmailKey;
import bitcamp.java87.project01.domain.Page;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.Style;
import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.service.StyleService;
import bitcamp.java87.project01.service.UserService;
import javax.mail.internet.InternetAddress;
import javax.mail.Address;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Authenticator;
import javax.mail.Message;

import java.util.Properties;
import bitcamp.java87.project01.common.SMTPAuthenticator;

@Controller
@RequestMapping("/user/*")
public class UserController {

	
	
	///Field
	@Autowired
	private ServletContext sc;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
		
	@Autowired
	@Qualifier("StyleServiceImpl")
	private StyleService styleService;
	
	
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	


	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user,HttpSession session) throws Exception {

		System.out.println("/user/addUser : POST");
		//Business Logic
		user.setPhot_path("images.png");
	    userService.addUser(user);
	    user = userService.getUser(user.getEmail());
	    
		if(user !=null){
		  session.setAttribute("user", user);
		}
		return "redirect:/main/main.jsp";
	}
	
	
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
		
	@RequestMapping (value="updateUser", method=RequestMethod.POST ) 
	public @ResponseBody User updateUser(MultipartHttpServletRequest req, HttpSession session ) throws Exception {
	System.out.println("여기 업데이트 컨트롤러");
	MultipartFile file = req.getFile("testFile");
	
	
	User user = new User();
	
	
	if(file.getSize() != 0) {
		System.out.println("사진변경했을때");
		String basePath=sc.getRealPath("/fileUpload/"+file.getOriginalFilename());
		System.out.println("파일경로:"+basePath);
		file.transferTo(new File(basePath));
	}
   if(file.getOriginalFilename() == ""){
	   System.out.println("사진변경안했을때");
		if(req.getParameter("email") != null)
		user.setPhot_path(userService.getUser(req.getParameter("email")).getPhot_path());
	}else{
		user.setPhot_path(file.getOriginalFilename());
	}
   
    user.setUser_no(Integer.parseInt(req.getParameter("user_no")));
    user.setEmail(req.getParameter("email"));
	user.setPwd(req.getParameter("pwd"));
	user.setNick(req.getParameter("nick"));
   
	System.out.println("셋팅된 유저값:"+user);
	session.setAttribute("user", user);
	userService.updateUser(user);
	
	
	return user;
	}
	
		
	
	
	@RequestMapping (value="faceupdateUser", method=RequestMethod.POST )
	public @ResponseBody User faceupdateUser(String email, String nick, HttpSession session) throws Exception {
	System.out.println("여기 파일업로드 컨트롤러");
	
	User user = new User();
	user.setNick(nick);
	user.setEmail(email);
	
	userService.faceupdateUser(user);
	user=userService.getUser(user.getEmail());
	session.setAttribute("faceUser", user);
	System.out.println("여기 유저업데이트 디비후");
	
	
	return user;
	}
	
	
	
	
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login( @RequestParam("email") String email , @RequestParam("name") String name) throws Exception{
		
		System.out.println("/user/logon : GET");
		System.out.println("이메일:"+email);
		System.out.println("이름:"+name);
		return "redirect:/index.jsp";
	}
	
	
	@RequestMapping( value="login", method=RequestMethod.POST )
  public @ResponseBody User login(String email, String pwd, HttpSession session) throws Exception{
		
		User user=userService.getUser(email);
	    if(user.getPwd().trim().equals(pwd.trim())){
	      System.out.println("세션");
  	     session.setAttribute("user",user);
	    }
	  return user; 
	}
	
	@RequestMapping( value="emailok", method=RequestMethod.GET)
	  public @ResponseBody User emailok(String email) throws Exception{
		  
		  System.out.println("이메일 OK");	
		  User user=userService.getUser(email);
		  System.out.println("이메일 디비후 OK");
		  return user; 
	}
	
	
	
	@RequestMapping( value="loginCheck", method=RequestMethod.POST )
	  public @ResponseBody User loginCheck(String email) throws Exception{
		  System.out.println("체크메서드:"+email);
		  User user=userService.getUser(email);
		    
		  return user; 
		}
	
	@RequestMapping( value="facebook", method=RequestMethod.POST )
  public @ResponseBody User facebook(String email ,HttpSession session) throws Exception{
    
		System.out.println("email:"+email);
	  User user=userService.getUser(email);
	  System.out.println("페이스 북로그인 세션만들기");
	  System.out.println(user);
    if(user != null){
      session.setAttribute("faceUser",user);
    }
    return user; 
  }
	
	@RequestMapping( value="faceLogout", method=RequestMethod.GET )
	  public String  faceLogout(HttpSession session) throws Exception{
		System.out.println("페이스 로그아웃");
			session.invalidate();
		
	    return "redirect:/index.jsp";
	    		
	  }
	
	
	@RequestMapping( value="fbaddUser", method=RequestMethod.POST )
  public @ResponseBody void fbaddUser(String nick,String email, String pwd, String phot_path, HttpSession session) throws Exception{
	  User user = new User();
	  user.setNick(nick);
	  user.setEmail(email);
	  user.setPwd(pwd);
	  user.setPhot_path(phot_path);
	  
    System.out.println("add세션만들기"+user);
    userService.addUser(user);
   
    if(user != null){
      session.setAttribute("faceUser",user);
    }
 }
	

	@RequestMapping( value="checkDuplication", method=RequestMethod.POST )
	public String checkDuplication( @RequestParam("email") String email , Model model ) throws Exception{
		
		System.out.println("여기 유저컨트롤러"+"/user/checkDuplication : POST");
		//Business Logic
		boolean result=userService.checkDuplication(email);
		model.addAttribute("result", new Boolean(result));
		model.addAttribute("email", email);

		return "forward:/user/checkDuplication.jsp";
	}
	

	
	@RequestMapping( value="getJsonBot/{count}/{type}", method=RequestMethod.GET )
	public ResponseEntity<String> getJsonBot(@PathVariable String count,@PathVariable String type, 
									 			Model model) throws Exception{
		
			
		System.out.println("/getJsonUser/getUser : GET");
		//Business Logic
		System.out.println("count값:"+count);
		System.out.println("type값:"+type);
		// Model 과 View 연결
		
		if(type.trim().equals("mans")){
				
			   Search search = new Search(60,0,"#남자");
			   System.out.println("컨트롤전 ");
		       Map<String,Object> map = styleService.getStyleList(search);
		       System.out.println("컨트롤러후");
		       List list = (List) map.get("list");
		       Style ss = (Style)list.get(Integer.parseInt(count));
		       Style ss2 = (Style)list.get(Integer.parseInt(count)+1);
		       System.out.println("컨트롤러에서의 디버깅 "+ss);
		       System.out.println("11111"+ss.getHashTagString());
		       System.out.println("2222"+ss2.getHashTagString());
		       JSONObject obj=new JSONObject();
		       obj.put("styleNo1",ss.getStyleNo());
		       obj.put("stylePath1",ss.getTnFileName());
		       obj.put("styleTitle1",ss.getStyleTitle());
		       obj.put("styleDesc1",ss.getHashTagString());
		       
		       obj.put("styleNo2",ss2.getStyleNo());
		       obj.put("stylePath2",ss2.getTnFileName());
		       obj.put("styleTitle2",ss2.getStyleTitle());
		       obj.put("styleDesc2",ss2.getHashTagString());
				HttpHeaders headers = new HttpHeaders();
				 headers.add("Content-Type", "text/plain;charset=UTF-8");
					
			    
			    return new ResponseEntity<>(
			      obj.toString(),
			        headers,
			        HttpStatus.OK);
		}else if(type.trim().equals("woman")){
			 
			  Search search = new Search(60,0,"#여자");
			   System.out.println("컨트롤전 ");
		       Map<String,Object> map = styleService.getStyleList(search);
		       System.out.println("컨트롤러후");
		       List list = (List) map.get("list");
		       Style ss = (Style) list.get(Integer.parseInt(count));
		       Style ss2 = (Style) list.get(Integer.parseInt(count)+1);
		       System.out.println("컨트롤러에서의 디버깅 "+ss);
		       System.out.println("11111"+ss.getHashTagString());
		       System.out.println("2222"+ss2.getHashTagString());
		       
		       JSONObject obj=new JSONObject();
		        
		       obj.put("styleNo1",ss.getStyleNo());
		       obj.put("stylePath1",ss.getTnFileName());
		       obj.put("styleTitle1",ss.getStyleTitle());
		       obj.put("styleDesc1",ss.getHashTagString());
		       
		       obj.put("styleNo2",ss2.getStyleNo());
		       obj.put("stylePath2",ss2.getTnFileName());
		       obj.put("styleTitle2",ss2.getStyleTitle());
		       obj.put("styleDesc2",ss2.getHashTagString());
			   
				HttpHeaders headers = new HttpHeaders();
				 headers.add("Content-Type", "text/plain;charset=UTF-8");
					
			    
			    return new ResponseEntity<>(
			      obj.toJSONString(),
			        headers,
			        HttpStatus.OK);
			
		}else{
			
			  Search search = new Search(60,0,"#데일리");
			   System.out.println("컨트롤전 ");
		       Map<String,Object> map = styleService.getStyleList(search);
		       System.out.println("컨트롤러후");
		       List list = (List) map.get("list");
		       Style ss = (Style) list.get(Integer.parseInt(count));
		       Style ss2 = (Style) list.get(Integer.parseInt(count)+1);
		       System.out.println("컨트롤러에서의 디버깅 "+ss);
		       System.out.println("11111"+ss.getHashTagString());
		       System.out.println("2222"+ss2.getHashTagString());  
		       JSONObject obj=new JSONObject();
		       obj.put("styleNo1",ss.getStyleNo());
		       obj.put("stylePath1",ss.getTnFileName());
		       obj.put("styleTitle1",ss.getStyleTitle());
		       obj.put("styleDesc1",ss.getHashTagString());
		       
		       obj.put("styleNo2",ss2.getStyleNo());
		       obj.put("stylePath2",ss2.getTnFileName());
		       obj.put("styleTitle2",ss2.getStyleTitle());
		       obj.put("styleDesc2",ss2.getHashTagString());
		       
		     
				HttpHeaders headers = new HttpHeaders();
				 headers.add("Content-Type", "text/plain;charset=UTF-8");
					
			    
			    return new ResponseEntity<>(
			      obj.toJSONString(),
			        headers,
			        HttpStatus.OK);
			
		}
	
	}
	
	
	
	
	
	@RequestMapping( value="emailKey", method=RequestMethod.POST )
	public @ResponseBody Boolean emailKey(String emailNum ,HttpSession session ) throws Exception{
		System.out.println("여긴 이메일인증키확인");
		System.out.println("인증번호:"+emailNum);
		 
		EmailKey ekey=(EmailKey)session.getAttribute("ekey");
		
		if(emailNum.trim().equals(ekey.getKeyNum().trim())){
			System.out.println("인증번호 같다.");
			session.invalidate();
			return true;
		}
		System.out.println("인증번호 틀림.");
		return false;
	}
	
	@RequestMapping( value="emailCheck", method=RequestMethod.POST )
	public @ResponseBody String emailCheck(String emailBtn1, HttpSession session) throws Exception{
		System.out.println("여긴 이메일체크");
		
		String sender = "mycloset.test@gmail.com";
		String receiver = emailBtn1;
		String subject ="mycloset인증번호발송.";
		String str = ((int)(Math.random() * 8999)+1000)+"";
		EmailKey ekey =  new EmailKey();
		ekey.setKeyNum(str);
		System.out.println("이메일:"+emailBtn1);
		session.setAttribute("ekey", ekey);
		System.out.println("이메일 인증번호:"+str);
		String content = "<h2 style='color:blue'>"+str+"</h2>";
		content+= "인증번호를 입력해주세요.";
		Properties p = new Properties();

		//SMTP 서버의 계정 설정
		//Naver와 연결할 경우 네이버 아이디 지정
		//Google과 연결할 경우 본인의 Gmail 주소
		p.put("mail.smtp.user", "mycloset.test@gmail.com");

		//SMTP 서버 정보 설정
		//네이버일 경우 smtp.naver.com
		//Google일 경우 smtp.gmail.com
		p.put("mail.smtp.host", "smtp.gmail.com");
		 
		//아래 정보는 네이버와 구글이 동일하므로 수정하지 마세요.
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");


		try {
		  Authenticator auth = new SMTPAuthenticator();
		  Session ses = Session.getInstance(p, auth);

		  // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
		  ses.setDebug(true);
		      
		  // 메일의 내용을 담기 위한 객체
		  MimeMessage msg = new MimeMessage(ses);

		  // 제목 설정
		  msg.setSubject(subject);
		      
		  // 보내는 사람의 메일주소
		  Address fromAddr = new InternetAddress(sender);
		  msg.setFrom(fromAddr);
		      
		  // 받는 사람의 메일주소
		  Address toAddr = new InternetAddress(receiver);
		  msg.addRecipient(Message.RecipientType.TO, toAddr);
		      
		  // 메시지 본문의 내용과 형식, 캐릭터 셋 설정
		  msg.setContent(content, "text/html;charset=UTF-8");
		      
		  // 발송하기
		  Transport.send(msg);
		      
		} catch (Exception mex) {
		  mex.printStackTrace();
		  String script="fail"; 
		  return script;
		}
		  
		String script ="success";
		
		return script;
	}
	
	
	@RequestMapping( value="findPwd", method=RequestMethod.POST )
	public @ResponseBody Boolean findPwd(String EmCheck, HttpSession session) throws Exception{
		System.out.println("여긴 이메일비밀번호 찾아주는곳");
		
		String sender = "mycloset.test@gmail.com";
		String receiver = EmCheck;
		String subject ="mycloset비밀번호발송.";
		String str = ((int)(Math.random() * 8999)+1000)+"";
			
		System.out.println("이메일 패스워드:"+str);
		
		
		
		
		
		String content = "<h2 style='color:red'>"+str+"</h2>";
		content+= " 보안을 위해 비밀번호를 수정해주십시오.";
		Properties p = new Properties();

		//SMTP 서버의 계정 설정
		//Naver와 연결할 경우 네이버 아이디 지정
		//Google과 연결할 경우 본인의 Gmail 주소
		p.put("mail.smtp.user", "mycloset.test@gmail.com");

		//SMTP 서버 정보 설정
		//네이버일 경우 smtp.naver.com
		//Google일 경우 smtp.gmail.com
		p.put("mail.smtp.host", "smtp.gmail.com");
		 
		//아래 정보는 네이버와 구글이 동일하므로 수정하지 마세요.
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");


		try {
		  Authenticator auth = new SMTPAuthenticator();
		  Session ses = Session.getInstance(p, auth);
		  User user =new User();
			//디비갔다왔는데 null일때
		  user=userService.getUser(receiver);
		   if(user==null ||user.equals("")){
			   System.out.println("이메일값 null일때");
			  return false;
		  }
		   
		   	user.setPwd(str);
		   	System.out.println("user값:"+user);
		   	userService.updateUser(user);
		   
		  // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
		  ses.setDebug(true);
		      
		  // 메일의 내용을 담기 위한 객체
		  MimeMessage msg = new MimeMessage(ses);

		  // 제목 설정
		  msg.setSubject(subject);
		      
		  // 보내는 사람의 메일주소
		  Address fromAddr = new InternetAddress(sender);
		  msg.setFrom(fromAddr);
		      
		  // 받는 사람의 메일주소
		  Address toAddr = new InternetAddress(receiver);
		  msg.addRecipient(Message.RecipientType.TO, toAddr);
		      
		  // 메시지 본문의 내용과 형식, 캐릭터 셋 설정
		  msg.setContent(content, "text/html;charset=UTF-8");
		      
		  // 발송하기
		  Transport.send(msg);
		
		
		} catch (Exception mex) {
		  mex.printStackTrace();
		  return false;
		}
	
		return true;
	}
	
	
}