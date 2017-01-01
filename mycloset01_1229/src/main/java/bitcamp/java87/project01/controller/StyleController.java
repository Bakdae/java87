package bitcamp.java87.project01.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import bitcamp.java87.project01.common.HashTag;
import bitcamp.java87.project01.common.JavaToJson;
import bitcamp.java87.project01.domain.Search;
import bitcamp.java87.project01.domain.Style;
import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.service.StyleService;
import bitcamp.java87.project01.service.UserService;

@Controller
@RequestMapping("/style/*") //
public class StyleController {
  @Autowired
  ServletContext sc;
  
  /// Field
  @Autowired
  @Qualifier("StyleServiceImpl")
  private StyleService styleService;
  
  @Autowired
  @Qualifier("userServiceImpl")
  private UserService userService;
  
  public StyleController() {
    System.out.println(this.getClass());
  }
  
  @Value("#{commonProperties['pageUnit']}")
  int pageUnit;
  
  @Value("#{commonProperties['pageSize']}")
  int pageSize;
  
  @Value("#{commonProperties['uploadPath']}")
  String uploadPath;
  
  @Value("#{commonProperties['uploadPath2']}")
  String uploadPath2;
  
  @SuppressWarnings("deprecation")
  @RequestMapping(value = "addStyle", method = RequestMethod.POST)
  public String addStyle(@ModelAttribute("style") Style style, @ModelAttribute("search") Search search,
     HttpServletRequest request, HttpSession session) throws Exception {
    
    System.out.println("/style/addStyle : POST");
    
    MultipartRequest multipartReq = (MultipartRequest) request;
    MultipartFile multipartFile = multipartReq.getFile("fileUpload");
    String fileName = multipartFile.getOriginalFilename();
    
    String body=fileName.split("\\.")[0];
    String extender=fileName.split("\\.")[1];
    
    String reFileName="";
    String tnReFileName="";
    String fileId="";
    
    if (multipartFile.isEmpty()) {
      System.out.println("## 비어있는 파일입니다!!");
    }
    
    try{
      
      System.out.println("업로드 디버깅 1");
      
      long t = System.currentTimeMillis();
      int r = (int)(Math.random()*10000000);
      fileId = ""+t+r;
      reFileName = body+"_"+fileId+"."+extender;
      tnReFileName = body+"_"+fileId;
      
      String basePath = sc.getRealPath("/fileUpload/"+reFileName);
      String tnBasePath = sc.getRealPath("/fileUpload/"+tnReFileName);
      System.out.println(basePath);
      
      FileOutputStream fos = new FileOutputStream(basePath);
      FileCopyUtils.copy(multipartFile.getInputStream(), fos);
      
      File origin_file_name = new File(basePath);
     
      // 생성할 썸네일파일의 경로+썸네일파일명
      File thumb_file_name = new File(tnBasePath+ "_thumbnail_image.jpg");
      
      BufferedImage buffer_original_image = ImageIO.read(origin_file_name);
      
      int originalImageHeight = buffer_original_image.getHeight();
      int originalImageWidth = buffer_original_image.getWidth();
      // 썸네일 가로사이즈
      int thumbnail_width = 210;
      // 썸네일 세로사이즈
      int thumbnail_height = (210 * originalImageHeight) / originalImageWidth;
      BufferedImage buffer_thumbnail_image = new BufferedImage(thumbnail_width, thumbnail_height,
          BufferedImage.TYPE_3BYTE_BGR);
      Graphics2D graphic = buffer_thumbnail_image.createGraphics();
      graphic.drawImage(buffer_original_image, 0, 0, thumbnail_width, thumbnail_height, null);
      
      ImageIO.write(buffer_thumbnail_image, "jpg", thumb_file_name);
      
      System.out.println("썸네일 생성완료");
      System.out.println("파일 업로드 성공");
      
    }catch(IOException e){
      System.out.println("파일 업로드 실패");
      e.printStackTrace();
    }
    
    User user = new User();
    if(session.getAttribute("user")==null){
    	  user=(User)session.getAttribute("faceUser");
    }
    else{
    	 user =(User)session.getAttribute("user");
    }
  
    
    user= userService.getUser(user.getEmail());
    style.setUser_no(user);
    System.out.println("user값::::::::::::::::::::::::::"+user);  
    
    //해시태그 파싱
    style.setInfomation1(request.getParameter("styleInfo1")+"`"+request.getParameter("priceInfo1")+"`"+request.getParameter("styleTagPosition1"));
    style.setInfomation2(request.getParameter("styleInfo2")+"`"+request.getParameter("priceInfo2")+"`"+request.getParameter("styleTagPosition2"));
    style.setInfomation3(request.getParameter("styleInfo3")+"`"+request.getParameter("priceInfo3")+"`"+request.getParameter("styleTagPosition3"));
    style.setInfomation4(request.getParameter("styleInfo4")+"`"+request.getParameter("priceInfo4")+"`"+request.getParameter("styleTagPosition4"));
    style.setInfomation5(request.getParameter("styleInfo5")+"`"+request.getParameter("priceInfo5")+"`"+request.getParameter("styleTagPosition5"));
    style.setHashTagString( ((new HashTag()).parsing(request.getParameter("styleDesc"))).replaceAll("\r\n", "") );
    style.setStyleDesc((request.getParameter("styleDesc")).replaceAll("\r\n", "<br/>"));
    style.setStyleLike("0");
    
    style.setFileName(reFileName);
    style.setTnFileName(body+"_"+fileId + "_thumbnail_image.jpg");
    
    System.out.println("style > "+style);
    
    styleService.addStyle(style);
    
    return "redirect:/main/main.jsp";
  }
  
  
  @RequestMapping(value="getStyleList", method=RequestMethod.POST)
  @ResponseBody
  public JSONArray getStyleList(@RequestParam() int pageNo, HttpServletRequest request, HttpSession session) throws Exception {
    
    System.out.println("  >>  /style/getStyleList 의 내부  >>");
    System.out.println(" 페이지 넘버 디버깅 : "+pageNo);
    // Business Logic
    Search search = new Search(60,pageNo);
    System.out.println("컨트롤전 ");
    Map<String,Object> map = styleService.getStyleList(search);
    System.out.println("컨트롤후 ");
    List list = (List) map.get("list");
    Style ss = (Style) list.get(0);
    System.out.println("컨트롤러에서의 디버깅 "+ss);
    
    return new JavaToJson().toJSONArray(list);
  }
  
