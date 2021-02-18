package pet.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import pet.mvc.board.Board;
import pet.mvc.board.BoardCmt;

import pet.mvc.board.BoardListResult;
import pet.mvc.service.BoardService;



@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("board")
public class BoardController {
	@Autowired
	private BoardService service;

	
	
	@RequestMapping("list.do")
	public ModelAndView search(HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		String catgo = request.getParameter("catgo");
		String keyword = request.getParameter("keyword");
		String rnum = request.getParameter("rnum");
		System.out.println("#"+rnum);
		//log.info("#catgoStr:"+catgo+", #keywordStr:"+keyword);//�ҷ�����
		//(1) cp 
		int cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");//setAttribute �� �Ķ���Ͱ� ������Ʈ�� ����� setAttribute (java.lang.String name, java.lang.Object value)
			
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		
		//(2) ps 
		int ps = 20;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");//session���� �������� �ʿ䰡 ��� ���� sesion.getAttribute�� �������� request.getParameter�� �ص� �ɵ�
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			
			ps = psParam;
		}
		session.setAttribute("ps", ps);
		
	
		if(catgo == null) {
			Object catgoObj = session.getAttribute("catgo");
			if(catgoObj != null) {
				catgo = (String)catgoObj;
			}
		}else {
			catgo = catgo.trim();

		}session.setAttribute("catgo", catgo);
		
		
		//(4) keyword

		if(keyword == null) {
			Object keywordObj = session.getAttribute("keyword");
			if(keywordObj != null) {
				keyword = (String)keywordObj;
			}
		}else {
			keyword = keyword.trim();
		}session.setAttribute("keyword", keyword);
		
		BoardListResult listResult = null;
		ModelAndView mv = null;
		
		
		
		
		if(catgo!=null && keyword !=null) {
			listResult = service.getBoardListResult(catgo, keyword, cp, ps);
			mv = new ModelAndView("board/list", "listResult", listResult);
			if(listResult.getList().size()==0) {
				if(cp>1)
					return new ModelAndView("redirect:list.do?cp="+(cp-1));
				else
					return new ModelAndView("board/list", "listResult", null);
			}
			return mv;
			
		}else {
			listResult = service.getBoardListResult(cp, ps);	//���ʹ� �ٸ� �������̱� ������ listResult�� ���� �������ְ� �׿� ���� modelandview�� �������־���Ѵ�. mv�� ���ִ� ��ȭ�� ��
			
			mv = new ModelAndView("board/list", "listResult", listResult);
			if(listResult.getList().size() == 0) {
				if(cp>1)
					return new ModelAndView("redirect:list.do?cp="+(cp-1));
				else
					return new ModelAndView("board/list", "listResult", null);
			}else {
				return mv;
			
			
			
			}
		}
		
	}
	
	/*@GetMapping("write.do")
	public String write() {
		return "board/write";
	}*/
	
	@GetMapping("write.do")
	public ModelAndView write() {
		Board board = new Board();
		
		String post_subject = board.getPost_subject();
		board.setPost_subject(post_subject);
	
		long board_idx = board.getBoard_idx();
		board.setBoard_idx(board_idx);

		ModelAndView mv = new ModelAndView("board/write", "board", board);		
		return mv;
	}
	
	@RequestMapping("write.do")
	public String upload(Board board) {
		service.write(board);
		return "redirect:list.do";
	}
		
	/*@PostMapping("fileupload.do")
	public String upload(BoardForm board, @RequestParam MultipartFile file) {
		fservice.saveStore(file);		
		return "redirect:list.do";		
	}*/
	
	@GetMapping("content.do")
	public ModelAndView content(long post_idx, ArrayList<BoardCmt> comment) {
		Board board = service.getBoard(post_idx);
		board.getComment();
		ModelAndView mv = new ModelAndView("board/content", "board", board);
		
		return mv;
	}
	
		
	@GetMapping("delete.do")
	public String delete(long post_idx) {
		service.remove(post_idx);
		return "redirect:list.do";//�����ƴٴ� �ڹٽ�ũ��Ʈ jsp�� ��ü�ϱ�
	}
	@GetMapping("deleteCmt.do")//���������� ����!
	public String deleteCmt(long comment_idx) {
		service.removeCmt(comment_idx);
		return "redirect:list.do";
	}
	
	

	@GetMapping("modifyCmt.do")//����ȭ�� ����������?
	public ModelAndView modifyCmt(BoardCmt boardCmt, long post_idx) {
		Board board = service.getBoard(post_idx);
		board.getComment();
		ModelAndView mv = new ModelAndView("board/content", "board", board);
	return mv;
	}
	
	@PostMapping("modifyCmt.do")//����ȭ�� ����������?
	public String modifyCmtOk(BoardCmt boardCmt) {
	service.editCmt(boardCmt);
	return "redirect:list.do";
	}
	
	@PostMapping("replyUpload.do")
	public String uploadReply(BoardCmt boardCmt) {
		service.writeCmt(boardCmt);
		log.info("@boardCmt:"+boardCmt);
		return "redirect:list.do";
		//return new ModelAndView("board/content", "comment",  comment);
	}
	
	@GetMapping("modify.do")
	public ModelAndView modify(long post_idx) {
		Board board = service.getBoard(post_idx);	
		ModelAndView mv = new ModelAndView("board/write", "board", board);
		
		return mv;
	}
	
	@PostMapping("modify.do")
	public String edit(Board board) {
		
		service.edit(board);
		
		Board boardd = new Board();
		log.info("@@@list:0"+boardd);
		
		return "redirect:list.do";
	}
	
	
	
/*	// String fileRoot = "C:\\summernote_image\\";// �ܺΰ�η� ������ ����Ҷ�.
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
		
		// ���ΰ�η� ����
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String ofname = multipartFile.getOriginalFilename();	//�������� ���ϸ� �Ȱ������������̶� �ȵǴµ�
		String extension = ofname.substring(ofname.lastIndexOf("."));	//���� Ȯ����//-1�̶� �ȵǳ���..
		String savedFileName = UUID.randomUUID() + extension;	//����� ���� ��
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//���� ����
			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + ������ ���� ������
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//����� ���� ����
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	*/
	
}
