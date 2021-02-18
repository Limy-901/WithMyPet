package pet.mvc.controller;

import java.util.Date;
import java.util.Hashtable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import pet.mvc.service.WalkService;
import pet.mvc.walk.CmtVo;
import pet.mvc.walk.Comment;
import pet.mvc.walk.Walk;
import pet.mvc.walk.WalkListResult;
import pet.mvc.walk.joinVo;

@Log4j
@Controller
@AllArgsConstructor
@RequestMapping("walk")

public class WalkController {
	private WalkService walkService;
	
	// ����Ʈ �ҷ�����
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, 
			@RequestParam (defaultValue="0", required=false)int cp,
			@RequestParam (defaultValue="0",required=false)int ps,
			String searchType,String keyword) {
		log.info("##�Ķ���� �� cp: "+cp+", searchType: "+searchType+", keyword: "+keyword);
		
		// ����¡
		if(cp == 0) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) cp = (Integer)cpObj;
		}
		session.setAttribute("cp", cp);
		if(ps == 0) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) ps=(Integer)psObj;
		}else {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != ps) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
		}
		session.setAttribute("ps", ps);
		// ���Ĺ��
		if(searchType == null) {
			String orderSession = (String) session.getAttribute("orderType");
			if(orderSession != null) orderSession = orderSession.trim();
			searchType = orderSession;
		}
		session.setAttribute("searchType", searchType);
		// �˻�Ű����
		if(keyword == null) {
			String keywordSession = (String) session.getAttribute("keyword");
			if(keywordSession != null) keywordSession = keywordSession.trim();
			keyword = keywordSession;
		}
		session.setAttribute("keyword", keyword);
		// DB���� �Է������� ����Ʈ �̾Ƴ���
		log.info("##���� �Ѿ �� cp: "+cp+", searchType: "+searchType+", keyword: "+keyword);
		WalkListResult list = walkService.getListS(cp,ps,searchType,keyword);
		log.info("##�˻��� ����Ʈ:"+list);
		
		ModelAndView mv = new ModelAndView("pet/walklist","list",list);
		// ����Ʈ�� ������� ���
		if(list.getList().size() == 0) {
			if(cp>1) return new ModelAndView("redirect:list.do?cp="+(cp-1));
			else return new ModelAndView("pet/walklist","list",null);
		}else {
			return mv;
		}
	}
	
	// ���� ����
	@RequestMapping(value="make.do")
	public String make(Walk dto)  {
		String from = (dto.getTime())+":00.000";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
		Date parsedDate = null;
		Timestamp timestamp = null;
		try {
		    parsedDate = dateFormat.parse(from);
		    timestamp = new java.sql.Timestamp(parsedDate.getTime());
		} catch(Exception e) {
			log.info("e:"+e);
		}
		walkService.insertWalk(dto);
		return "redirect:list.do";
	}
	
	@PostMapping("apply.do")
	public String apply(Comment dto) {
		walkService.insertWalkCmt(dto);
		return "redirect:blog.do?idx="+dto.getWalk_idx();
	}
	
	@GetMapping("update.do")
	public ModelAndView update(long idx) {
		Walk dto = walkService.getWalk(idx);
		log.info(dto);
		ModelAndView mv = new ModelAndView("pet/walkUpdate","content",dto);
		return mv;
	}
	
	@PostMapping("update.do")
	public String rewrite(Walk dto) {
		walkService.walkUpdate(dto);
		return "redirect:list.do";
	}
	
	@GetMapping("delete.do")
	public String delete(long idx) {
		walkService.walkDelete(idx);
		return "redirect:list.do?cp=1";
	}
	
	@GetMapping(value="getMemberData.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody Comment getCmtMember(long idx, HttpServletResponse response) {
		//���Ƿ�, ��� �����Ǹ� ��� ���� �����;���.
		Comment dto = walkService.getWalkCmtData(idx);
		return dto;
	}
	
	@RequestMapping("blog.do")
	public ModelAndView walkblog(HttpSession session, HttpServletRequest request, long idx) {
		Walk dto = walkService.getWalk(idx);
		Date origin = dto.getWalk_date();
		DateFormat dayForm = new SimpleDateFormat("yyyy�� MM�� dd��");
		DateFormat timeForm = new SimpleDateFormat("a hh�� mm��");
		String day = dayForm.format(origin);
		String time = timeForm.format(origin);
		Hashtable<String,Object> map = new Hashtable<String,Object>();
		map.put("day",day);
		map.put("time",time);
		map.put("dto",dto);
		ModelAndView mv = new ModelAndView("pet/walkblog","content",map);
		return mv;
	}
	
	@GetMapping(value="like.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody int like(Long walk_idx,HttpServletResponse response) {
		joinVo vo = new joinVo(walk_idx,1L);
		walkService.addHeart(vo);
		int likeCount = walkService.getWalkLike(walk_idx);
		return likeCount;
	}
	
	@GetMapping(value="join.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody CmtVo join(Long joinIdx, Long joinWalkIdx, HttpServletResponse response) {
		long memberNo = walkService.selectByCmtIdx(joinIdx); // cmtIdx�� memNo �̱�
		joinVo vo = new joinVo(joinWalkIdx,memberNo);
		walkService.insertWalkJoin(vo,joinIdx);
		CmtVo allCmts = walkService.getWalkCmt(joinWalkIdx);
		return allCmts; 
	}
	
	@RequestMapping("post.do")
	public String walkpost() {
		return "/pet/walkpost";
	}
	
	@GetMapping(value="search.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public @ResponseBody WalkListResult search(String keyword, String searchType) {
		log.info("##���⿩�� "+searchType+keyword);
		WalkListResult list = walkService.getListS(1,10,searchType,keyword);
		log.info(list);
		return list;
	}
}
