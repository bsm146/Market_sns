package servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;

public class MemberAuth extends HttpServlet {
	
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		
		// application 내장객체 얻어오기
		ServletContext application = this.getServletContext();
		
		// DB 연결
		dao = new MemberDAO();
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 서블릿 초기화 매개변수
		String admin_id = this.getInitParameter("admin_id");
		
		// 인증 요청한 아이디, 패스워드
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		// 회원 테이블에서 요청한 아이디, 패스워드에 해당하는 회원 찾기
		MemberDTO memberDTO = dao.getMemberDTO(id, pass);
		
		// 찾은 회원 이름 출력, 회원 처리
		String memberName = memberDTO.getName();
		
		// 회원이면
		if (memberName != null) {
			request.setAttribute("authMessage", memberName + " 회원");
		}
		
		// 회원이 아니면
		else {
			
			// 회원이 아니지만 관리자일수도 있음
			if (admin_id.equals(id)) {
				request.setAttribute("authMessage", admin_id + " 관리자");
			}
			
			// 회원, 관리자가 아니라서 비회원임 
			else {
				request.setAttribute("authMessage", " 회원 아님");
			}
		}
		
		request.getRequestDispatcher("/13Servlet/MemberAuth.jsp").forward(request, response);
	}
	
	@Override
	public void destroy() {
		dao.close();
	}
}