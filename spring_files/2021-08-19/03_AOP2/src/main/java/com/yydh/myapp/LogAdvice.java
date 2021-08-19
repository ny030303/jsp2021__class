package com.yydh.myapp;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
public class LogAdvice {

	//<aop:pointcut expression="execution(* com.yydh.myapp..*Impl.*(..))" id="allPointcut" />
	@Pointcut("execution(* com.yydh.myapp..*Impl.*(..))")
	public void allPointCut() {}
	
	@Pointcut("execution(* com.yydh.myapp..*Impl.insert(..))")
	public void insertPointCut() {}
	
//	<aop:aspect ref="log">
//		<aop:after method="printLog" pointcut-ref="allPointcut"/>
//	</aop:aspect>
//	@After("allPointCut()")
//	public void printLog() {
//		System.out.println("[로그] 비즈니스 로직 수행 전 동작!");
//	}
	
	@Around("allPointCut()")
	public Object aroundLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("[로깅 전] 비즈니스 로직 수행 전 동작입니다.");
		Object obj = pjp.proceed();
		System.out.println("[로깅 전] 비즈니스 로직 수행 전 동작입니다.");
		return obj;
	}
}
