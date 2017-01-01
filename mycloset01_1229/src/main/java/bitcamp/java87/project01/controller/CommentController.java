package bitcamp.java87.project01.controller;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.MultipartResolver;

import bitcamp.java87.project01.domain.Page;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.Style;
import bitcamp.java87.project01.domain.User;

import bitcamp.java87.project01.domain.Comment;
import bitcamp.java87.project01.service.CommentService;
import bitcamp.java87.project01.service.StyleService;
import bitcamp.java87.project01.service.UserService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {

  /// Field
  @Autowired
  @Qualifier("commentServiceImpl")
  private CommentService commentService;

  @Autowired
  @Qualifier("userServiceImpl")
  private UserService userService;

  @Autowired
  @Qualifier("StyleServiceImpl")
  private StyleService styleService;

  public CommentController() {
    System.out.println("여기는또 어디냐" + this.getClass());
  }

  @Value("#{commonProperties['pageUnit']}")
  int pageUnit;

  @Value("#{commonProperties['pageSize']}")
  int pageSize;

  // @RequestMapping("/addUserView.do")
  // public String addUserView() throws Exception {
  @RequestMapping(value = "addComment", method = RequestMethod.POST)
  public String addComment(@ModelAttribute("comment") Comment comment, HttpSession session) throws Exception {
   System.out.println("addComment : start()...");
   System.out.println("asdf"+comment);
   User user = (User)session.getAttribute("user"); 
   
   comment.setUserNo(user.getUser_no());
   comment.setNick(user.getNick());
   
   System.out.println(comment);
  
   commentService.addComment(comment);
   System.out.println("/comment/addComment : POST 여기는 코멘트콘트롤러");
    
     return "redirect:/comment/comment.jsp";
  }

  @RequestMapping(value="getCommentList", method = RequestMethod.POST)
  public 
  
  /*
   * //@RequestMapping("/addUser.do")
   * 
   * @RequestMapping( value="addUser", method=RequestMethod.POST ) public String
   * addUser( @ModelAttribute("user") User user,HttpSession session) throws
   * Exception {
   * 
   * System.out.println("/user/addUser : POST"); //Business Logic
   * user.setPhot_path("images.png"); userService.addUser(user); if(user
   * !=null){ session.setAttribute("user", user); } return
   * "redirect:/main/main.jsp"; }
   * 
   * //@RequestMapping("/getUser.do")
   * 
   * @RequestMapping( value="getUser", method=RequestMethod.GET ) public String
   * getUser( @RequestParam("userId") String userId , Model model ) throws
   * Exception {
   * 
   * System.out.println("/user/getUser : GET"); //Business Logic User user =
   * userService.getUser(userId); model.addAttribute("user", user);
   * 
   * return "forward:/user/getUser.jsp"; }
   * 
   * //@RequestMapping("/updateUserView.do") //public String
   * updateUserView( @RequestParam("userId") String userId , Model model )
   * throws Exception{
   * 
   * @RequestMapping( value="updateUser", method=RequestMethod.GET ) public
   * String updateUser( @RequestParam("userId") String userId , Model model )
   * throws Exception{
   * 
   * System.out.println("/user/updateUser : GET"); //Business Logic User user =
   * userService.getUser(userId); model.addAttribute("user", user);
   * 
   * return "forward:/user/updateUser.jsp"; }
   * 
   * @RequestMapping( value="updateUser", method=RequestMethod.POST )
   * public @ResponseBody User updateUser(String nick , String pwd) throws
   * Exception{
   * 
   * System.out.println("/user/updateUser : post"); User user = new User();
   * user.setEmail("강요셉@강요셉.com"); return user; }
   * 
   * @RequestMapping (value="updateUser", method=RequestMethod.POST )
   * public @ResponseBody User updateUser(MultipartHttpServletRequest req,
   * HttpSession session) throws Exception {
   * 
   * MultipartFile file = req.getFile("testFile"); User user = new User();
   * 
   * if(file.getSize() != 0) { System.out.println("사진파일"); String path
   * ="C:\\messengerBot\\mycloset01\\src\\main\\webapp\\header\\upload\\"+file.
   * getOriginalFilename(); file.transferTo(new File(path)); }
   * if(file.getOriginalFilename() == ""){ if(req.getParameter("email") != null)
   * user.setPhot_path(userService.getUser(req.getParameter("email")).
   * getPhot_path()); }else{ user.setPhot_path(file.getOriginalFilename()); }
   * user.setEmail(req.getParameter("email"));
   * user.setPwd(req.getParameter("pwd"));
   * user.setNick(req.getParameter("nick"));
   * 
   * session.setAttribute("user", user); userService.updateUser(user);
   * 
   * 
   * return user; }
   * 
   * @RequestMapping (value="detailUser", method=RequestMethod.POST ) public
   * String detailUser(HttpSession session) throws Exception {
   * 
   * MultipartFile file = req.getFile("testFile"); User user = new User();
   * 
   * if(file.getSize() != 0) { System.out.println("사진파일"); String path
   * ="C:\\messengerBot\\mycloset01\\src\\main\\webapp\\header\\upload\\"+file.
   * getOriginalFilename(); file.transferTo(new File(path)); }
   * if(file.getOriginalFilename() == ""){ if(req.getParameter("email") != null)
   * user.setPhot_path(userService.getUser(req.getParameter("email")).
   * getPhot_path()); }else{ user.setPhot_path(file.getOriginalFilename()); }
   * user.setEmail(req.getParameter("email"));
   * user.setPwd(req.getParameter("pwd"));
   * user.setNick(req.getParameter("nick"));
   * 
   * session.setAttribute("user", user); userService.updateUser(user);
   * 
   * 
   * return "forward:/index.jsp"; }
   * 
   * 
   * 
   * @RequestMapping (value="faceupdateUser", method=RequestMethod.POST )
   * public @ResponseBody User faceupdateUser(String email, String nick,
   * HttpSession session) throws Exception {
   * System.out.println("여기 파일업로드 컨트롤러");
   * 
   * User user = new User(); user.setNick(nick); user.setEmail(email);
   * 
   * userService.faceupdateUser(user);
   * user=userService.getUser(user.getEmail()); session.setAttribute("faceUser",
   * user); System.out.println("여기 유저업데이트 디비후");
   * 
   * 
   * return user; }
   * 
   * 
   * //@RequestMapping("/updateUser.do")
   * 
   * @RequestMapping( value="updateUser", method=RequestMethod.POST ) public
   * String updateUser( @ModelAttribute("user") User user , Model model ,
   * HttpSession session) throws Exception{
   * 
   * System.out.println("/user/updateUser : POST"); //Business Logic
   * userService.updateUser(user);
   * 
   * String sessionId=((User)session.getAttribute("user")).getUserId();
   * if(sessionId.equals(user.getUserId())){ session.setAttribute("user", user);
   * }
   * 
   * //return "redirect:/getUser.do?userId="+user.getUserId(); return
   * "redirect:/user/getUser?userId="+user.getUserId(); }
   * 
   * //@RequestMapping("/loginView.do") //public String loginView() throws
   * Exception{
   * 
   * @RequestMapping( value="login", method=RequestMethod.GET ) public String
   * login( @RequestParam("email") String email , @RequestParam("name") String
   * name) throws Exception{
   * 
   * System.out.println("/user/logon : GET"); System.out.println("이메일:"+email);
   * System.out.println("이름:"+name); return "redirect:/index.jsp"; }
   * 
   * //@RequestMapping("/login.do")
   * 
   * @RequestMapping( value="login", method=RequestMethod.POST ) public String
   * login(@ModelAttribute("user") User user ,Model model ,HttpSession session)
   * throws Exception{
   * 
   * System.out.println("여기 userController:/user/login : POST"); //Business
   * Logic
   * 
   * if( userService.getUser(user.getEmail()) != null &&
   * userService.getUser(user.getEmail()).getPwd().equals(user.getPwd()) ){
   * model.addAttribute("user", userService.getUser(user.getEmail()));
   * session.setAttribute("user", user); return "redirect:/index.jsp"; }
   * 
   * model.addAttribute( "userLogin", userService.getUser(user.getEmail()));
   * return "redirect:/front.jsp";
   * 
   * }
   * 
   * @RequestMapping( value="login", method=RequestMethod.POST )
   * public @ResponseBody User login(String email, String pwd, HttpSession
   * session) throws Exception{ System.out.println("로그인안돼"); User
   * user=userService.getUser(email);
   * if(user.getPwd().trim().equals(pwd.trim())){ System.out.println("세션");
   * session.setAttribute("user",user); } return user; }
   * 
   * @RequestMapping( value="loginCheck", method=RequestMethod.POST )
   * public @ResponseBody User loginCheck(String email) throws Exception{
   * System.out.println("체크메서드:"+email); User user=userService.getUser(email);
   * 
   * return user; }
   * 
   * @RequestMapping( value="facebook", method=RequestMethod.POST )
   * public @ResponseBody User facebook(String email ,HttpSession session)
   * throws Exception{
   * 
   * System.out.println("email:"+email); User user=userService.getUser(email);
   * System.out.println("페이스 북로그인 세션만들기"); System.out.println(user); if(user !=
   * null){ session.setAttribute("faceUser",user); } return user; }
   * 
   * @RequestMapping( value="fbaddUser", method=RequestMethod.POST )
   * public @ResponseBody void fbaddUser(String nick,String email, String pwd,
   * String phot_path, HttpSession session) throws Exception{ User user = new
   * User(); user.setNick(nick); user.setEmail(email); user.setPwd(pwd);
   * user.setPhot_path(phot_path);
   * 
   * System.out.println("add세션만들기"+user); userService.addUser(user);
   * 
   * if(user != null){ session.setAttribute("faceUser",user); } }
   * 
   * //@RequestMapping("/logout.do")
   * 
   * @RequestMapping( value="logout", method=RequestMethod.GET ) public String
   * logout(HttpSession session ) throws Exception{
   * 
   * System.out.println("/user/logout : POST");
   * 
   * session.invalidate(); session.invalidate();
   * 
   * return "redirect:..index.jsp"; }
   * 
   * 
   * //@RequestMapping("/checkDuplication.do")
   * 
   * @RequestMapping( value="checkDuplication", method=RequestMethod.POST )
   * public String checkDuplication( @RequestParam("email") String email , Model
   * model ) throws Exception{
   * 
   * System.out.println("여기 유저컨트롤러"+"/user/checkDuplication : POST"); //Business
   * Logic boolean result=userService.checkDuplication(email);
   * model.addAttribute("result", new Boolean(result));
   * model.addAttribute("email", email);
   * 
   * return "forward:/user/checkDuplication.jsp"; }
   * 
   * //@RequestMapping("/listUser.do")
   * 
   * @RequestMapping( value="listUser" ) public String
   * listUser( @ModelAttribute("search") Search search , Model model ,
   * HttpServletRequest request) throws Exception{
   * 
   * System.out.println("/user/listUser : GET / POST");
   * 
   * if(search.getCurrentPage() ==0 ){ search.setCurrentPage(1); }
   * search.setPageSize(pageSize);
   * 
   * Map<String , Object> map=userService.getUserList(search);
   * 
   * Page resultPage = new Page( search.getCurrentPage(),
   * ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
   * System.out.println(resultPage);
   * 
   * model.addAttribute("list", map.get("list"));
   * model.addAttribute("resultPage", resultPage); model.addAttribute("search",
   * search);
   * 
   * return "forward:/user/listUser.jsp"; }
   */
}