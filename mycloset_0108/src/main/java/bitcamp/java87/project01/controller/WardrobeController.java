package bitcamp.java87.project01.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

import bitcamp.java87.project01.domain.Cls;
import bitcamp.java87.project01.domain.User;
import bitcamp.java87.project01.domain.Wardrobe;
import bitcamp.java87.project01.service.ClsService;
import bitcamp.java87.project01.service.UserService;
import bitcamp.java87.project01.service.WardrobeService;

@Controller
@RequestMapping("/wardrobe/*")
public class WardrobeController {

  /// Field
  @Autowired
  @Qualifier("wardrobeServiceImpl")
  private WardrobeService wardrobeService;
  @Autowired
  @Qualifier("userServiceImpl")
  private UserService userService;

  @Autowired
  @Qualifier("clsServiceImpl")
  private ClsService clsService;


  /// Constructor
  public WardrobeController() {
    System.out.println("[WardrobeController Default Constructor]" + this.getClass());
  }


  // 옷장 추가시 이름 유효성 체크
  @RequestMapping(value = "wardrobeValidate")
  public @ResponseBody Wardrobe wardrobeValidate(int user_no, String cls_name) throws Exception {

    System.out.println("[wardrobeController] wardrobeValidate");

    // Business Logic
    Wardrobe wardrobe = new Wardrobe();
    wardrobe.setUser_no(user_no);
    wardrobe.setCls_name(cls_name);

    wardrobe = wardrobeService.getWardrobe(wardrobe);
    System.out.println("[wardrobeController] wardrobeValidate ::: domain ::: " + wardrobe);

    return wardrobe;
  }

  // 옷장 추가
  @RequestMapping(value = "addWardrobe", method = RequestMethod.POST)
  public @ResponseBody Wardrobe addWardrobe(int user_no, String cls_name) throws Exception {

    System.out.println("[wardrobeController] addWardrobe ::: POST ");

    // Business Logic
    Wardrobe wardrobe = new Wardrobe();
    wardrobe.setUser_no(user_no);
    wardrobe.setCls_name(cls_name.trim());

    wardrobeService.addWardrobe(wardrobe);

    System.out.println("[wardrobeController] addWardrobe ::: domain::: " + wardrobe);

    return wardrobe;
  }

