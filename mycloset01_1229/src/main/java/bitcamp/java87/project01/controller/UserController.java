package bitcamp.java87.project01.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import bitcamp.java87.project01.domain.Page;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.service.UserService;


@Controller
@RequestMapping("/user/*")
public class UserController {

	
	
	///Field
	@Autowired
	private ServletContext sc;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
		
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
	
	MultipartFile file = req.getFile("testFile");
	
	
	User user = new User();
	
	
	if(file.getSize() != 0) {
		System.out.println("사진변경했을때");
		String basePath=sc.getRealPath("/fileUpload/"+file.getOriginalFilename());
		file.transferTo(new File(basePath));
	}
   if(file.getOriginalFilename() == ""){
	   System.out.println("사진변경안했을때");
		if(req.getParameter("email") != null)
		user.setPhot_path(userService.getUser(req.getParameter("email")).getPhot_path());
	}else{
		user.setPhot_path(file.getOriginalFilename());
	}
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
	

	
	@RequestMapping( value="getJsonBot/{page}", method=RequestMethod.GET )
	public ResponseEntity<String> getJsonBot(@PathVariable String page, 
									 			Model model) throws Exception{
		
		System.out.println("/getJsonUser/getUser : GET");
		//Business Logic
		System.out.println("page값:"+page);
		// Model 과 View 연결
		
		JSONObject obj=new JSONObject();
		obj.put("page","20");
		
		HttpHeaders headers = new HttpHeaders();
		 headers.add("Content-Type", "text/plain;charset=UTF-8");
			
	    
	    return new ResponseEntity<>(
	      obj.toJSONString(),
	        headers,
	        HttpStatus.OK);
	}
	
	@RequestMapping( value="/getJsonBot", method=RequestMethod.POST)
	public @ResponseBody JSONObject getJsonBot(String page) throws Exception{
		
		System.out.println("/getJsonUser/getUser : POST");
		//Business Logic
		System.out.println("page값:"+page);
		// Model 과 View 연결
		
		JSONObject obj=new JSONObject();
		obj.put("page","20");
		
		HttpHeaders headers = new HttpHeaders();
		 headers.add("Content-Type", "text/plain;charset=UTF-8");
			
	    
	    return  obj;
	    }
	
	@RequestMapping( value="botPage", method=RequestMethod.GET )
	public String botPage(@RequestParam("page") String page ) throws Exception{
		
		System.out.println("/user/botPage: GET");
		System.out.println("page:"+page);
		page="20";
		return page;
	}
	
	
	
	
}