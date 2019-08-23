package com.sowl_notice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sowl_notice.dao.MemberDao;
import com.sowl_notice.model.MemberModel;

@Controller
public class MemberController {
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
	PasswordEncoder encoder;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String welcomePage(Authentication auth , HttpServletRequest req) {
		ModelAndView model = new ModelAndView();
		if(auth != null && auth.getName() != null) {
			return "main";
		}else {
			model.addObject("message", "welcom anonmous user");
		}
		
		model.setViewName("main");
		return "main";
	}

	@RequestMapping(value="/member/logIn", method = RequestMethod.GET)
	public String logIn() {
		return "/member/logIn";
	}
	
	@RequestMapping(value="/member/signIn", method = RequestMethod.GET)
	public String signIn() {
		return "/member/signIn";
	}
	
	@RequestMapping(value="/member/signInDo", method = RequestMethod.POST)
	public String logInDo(Model model, MemberModel memberModel,
			@RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw
			) {
		memberModel.setUsername(member_id);
		String pass = encoder.encode(member_pw);
		memberModel.setPassword(pass);
		memberDao.signIn(memberModel);
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/checkMemberId", method = RequestMethod.POST)
	@ResponseBody
	public int checkMemberId(String member_id) throws Exception {
		return memberDao.checkMemberId(member_id);
	}
	
	@RequestMapping(value="/member/memberNoCheck", method = RequestMethod.POST)
	@ResponseBody
	public int memberNoCheck(int member_no) throws Exception {
		return memberDao.memberNoCheck(member_no);
	}
	
	@RequestMapping(value="/member/accessDenyPage")
	public String accessDenyPage() {
		return "/member/accessDenyPage";
	}
	
}
