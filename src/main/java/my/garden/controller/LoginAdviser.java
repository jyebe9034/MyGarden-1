//package my.garden.controller;
//
//import javax.servlet.http.HttpSession;
//
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//import org.springframework.web.servlet.ModelAndView;
//
//@Component
//@Aspect
//public class LoginAdviser {
//	@Autowired
//	private HttpSession session;
//	
//	@Around("execution(* my.garden.controller.LoginController.*(..))")
//	public Object loginCheck(ProceedingJoinPoint pjp) throws Throwable{
//		if(session.getAttribute("loginId") == null) {
//			ModelAndView mav = new ModelAndView();
//			mav.addObject("msg", "로그인을 먼저 진행해주세요");
//			mav.setViewName("index");
//			return mav; //리턴값이 ModelAndView므로 execution(* kh.spring.practice.HomeController.join(..)) 여기 포함되는 애들도 ModelAndView로 리턴값을 바꿔야 함
//		} else {
//			return pjp.proceed();
//		}
//	}
//	
//}
