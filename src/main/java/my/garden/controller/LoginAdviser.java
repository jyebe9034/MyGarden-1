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
	@Pointcut("execution(* my.garden.controller.MypageController.*(..))")
	public void mypage() {}
	
	@Pointcut("execution(* my.garden.controller.BoardReviewAndQnAController.*rite*(..))")
	public void write(){}
	@Pointcut("execution(* my.garden.controller.BoardReviewAndQnAController.*pdate*(..))")
	public void update(){}
	@Pointcut("execution(* my.garden.controller.BoardReviewAndQnAController.*elete*(..))")
	public void delete(){}
	@Pointcut("execution(* my.garden.controller.BoardReviewAndQnAController.recommend(..))")
	public void recommend(){}
	
//	@Around("execution(* my.garden.controller.LoginController.*(..))")
	@Around("mypage() || write() || update() || delete() || recommend()")
	public Object loginCheck(ProceedingJoinPoint pjp) throws Throwable{
		if(session.getAttribute("loginId") == null) {
			return "login/login"; 
		} else {
			return pjp.proceed();
		}
	}
	
	
	
}
