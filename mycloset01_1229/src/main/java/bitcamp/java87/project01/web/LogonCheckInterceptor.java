package bitcamp.java87.project01.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import bitcamp.java87.project01.domain.User;


/*
 * FileName : LogonCheckInterceptor.java
 *    
 */
public class LogonCheckInterceptor extends HandlerInterceptorAdapter {

	///Field
	
	///Constructor
	public LogonCheckInterceptor(){
		System.out.println("\nCommon :: "+this.getClass()+"\n");		
	}
	
	///Method
	public boolean preHandle(	HttpServletRequest request,
														HttpServletResponse response, 
														Object handler) throws Exception {
		
		System.out.println("\n[ LogonCheckInterceptor start........]");
		
		HttpSession session = request.getSession(true);
		
		User user = (User)session.getAttribute("user");
		User user1 = (User)session.getAttribute("faceUser");
		
		if(   user != null ||user1 !=null   )  {
		  
			String uri = request.getRequestURI();
			System.out.println("유저값이 널이아닐때:"+uri);
			/*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			if(		uri.indexOf("addUserView") != -1 	|| 	uri.indexOf("addUser") != -1 || 
					uri.indexOf("loginView") != -1 			||	uri.indexOf("login") != -1 		|| 
					uri.indexOf("checkDuplication") != -1 ){
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
			
			if(		uri.indexOf("addUser") != -1 ||	uri.indexOf("login") != -1 		||   //여기
					uri.indexOf("checkDuplication") != -1 || uri.indexOf("addComment") != -1 ){
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				System.out.println("[ .... ]");
				System.out.println("[ LogonCheckInterceptor  false end........]\n");
				return false;
			}
			
			System.out.println("[ ... ]");
			System.out.println("[ LogonCheckInterceptor true end........]\n");
			return true;
		}else{ 
			String uri = request.getRequestURI();
			System.out.println("user값이 널일때:"+uri);
			/*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			if(		uri.indexOf("addUserView") != -1 	|| 	uri.indexOf("addUser") != -1 || 
					uri.indexOf("loginView") != -1 			||	uri.indexOf("login") != -1 		|| 
					uri.indexOf("checkDuplication") != -1 ){
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////여기/*/
			if(uri.indexOf("botPage") != -1 ||	uri.indexOf("getJsonBot") != -1 ||	uri.indexOf("addUser") != -1 ||	uri.indexOf("login") != -1  ||	uri.indexOf("checkDuplication") != -1 || uri.indexOf("facebook") != -1 || uri.indexOf("updateUser") != -1 || uri.indexOf("addComment") != -1){
				
				System.out.println("[... ]");
				System.out.println("[ LogonCheckInterceptor end........]\n");
				return true;
			}
			
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			System.out.println("[ ... ]");
			System.out.println("[ LogonCheckInterceptor end........]\n");
			return false;
		}
	}
}//end of class