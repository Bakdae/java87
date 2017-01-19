package bitcamp.java87.project01.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
import org.springframework.web.servlet.ModelAndView;

import bitcamp.java87.project01.common.HashTag;
import bitcamp.java87.project01.common.JavaToJson;
import bitcamp.java87.project01.dao.StyleDao;
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
    
    String detailHeight="";
    
    if (multipartFile.isEmpty()) {
      System.out.println("## 비어있는 파일입니다!!");
    }
    
    try{
      
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
      
      //400기준 높이 구하기
      int detail_width = 400;
      int detail_height = (400 * originalImageHeight) / originalImageWidth;
      detailHeight = detail_height+"";
      
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
    style.setStyleLike(detailHeight);
    
    style.setFileName(reFileName);
    style.setTnFileName(body+"_"+fileId + "_thumbnail_image.jpg");
    
    System.out.println("style > "+style);
    
    styleService.addStyle(style);
    
    return "redirect:/main/main.jsp";
  }
  
  
  @RequestMapping(value="getStyleList", method=RequestMethod.POST)
  @ResponseBody
  public JSONArray getStyleList(@RequestParam() int pageNo) throws Exception {
    
    System.out.println("  >>  /style/getStyleList 의 내부  >>");
    System.out.println(" 페이지 넘버 디버깅 : "+pageNo);
    // Business Logic
    Search search = new Search(60,pageNo,"");
    System.out.println("컨트롤전 ");
    Map<String,Object> map = styleService.getStyleList(search);
    System.out.println("컨트롤후 ");
    List list = (List) map.get("list");
    Style ss = (Style) list.get(0);
    System.out.println("컨트롤러에서의 디버깅 "+ss);
    
    return new JavaToJson().toJSONArray(list);
  }
  
  
  //검
  @RequestMapping(value="getSearchedStyleList", method=RequestMethod.POST)
  @ResponseBody
  public JSONArray getSearchedStyleList(@RequestParam() int pageNo ,@RequestParam() String keyword) throws Exception {
    
    System.out.println("  >>  /style/getSearchedStyleList 의 내부  >>");
    System.out.println(" getSearchedStyleList 페이지 넘버 디버깅 : "+pageNo);
    System.out.println(" getSearchedStyleList 키워드 디버깅 : "+keyword);
    // Business Logic
    Search search = new Search(60,pageNo,keyword);
    System.out.println(" getSearchedStyleList 컨트롤전 ");
    Map<String,Object> map = styleService.getStyleList(search);
    System.out.println(" getSearchedStyleList 컨트롤후 ");
    List list = (List) map.get("list");
    Style ss = (Style) list.get(0);
    System.out.println(" getSearchedStyleList 컨트롤러에서의 디버깅 "+ss);
    
    return new JavaToJson().toJSONArray(list);
  }
  
  @RequestMapping(value = "getSearch", method = RequestMethod.POST)
  @ResponseBody
  public ModelAndView getSearch(HttpServletRequest request, ModelAndView modelAndView,  HttpSession session) throws Exception {
    
    System.out.println("  >>  /style/getSearch : POST");
    
    // Business Logic
    String keyword = request.getParameter("searchKeyword");
    User cunrrentUser = (User)session.getAttribute("user");

    System.out.println("  >>  /style/getSearch : POST 디버깅 keyword : "+keyword);

    modelAndView.addObject("currentUser", cunrrentUser);
    modelAndView.addObject("keyword", keyword);
    modelAndView.setViewName("/main/mainS.jsp");
    
    
    return modelAndView;
  }
  
  
  //겟 스타일 겟방식
  //
  @RequestMapping(value = "getStyle", method = RequestMethod.GET)
  @ResponseBody
  public ModelAndView getStyle(@RequestParam() int styleNo, Model model, ModelAndView modelAndView,  HttpSession session) throws Exception {
    
    System.out.println("  >>  /style/getStyle : GET");
    System.out.println("  >>  styleNo >>"+styleNo);
    
    // Business Logic
    Style style = styleService.getStyle(styleNo);
    User cunrrentUser = (User)session.getAttribute("user");
    
    HashMap hm = new JavaToJson().detailView(style); 
    
    System.out.println("  >>  /style/getStyle : GET + style 정보 "+style);

    modelAndView.addObject("currentUser", cunrrentUser);
    modelAndView.addObject("style", hm);
    modelAndView.setViewName("/main/detailView.jsp");
    
    
    return modelAndView;
  }
  
  
  //겟 스타일 포스트방식
  //
  @RequestMapping(value = "getStyle", method = RequestMethod.POST)
  @ResponseBody
  public String getStylePost(@RequestParam() int styleNo, Model model) throws Exception {
    
    System.out.println("  >>  /style/getStyle : POST");
    System.out.println(styleNo);
    // Business Logic
    Style style = styleService.getStyle(styleNo);
    System.out.println("  >>  /style/getStyle : POST + style "+style);
    String height = style.getStyleLike();
    return height;
  }
  
  
  @RequestMapping(value="deleteStyle", method=RequestMethod.GET)
  @ResponseBody
  public String deleteStyle(HttpServletRequest request) throws Exception{
	  
	  System.out.println("  >>  /style/deleteStyle : GET");
	  int styleNo = Integer.parseInt(request.getParameter("styleNo"));
	  Style style = styleService.getStyle(styleNo);
	  styleService.deleteStyle(styleNo);
	  
	  System.out.println("  **  딜리트 컨트롤러 나가기 전  **  ");
	  
	  return "OK";
	  
  }
  
  @RequestMapping(value="updateStyle", method=RequestMethod.POST)
  @ResponseBody
  public String updateStyle(@ModelAttribute("style") Style style, HttpServletRequest request) throws Exception{
	  
	  System.out.println("  >>  /style/updateStyle : POST");
	  System.out.println(" ajax 통신으로 업데이트 컨트롤러 입성");
	  
	  style = styleService.getStyle(style.getStyleNo());
	  System.out.println("   *** 수정 전 *** style debugging : "+style);
	  
	  String styleTitle = request.getParameter("styleTitle") == null?"":request.getParameter("styleTitle");
	  
	  String styleInfo6 = request.getParameter("styleInfo6") == null?"":request.getParameter("styleInfo6");
	  String styleInfo7 = request.getParameter("styleInfo7") == null?"":request.getParameter("styleInfo7");
	  String styleInfo8 = request.getParameter("styleInfo8") == null?"":request.getParameter("styleInfo8");
	  String styleInfo9 = request.getParameter("styleInfo9") == null?"":request.getParameter("styleInfo9");
	  String styleInfo10 = request.getParameter("styleInfo10") == null?"":request.getParameter("styleInfo10");
	  
	  String priceInfo6 = request.getParameter("priceInfo6") == null?"":request.getParameter("priceInfo6");
	  String priceInfo7 = request.getParameter("priceInfo7") == null?"":request.getParameter("priceInfo7");
	  String priceInfo8 = request.getParameter("priceInfo8") == null?"":request.getParameter("priceInfo8");
	  String priceInfo9 = request.getParameter("priceInfo9") == null?"":request.getParameter("priceInfo9");
	  String priceInfo10 = request.getParameter("priceInfo10") == null?"":request.getParameter("priceInfo10");
	  
	  String tagPosition1 = request.getParameter("tagPosition1") == null?"":request.getParameter("tagPosition1");
	  String tagPosition2 = request.getParameter("tagPosition2") == null?"":request.getParameter("tagPosition2");
	  String tagPosition3 = request.getParameter("tagPosition3") == null?"":request.getParameter("tagPosition3");
	  String tagPosition4 = request.getParameter("tagPosition4") == null?"":request.getParameter("tagPosition4");
	  String tagPosition5 = request.getParameter("tagPosition5") == null?"":request.getParameter("tagPosition5");
	  
	  String styleDesc = request.getParameter("styleDesc") == null?"":request.getParameter("styleDesc");
	  
	  style.setStyleTitle(styleTitle);
	  style.setInfomation1(styleInfo6+"`"+priceInfo6+"`"+tagPosition1);
	  style.setInfomation2(styleInfo7+"`"+priceInfo7+"`"+tagPosition2);
	  style.setInfomation3(styleInfo8+"`"+priceInfo8+"`"+tagPosition3);
	  style.setInfomation4(styleInfo9+"`"+priceInfo9+"`"+tagPosition4);
	  style.setInfomation5(styleInfo10+"`"+priceInfo10+"`"+tagPosition5);
	  
	  style.setStyleDesc(styleDesc);
	  style.setHashTagString(new HashTag().parsing(styleDesc));
	  
	  System.out.println("   styleTitle : "+styleTitle+", styleInfo6 : "+styleInfo6+", styleInfo7 : "+styleInfo7+", styleInfo8 : "+styleInfo8+", styleInfo9 : "+styleInfo9+", styleInfo10 : "+styleInfo10+", priceInfo6 : "+priceInfo6+", priceInfo7 : "+priceInfo7+", priceInfo8 : "+priceInfo8+", priceInfo9 : "+priceInfo9+", priceInfo10 : "+priceInfo10+", styleDesc : "+styleDesc);
	  System.out.println("   >> tagPosition1 : "+tagPosition1+", tagPosition2 : "+tagPosition2+", tagPosition3 : "+tagPosition3+", tagPosition4 : "+tagPosition4+", tagPosition5 : "+tagPosition5);
	  
	  System.out.println("   *** 수정 후 *** style debugging : "+style);
	  
	  styleService.updateStyle(style);
	  
	  return style.getStyleNo()+"";
	  
  }

  @RequestMapping(value = "getStyleBot", method = RequestMethod.GET)
  public String getStyleBot(@RequestParam() int styleNo, Model model) throws Exception {
    
    System.out.println("  >>  /style/getStyle : POST");
    System.out.println(styleNo);
    // Business Logic
    Style style = styleService.getStyle(styleNo);
    Map map=new JavaToJson().detailView(style);
    model.addAttribute("style",map);
    System.out.println("  >>  /style/getStyle : POST + style "+style);
    
    return "forward:/main/main.jsp";
  }
  
}