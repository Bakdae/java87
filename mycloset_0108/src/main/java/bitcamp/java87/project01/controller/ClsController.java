package bitcamp.java87.project01.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import bitcamp.java87.project01.common.JavaToJson;
import bitcamp.java87.project01.domain.Cls;
import bitcamp.java87.project01.domain.Cls2;
import bitcamp.java87.project01.domain.Comment;
import bitcamp.java87.project01.domain.Style;
import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.domain.Wardrobe;
import bitcamp.java87.project01.service.ClsService;
import bitcamp.java87.project01.service.CommentService;
import bitcamp.java87.project01.service.StyleService;
import bitcamp.java87.project01.service.UserService;
import bitcamp.java87.project01.service.WardrobeService;

@Controller
@RequestMapping("/Cls/*")
public class ClsController {

  /// Field
  @Autowired
  @Qualifier("clsServiceImpl")
  private ClsService clsService;
  
  
  /// Field
  @Autowired
  @Qualifier("wardrobeServiceImpl")
  private WardrobeService wardrobeService;
 
  /// Field
  @Autowired
  @Qualifier("StyleServiceImpl")
  private StyleService styleService;
 
  
  
  
  
  public ClsController() {
    System.out.println(this.getClass());
  }

  @Value("#{commonProperties['pageUnit']}")
  int pageUnit;

  @Value("#{commonProperties['pageSize']}")
  int pageSize;

  // @RequestMapping("/addUserView.do")
  // public String addUserView() throws Exception {
  @RequestMapping(value = "addCls", method = RequestMethod.GET)
  public String addCls(String styleNo ,String cls_no) throws Exception {
	  System.out.println("addCls : start()...");
	  
	  Style style=styleService.getStyle(Integer.parseInt(styleNo));
	  Wardrobe wardrobe =  wardrobeService.getWardrobe(Integer.parseInt(cls_no));
	  
	  Cls2 cls = new Cls2();
	  cls.setStyle(style);
	  cls.setWardrobe(wardrobe);
	  clsService.addCls(cls);
	  System.out.println("addCls : end()...");
     return  "redirect:/main/main.jsp";
  }
  
 
     
  @RequestMapping(value = "getClsList", method = RequestMethod.GET)
  public String getClsList(int userNo, Model model) throws Exception {
	  System.out.println("getClsList : start()...");
	  
	  List<Cls> clsList=clsService.getClsList(userNo);
	  model.addAttribute("clsList",clsList);
	  
     return  "forward:/main/main.jsp";
  }
  
}