  // 옷장 목록 조회
  @RequestMapping(value = "getWardrobeList", method = RequestMethod.GET)
  public String listWardrobe(@RequestParam int user_no, Model model, HttpSession session) throws Exception {

    System.out.println("[wardrobeController] ::: getWardrobeList ::: GET ");
    System.out.println("[wardrobeController] ::: getWardrobeList ::: parameter:user_no::: " + user_no);

    int sessionNo = 0;
    int getFollow = 0;

    if (session.getAttribute("user") != null) {
      sessionNo = ((User) session.getAttribute("user")).getUser_no();
    } else if (session.getAttribute("faceUser") != null) {
      sessionNo = ((User) session.getAttribute("faceUser")).getUser_no();
    }
    System.out.println("[wardrobeController] ::: getWardrobeList ::: int sessionNo::: " + sessionNo);

    // Business Logic
    User user = userService.getUser(user_no);
    System.out.println("[wardrobeController] ::: getWardrobeList ::: domain:user ::: " + user);
    
    /* 옷장리스트 */
    Map<String, Object> map = wardrobeService.getWardrobeList(user_no);
    	System.out.println("map값:"+map);
 	List<Cls> clsList = clsService.getClsList(user_no);
   /* 세션유저의 옷장이 아닐 때 팔로잉 여부 확인 */
    if( sessionNo != user_no ) {
      Wardrobe wardrobe = new Wardrobe();
  
      wardrobe.setFollower(sessionNo);
      wardrobe.setFollowing(user_no);
   
      getFollow = wardrobeService.getFollow(wardrobe);
      System.out.println("[wardrobeController] ::: getWardrobeList ::: int getFollow::: " + getFollow);

      model.addAttribute("getFollow", getFollow);
    }
    
    model.addAttribute("clsList",clsList);
    model.addAttribute("cls_user", user);
    model.addAttribute("followerCount", map.get("followerCount"));
    model.addAttribute("followingCount", map.get("followingCount"));
    model.addAttribute("postCount", map.get("postCount"));
    model.addAttribute("list", map.get("list"));
    model.addAttribute("postList", map.get("postList"));
    
    System.out.println("[wardrobeController] ::: getWardrobeList ::: postList ::: " + map.get("postList"));

    if (user_no == sessionNo) {
      return "forward:/wardrobe/myWardrobe.jsp";
    } else {
      return "forward:/wardrobe/wardrobe.jsp";
    }
  }

  
  @RequestMapping(value = "getWardrobe", method = RequestMethod.GET)
  public @ResponseBody Map getWardrobe(@RequestParam int user_no, HttpSession session) throws Exception {

    System.out.println("[wardrobeController] ::: getWardrobe ::: GET ");
    System.out.println("[wardrobeController] ::: getWardrobe ::: parameter:user_no::: " + user_no);

    int sessionNo = 0; 
    int getFollow = 0;

    if (session.getAttribute("user") != null) {
      sessionNo = ((User) session.getAttribute("user")).getUser_no();
    } else if (session.getAttribute("faceUser") != null) {
      sessionNo = ((User) session.getAttribute("faceUser")).getUser_no();
    }
    System.out.println("[wardrobeController] ::: getWardrobeList ::: int sessionNo::: " + sessionNo);

    // Business Logic
    User user = userService.getUser(user_no);
    System.out.println("[wardrobeController] ::: getWardrobeList ::: domain:user ::: " + user);
    
    /* 옷장리스트 */
    Map<String, Object> map = wardrobeService.getWardrobeList(user_no);
   System.out.println("map값:"+map);
    return map;
   }
  
  
  // 옷장 이름 수정
  @RequestMapping(value = "updateWardrobe")
  public @ResponseBody Wardrobe updateWardrobe(int cls_no, String cls_name) throws Exception {

    System.out.println("[wardrobeController] ::: updateWardrobe ");
    System.out.println("[wardrobeController] ::: updateWardrobe ::: parameter:cls_no : " + cls_no);
    System.out.println("[wardrobeController] ::: updateWardrobe ::: parameter:cls_name : " + cls_name);

    // Business Logic
    Wardrobe wardrobe = wardrobeService.getWardrobe(cls_no);
    wardrobe.setCls_name(cls_name.trim());
    System.out.println("[wardrobeController] ::: updateWardrobe ::: domain ::: before : " + wardrobe);

    wardrobeService.updateWardrobe(wardrobe);
    System.out.println("[wardrobeController] ::: updateWardrobe ::: domain ::: after : " + wardrobe);

    return wardrobe;
  }

  // 옷장 삭제
  @RequestMapping(value = "deleteWardrobe")
  public @ResponseBody Wardrobe deleteWardrobe(int cls_no) throws Exception {

    System.out.println("[wardrobeController] ::: deleteWardrobe ");
    System.out.println("[wardrobeController] ::: deleteWardrobe ::: parameter:cls_no : " + cls_no);

    // Business Logic
   
    wardrobeService.deleteWardrobe(cls_no);
    
   
  
    Wardrobe wardrobe = new Wardrobe();
    wardrobe.setCls_no(cls_no);
    

    return wardrobe;
  }
  
  
  
  // 옷장 팔로잉 (세션유저(Follower)가 타인 옷장의 팔로우버튼을 눌렀을 때)
  @RequestMapping(value = "addFollow")
  public @ResponseBody Wardrobe addFollow(int follower, int following) throws Exception {

    System.out.println("[wardrobeController] ::: addFollow ");
    System.out.println("[wardrobeController] ::: addFollow ::: parameter:follower : " + follower);
    System.out.println("[wardrobeController] ::: addFollow ::: parameter:following : " + following);

    // Business Logic
    Wardrobe wardrobe = new Wardrobe();
    wardrobe.setFollower(follower);
    wardrobe.setFollowing(following);

    wardrobeService.addFollow(wardrobe);
    System.out.println("[wardrobeController] ::: addFollow ::: domain : " + wardrobe);

    return wardrobe;
  }

