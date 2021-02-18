package pet.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pet.member.service.MemberService;
import pet.member.vo.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
   private Logger logger = LoggerFactory.getLogger(MemberController.class);
   
   
   @Inject
   private MemberService service;
   
   @Autowired(required=false)
   private BCryptPasswordEncoder pwencoder;
   
   
   //�̿���
   @RequestMapping(value = "/agree.do", method = RequestMethod.GET)
   
   public String getClause() throws Exception {
      logger.info("agree.do ȣ�� ����");
      return "/member/agree";
   }
   
   //ȸ������
   @RequestMapping(value = "/signup.do", method = RequestMethod.GET)
   
   public String getJoin() throws Exception {
      logger.info("signup.do ȣ�� ����");
      return "/member/signup";
   }
   
   
   //ȸ������ ó��
      @RequestMapping(value = "/signup.do", method = RequestMethod.POST)
      public String postJoin(@ModelAttribute MemberVO vo ,  HttpServletRequest request) throws Exception {
         logger.info("ȸ������ ó�� ����");
         int result = service.mailChk(vo);
         
         try {
            if(result == 1) {
               return "signup";
            }else if(result == 0) {
               //  ���������� �Է��� �н����带 ��ȣȭ�Ѵ�.
               String secPwd = pwencoder.encode(vo.getMember_password());
               logger.info("ȸ������ �Ծ : " + vo.getMember_email() + ", "+vo.getMember_password() + ", "+vo.getMember_name() + ", " + vo.getMember_address());
               //��ȣȭ�� ��й�ȣ�� VO�� SET�Ѵ�.
               vo.setMember_password(secPwd);
               //DB�� ȸ������ó��
               service.join(vo);
            }
            //�Էµ� ���̵� �����Ѵٸ� �ٽ� ȸ������ �������� ���ư���
         } catch(Exception e) {
            throw new RuntimeException();
         }
         return "member/join/joinSuccess";
      }
      
      
   //�̸��� �ߺ�üũ
   @RequestMapping(value = "/mailChk.do", method = RequestMethod.POST)
   @ResponseBody
   public int mailChk(MemberVO vo) throws Exception {
      logger.info("�̸��� �ߺ�üũ ����");
      int result = service.mailChk(vo);
      return result;
   }
   
   
   @RequestMapping("/mypage.do")
   public String mypage() {
		//log.info("ȸ������ �Ծ : " + vo.getEmail() + ", "+vo.getPassword() + ", "+vo.getName() + ", " + vo.getAddress());
		return "/pet/mypage";
	}
	
	@RequestMapping("/mypost.do")
	public String mypost() {
		//log.info("ȸ������ �Ծ : " + vo.getEmail() + ", "+vo.getPassword() + ", "+vo.getName() + ", " + vo.getAddress());
		return "/pet/mypost";
	}
	
	
	@RequestMapping("/post_blog.do")
	public String post_blog() {
		//log.info("ȸ������ �Ծ : " + vo.getEmail() + ", "+vo.getPassword() + ", "+vo.getName() + ", " + vo.getAddress());
		return "/pet/post_blog";
	}
	
	@RequestMapping("/follower.do")
	public String follower() {
		//log.info("follower ���� ");
		return "/pet/follower";
	}
	
	@RequestMapping("/follower2.do")
	public String follower2() {
		//log.info("follower ���� ");
		return "/pet/follower2";
	}
}