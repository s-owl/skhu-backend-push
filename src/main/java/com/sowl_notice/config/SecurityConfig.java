package com.sowl_notice.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
//import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.sowl_notice.service.MemberService;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled= true)
//@Order(SecurityProperties.ACCESS_OVERRIDE_ORDER)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	MemberService memberService;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

   @Override
   protected void configure(HttpSecurity http) throws Exception{
	   http.formLogin().usernameParameter("member_id")
	   					.passwordParameter("member_pw")
	   					.loginProcessingUrl("/login")
	   					.loginPage("/member/logIn")
	   					.defaultSuccessUrl("/");
	   
	   http.authorizeRequests()
	      .antMatchers("/webjars/**").permitAll()
	      .antMatchers("/resources/**").permitAll()
	      .antMatchers("/board/**").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN') or hasRole('ROLE_SUPER')")
	      .antMatchers("/member/**").access("isAnonymous()");
	      ;
	   http.exceptionHandling().accessDeniedPage("/member/accessDenyPage");
	      
	   http.logout().invalidateHttpSession(true)
//	   				.deleteCookies("JSESSIONID,SPRING_SECURITY_REMEMBER_ME_COOKIE")
	   				.logoutUrl("/logout")
	   				.logoutSuccessUrl("/");
	   
	   http.rememberMe().key("remkey").tokenValiditySeconds(3600);
	   
	   http.csrf().disable();
	   
	   http.sessionManagement().maximumSessions(1).expiredUrl("/logIn").maxSessionsPreventsLogin(true);
   }
   
   @Override
   protected void configure(AuthenticationManagerBuilder auth)throws Exception{
	   auth.userDetailsService(memberService).passwordEncoder(passwordEncoder());
   }
   
   
   

}