  @RequestMapping(value = "getStyle", method = RequestMethod.POST)
  public String getStyle(@RequestParam() int styleNo, Model model) throws Exception {
    
    System.out.println("  >>  /style/getStyle : POST");
    System.out.println(styleNo);
    // Business Logic
    Style style = styleService.getStyle(styleNo);
    System.out.println(" style debugging > "+style);
    
    return null;
  }
  
  @RequestMapping("detailView")
  public String detailView(HttpServletRequest request, @RequestParam() int styleNo){
	  
	  System.out.println(" styleController >> detailView ");
	  System.out.println(" 디버깅 : "+styleNo);
	  
	  
	  return null;
  }
  
  /*@RequestMapping("listProduct")
  public String listProduct(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
      throws Exception {
    
    System.out.println("/product/listProduct : GET / POST");
    System.out.println(search);
    System.out.println(model);
    System.out.println(request);
    
    if (search.getCurrentPage() == 0) {
      search.setCurrentPage(1);
    }
    search.setPageSize(pageSize);
    
    Map<String, Object> map = productService.getProductList(search);
    
    Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
        pageSize);
    System.out.println(resultPage);
    
    model.addAttribute("list", map.get("list"));
    model.addAttribute("resultPage", resultPage);
    model.addAttribute("search", search);
    
    return "/main/main.jsp";
  }
  
  // @RequestMapping("/getUser.do")
  @RequestMapping(value = "getProduct", method = RequestMethod.GET)
  public String getProduct(@RequestParam() int prodNo, Model model, @RequestParam() String menu) throws Exception {
    
    System.out.println("/product/getProduct : GET");
    // Business Logic
    Product product = productService.getProduct(prodNo);
    model.addAttribute("product", product);
    model.addAttribute("menu", menu);
    
    return "forward:/product/getProduct.jsp";
  }
  
  // @RequestMapping("/updateUserView.do")
  // public String updateProduct( @RequestParam() String prodNo , Model model )
  // throws Exception{
  @RequestMapping(value = "updateProduct", method = RequestMethod.POST)
  public String updateUser(@ModelAttribute() Product product, Model model) throws Exception {
    
    System.out.println("/product/updateProduct : POST");
    System.out.println(product);
    System.out.println(model);
    
    productService.updateProduct(product);
    
    // Business Logic
    product = productService.getProduct(product.getProdNo());
    model.addAttribute("product", product);
    
    return "forward:/product/getProduct.jsp?menu=manage";
  }*/
  
  // @RequestMapping("/updateUser.do")
  // @RequestMapping( value="updateUser", method=RequestMethod.POST )
  // public String updateUser( @ModelAttribute("user") User user , Model model ,
  // HttpSession session) throws Exception{
  //
  // System.out.println("/user/updateUser : POST");
  // //Business Logic
  // userService.updateUser(user);
  //
  // String sessionId=((User)session.getAttribute("user")).getUserId();
  // if(sessionId.equals(user.getUserId())){
  // session.setAttribute("user", user);
  // }
  //
  // //return "redirect:/getUser.do?userId="+user.getUserId();
  // return "redirect:/user/getUser?userId="+user.getUserId();
  // }
  
  // @RequestMapping("/loginView.do")
  // public String loginView() throws Exception{
  // @RequestMapping( value="login", method=RequestMethod.GET )
  // public String login() throws Exception{
  //
  // System.out.println("/user/logon : GET");
  //
  // return "redirect:/user/loginView.jsp";
  // }
  
  // @RequestMapping("/login.do")
  // @RequestMapping( value="login", method=RequestMethod.POST )
  // public String login(@ModelAttribute("user") User user , HttpSession session
  // ) throws Exception{
  //
  // System.out.println("/user/login : POST");
  // //Business Logic
  // User dbUser=userService.getUser(user.getUserId());
  //
  // if( user.getPassword().equals(dbUser.getPassword())){
  // session.setAttribute("user", dbUser);
  // }
  //
  // return "redirect:/index.jsp";
  // }
  
  // @RequestMapping("/logout.do")
  // @RequestMapping( value="logout", method=RequestMethod.GET )
  // public String logout(HttpSession session ) throws Exception{
  //
  // System.out.println("/user/logout : POST");
  //
  // session.invalidate();
  //
  // return "redirect:/index.jsp";
  // }
  
  // @RequestMapping("/checkDuplication.do")
  // @RequestMapping( value="checkDuplication", method=RequestMethod.POST )
  // public String checkDuplication( @RequestParam("userId") String userId ,
  // Model model ) throws Exception{
  //
  // System.out.println("/user/checkDuplication : POST");
  // //Business Logic
  // boolean result=userService.checkDuplication(userId);
  // model.addAttribute("result", new Boolean(result));
  // model.addAttribute("userId", userId);
  //
  // return "forward:/user/checkDuplication.jsp";
  // }
  
}