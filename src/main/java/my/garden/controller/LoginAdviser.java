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
	@Pointcut("execution(* my.garden.controller.PrivateGardenController.*(..))")
	public void privateGarden(){}
	
	@Around("mypage() || write() || update() || delete() || recommend() || privateGarden()")
	public Object loginCheck(ProceedingJoinPoint pjp) throws Throwable{
		if(session.getAttribute("loginId") == null || session.getAttribute("loginName") == null) {
			return "login/login"; 
		} else {
			return pjp.proceed();
		}
	}
	
	
	
}
