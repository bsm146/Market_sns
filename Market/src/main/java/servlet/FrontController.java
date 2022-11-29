package servlet;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;

import org.apache.catalina.Session;

@WebServlet("*.one")
public class FrontController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		if (commandStr.equals("/regist.one")) {
			registFunc(request);
		}
		else if (commandStr.equals("/login.one")) {
			loginFunc(request);
		}
		else if (commandStr.equals("/freeboard.one")) {
			freeboardFunc(request);
		}
		
		request.setAttribute("uri", uri);
		request.setAttribute("commandStr", commandStr);
		request.getRequestDispatcher("/13Servlet/FrontController.jsp").forward(request, response);
	}
	
	void registFunc(HttpServletRequest request) {
		request.setAttribute("resultValue", "<h4>회원가입<h4");
		List<String> list = new Vector<String>();
		list.add("a");
		list.add("b");
		list.add("c");
		request.setAttribute("list", list);
		
	}
	
	void loginFunc(HttpServletRequest request) {
		request.setAttribute("resultValue", "<h4>로그인<h4");
	}
	
	void freeboardFunc(HttpServletRequest request) {
		request.setAttribute("resultValue", "<h4>자유게시판<h4");
	}
}