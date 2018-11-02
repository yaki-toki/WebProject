package command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Board.Dao.BoardDao;
import Board.model.BoardBean;

public class WriteHandler implements CommandHadler {
	private BoardBean data = new BoardBean(); // 데이터
	private BoardDao boardDao = new BoardDao();
	private ActionForward forward = new ActionForward();

	@Override
	public ActionForward process(HttpServletRequest req, HttpServletResponse res) {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private ActionForward processForm(HttpServletRequest req, HttpServletResponse res) {
		return null;
	}

	private ActionForward processSubmit(HttpServletRequest req, HttpServletResponse res) {
		String realFolder = "";
		String saveFolder = "Board";
		int fileSize = 5 * 1024 * 1024; // 5MB
		realFolder = req.getRealPath(saveFolder);
		String filename = "";
		int filesize = 0;
		boolean result = false;
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(req, realFolder, fileSize, "euc-kr", new DefaultFileRenamePolicy());
			if (multi.getFilesystemName("filename") != null) {
				filename = multi.getFilesystemName("filename");
				filesize = (int) multi.getFile("filename").length();
			}
			data.setName(multi.getParameter("mem_name"));
			data.setContent(multi.getParameter("content"));
			data.setTitle(multi.getParameter("title"));
			data.setPass(multi.getParameter("pass"));
			data.setIp(req.getRemoteAddr());
			data.setFilename(filename);
			data.setFilesize(filesize);
			result = boardDao.insert(data);
			if (result == false) {
				return null;
			}
			forward.setRedirect(true);
			forward.setPath("./boardList.board");
			return forward;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
}