  // 옷장 언팔로잉 (세션유저(Follower)가 타인 옷장의 언팔로우버튼을 눌렀을 때)
  @RequestMapping(value = "deleteFollow")
  public @ResponseBody Wardrobe deleteFollow(int follower, int following) throws Exception {

    System.out.println("[wardrobeController] ::: deleteFollow ");
    System.out.println("[wardrobeController] ::: deleteFollow ::: parameter:follower : " + follower);
    System.out.println("[wardrobeController] ::: deleteFollow ::: parameter:following : " + following);

    // Business Logic
    Wardrobe wardrobe = new Wardrobe();
    wardrobe.setFollower(follower);
    wardrobe.setFollowing(following);

    wardrobeService.deleteFollow(wardrobe);

    return wardrobe;
  }


  //옷장 팔로워 리스트
  @RequestMapping(value = "getFollowerList")
  public @ResponseBody Map<String, Object> getFollowerList(int following, Model model) throws Exception {

    System.out.println("[wardrobeController] ::: getFollowerList ");
    System.out.println("[wardrobeController] ::: getFollowerList ::: parameter:following : " + following);

    // Business Logic
    Map<String, Object> map = wardrobeService.getFollowerList(following);
    
    model.addAttribute("followerList", map.get("followerList"));
    
    return map;
  }
  
  
  //옷장 팔로잉 리스트
  @RequestMapping(value = "getFollowingList")
  public @ResponseBody Map<String, Object> getFollowingList(int follower, Model model) throws Exception {
    
    System.out.println("[wardrobeController] ::: getFollowingList ");
    System.out.println("[wardrobeController] ::: getFollowingList ::: parameter:following : " + follower);
    
    // Business Logic
    Map<String, Object> map = wardrobeService.getFollowingList(follower);
    
    model.addAttribute("followingList", map.get("followingList"));
    
    return map;
  }
  
  
  
  
  
  /* 디테일 옷장 페이지 */
  
  // 옷장리스트를 누르면 해당 옷장의 포스트 리스트 출력
  @RequestMapping(value = "wardrobeIn", method = RequestMethod.GET)
  public String wardrobeIn(@RequestParam int user_no, @RequestParam int cls_no, Model model, HttpSession session) throws Exception {

    System.out.println("[wardrobeController] ::: wardrobeIn ::: GET ");
    System.out.println("[wardrobeController] ::: wardrobeIn ::: parameter:user_no::: " + user_no);
    System.out.println("[wardrobeController] ::: wardrobeIn ::: parameter:cls_no::: " + cls_no);

    int sessionNo = 0;
    int getFollow = 0;

    if (session.getAttribute("user") != null) {
      sessionNo = ((User) session.getAttribute("user")).getUser_no();
    } else if (session.getAttribute("faceUser") != null) {
      sessionNo = ((User) session.getAttribute("faceUser")).getUser_no();
    }
    System.out.println("[wardrobeController] ::: wardrobeIn ::: int sessionNo::: " + sessionNo);

    // Business Logic
    User user = userService.getUser(user_no);
    System.out.println("[wardrobeController] ::: wardrobeIn ::: domain:user ::: " + user);
    
    /* 옷장 포스트 리스트 */


    if (user_no == sessionNo) {
      return "forward:/wardrobe/myWardrobeDetail.jsp";
    } else {
      return "forward:/wardrobe/wardrobeDetail.jsp";
    }
  }
  
  


  @RequestMapping(value = "getJsonWardrobe", method = RequestMethod.GET)
  public ResponseEntity<String> getJsonWardrobe(HttpSession session) throws Exception {

    System.out.println("/getJsonWardrobe");
    // Business Logic
    User user = (User) session.getAttribute("faceUser");

    // Model 과 View 연결
    JSONObject obj = new JSONObject();
    obj.put("userNo", user.getUser_no() + "");

    HttpHeaders headers = new HttpHeaders();
    headers.add("Content-Type", "text/plain;charset=UTF-8");

    return new ResponseEntity<>(obj.toJSONString(), headers, HttpStatus.OK);
  }

}
