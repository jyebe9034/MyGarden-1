package my.garden.controller;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoginAdviser {
	

	@Autowired
	private HttpSession session;
	
//	@Pointcut("execution(* my.garden.controller.LoginController.Login(..))") 
//	public void cut1() {
//	}
//	@Pointcut("execution(* my.garden.controller.LoginController.Join(..))") 
//	public void cut2() {
//	}
	
//	@Around("execution(* my.garden.controller.LoginController.*(..))")
	@Around("execution(* my.garden.controller.MypageController.*(..))")
	public Object loginCheck(ProceedingJoinPoint pjp) throws Throwable{
		if(session.getAttribute("loginId") == null) {
			return "login/login"; 
		} else {
			return pjp.proceed();
		}
	}
	
}
