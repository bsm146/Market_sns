package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.board.BoardDAO;

@WebServlet("/13Servlet/Controller.do")
public class Controller extends HttpServlet {
	
	public static String PageMove = null;
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String PageRoute = request.getParameter("PageRoute");
		BoardDAO dao = new BoardDAO();
		
		// board/List - 게시글 전체 삭제
		if (PageRoute.equals("BoardAllDelete")) {
			dao.allDeletePost(request, response);
		}
		
		// board/View - 게시글 삭제
		else if (PageRoute.equals("BoardDelete")) {
			dao.deletePost(request, response);
		}
		
		// board/Edit - 게시글 수정
		else if (PageRoute.equals("BoardEdit")) {
			dao.updateEdit(request, response);
		}
		
		// board/List - 게시글 불러오기
		else if (PageRoute.equals("ListAdd")) {
			dao.ListAdd(request, response);
		}
		
		// board/MyPageUpdate - 마이페이지 정보 수정
		else if (PageRoute.equals("MyPageUpdate")) {
			dao.MyPageUpdate(request, response);
		}
		
		// board/Write - 게시글 작성
		else if (PageRoute.equals("BoardWrite")) {
			dao.InsertWrite(request, response);
		}
		
		// board/Login - 로그인
		else if (PageRoute.equals("Login")) {
			dao.Login(request, response);
		}
		
		
		dao.close();
		response.sendRedirect(PageMove);
	}
	
	
	// board/List - 게시글 전체 삭제
//	public void BoardAllDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		dao.allDeletePost();
//		PageMove = "../board/List.jsp";
//	}
	
	// board/View - 게시글 삭제
//	public void BoardDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		dao.deletePost(request, response);
		
//	}
	
	// board/Edit - 게시글 수정
//	public void BoardEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		PageMove = "../board/List.jsp?num=" + dao.updateEdit(request, response);
//	}
	
	// board/List - 게시글 불러오기
//	public void ListAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//	}
	
	// board/MyPageUpdate - 마이페이지 정보 수정
//	public void MyPageUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		
//	}
}