package model1.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.JDBConnect;
import membership.MemberDAO;
import membership.MemberDTO;
import servlet.Controller;

public class BoardDAO extends JDBConnect {
	
	BoardDTO dto = new BoardDTO();
	public HttpSession session;
	
	
    public BoardDAO() {
        
    }

    // 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0; 	// 결과(게시물 수)를 담을 변수

        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) FROM board";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }

        try {
            stmt = con.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행
            rs.next();  					// 커서를 첫 번째 행으로 이동
            totalCount = rs.getInt(1);  	// 첫 번째 칼럼 값을 가져옴
            System.out.println("게시물 수 구하기 성공");
        }
        catch (Exception e) {
            System.out.println("게시물 수 구하기 실패");
            e.printStackTrace();
        }

        return totalCount; 
    }
    
    // 검색 조건에 맞는 게시물 목록을 반환합니다.
    public List<BoardDTO> selectList(Map<String, Object> map) { 
        List<BoardDTO> bbs = new Vector<BoardDTO>();  // 결과(게시물 목록)를 담을 변수

        String query = "SELECT * FROM board "; 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY num DESC "; 

        try {
            stmt = con.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행

            while (rs.next()) {  // 결과를 순화하며...
                // 한 행(게시물 하나)의 내용을 DTO에 저장
                BoardDTO dto = new BoardDTO(); 

                dto.setNum(rs.getString("num"));         		// 일련번호
                dto.setTitle(rs.getString("title"));     		// 제목
                dto.setContent(rs.getString("content")); 		// 내용
                dto.setPostdate(rs.getDate("postdate"));  		// 작성일
                dto.setId(rs.getString("id"));            		// 작성자 아이디
                dto.setVisitcount(rs.getString("visitcount"));  // 조회수

                bbs.add(dto);  // 결과 목록에 저장
            }
            System.out.println("게시물 조회 성공");
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 실패");
            e.printStackTrace();
        }

        return bbs;
    }
    
    // 검색 조건에 맞는 게시물 목록을 반환합니다(페이징 기능 지원).
    public List<BoardDTO> selectListPage(Map<String, Object> map) {
        List<BoardDTO> bbs = new Vector<BoardDTO>();  // 결과(게시물 목록)를 담을 변수
        
        // 쿼리문 템플릿  
        String query = " SELECT * FROM ( "
                     + "    SELECT Tb.*, ROWNUM rNum FROM ( "
                     + "        SELECT * FROM board ";

        // 검색 조건 추가 
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        
        query += "      ORDER BY num DESC "
               + "     ) Tb "
               + " ) "
               + " WHERE rNum BETWEEN ? AND ?"; 

        try {
            // 쿼리문 완성 
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            
            // 쿼리문 실행 
            rs = psmt.executeQuery();
            
            while (rs.next()) {
                // 한 행(게시물 하나)의 데이터를 DTO에 저장
                BoardDTO dto = new BoardDTO();
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString("visitcount"));

                // 반환할 결과 목록에 게시물 추가
                bbs.add(dto);
                System.out.println("게시물 조회 성공");
            }
        } 
        catch (Exception e) {
            System.out.println("게시물 조회 실패");
            e.printStackTrace();
        }
        
        // 목록 반환
        return bbs;
    }

    // 게시글 데이터를 받아 DB에 추가합니다. 
    public void InsertWrite(HttpServletRequest request, HttpServletResponse response) {
        
        try {
            String query = "INSERT INTO board (title, content, id, visitcount) VALUES (?, ?, ?, 0)";
        	session = request.getSession();
            psmt = con.prepareStatement(query);
            psmt.setString(1, request.getParameter("title"));  
            psmt.setString(2, request.getParameter("content"));
            psmt.setString(3, (String)session.getAttribute("id"));
            psmt.executeUpdate();
            Controller.PageMove = "../board/List.jsp";
            System.out.println("게시물 입력 성공");
        }
        catch (Exception e) {
            System.out.println("게시물 입력 실패");
            e.printStackTrace();
        }
    }

    // 지정한 게시물을 찾아 내용을 반환합니다.
    public BoardDTO selectView(String num) { 
        BoardDTO dto = new BoardDTO();
        
        // 쿼리문 준비
        String query = "SELECT B.*, M.name " 
                     + " FROM member M INNER JOIN board B " 
                     + " ON M.id=B.id "
                     + " WHERE num=?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);    // 인파라미터를 일련번호로 설정 
            rs = psmt.executeQuery();  // 쿼리 실행 

            // 결과 처리
            if (rs.next()) {
                dto.setNum(rs.getString(1)); 
                dto.setTitle(rs.getString(2));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setId(rs.getString("id"));
                dto.setVisitcount(rs.getString(6));
                dto.setName(rs.getString("name")); 
            }
            System.out.println("게시물 상세보기 성공");
        } 
        catch (Exception e) {
            System.out.println("게시물 상세보기 실패");
            e.printStackTrace();
        }
        
        return dto; 
    }

    // 지정 게시물 조회수 +1
    public void updateVisitCount(String num) { 
        try {
        	String query = "UPDATE board SET visitcount=visitcount+1 WHERE num=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            psmt.executeUpdate();
            System.out.println("게시물 조회수 증가 성공");
        } 
        catch (Exception e) {
            System.out.println("게시물 조회수 증가 실패");
            e.printStackTrace();
        }
    }
    
    // 지정 게시물을 수정
	public void updateEdit(HttpServletRequest request, HttpServletResponse response) { 
    	
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setNum(request.getParameter("num"));
        
        try {
            String query = "UPDATE board SET title=?, content=? WHERE num=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getNum());
            psmt.executeUpdate();
            Controller.PageMove = "../board/List.jsp?num=" + dto.getNum();
            System.out.println("게시물 수정 성공");
        } 
        catch (Exception e) {
            System.out.println("게시물 수정 실패");
            e.printStackTrace();
        }
    }

    // 지정한 게시물을 삭제합니다.
	public int deletePost(HttpServletRequest request, HttpServletResponse response) { 
    	
		dto.setNum(request.getParameter("num"));
        int result = 0;

        try {
            String query = "DELETE FROM board WHERE num=?"; 
            psmt = con.prepareStatement(query); 
            psmt.setString(1, dto.getNum()); 
            result = psmt.executeUpdate(); 
            Controller.PageMove = "../board/List.jsp";
            System.out.println("게시물 삭제 성공");
        } 
        catch (Exception e) {
            System.out.println("게시물 삭제 실패");
            e.printStackTrace();
        }
        
        return result; // 결과 반환
    }
    
    // 회원 가입
    public void insertMember(String id, String pass, String name) {
        
        try {
            String query = "INSERT INTO member (id, pass, name) values (?, ?, ?);";
            psmt = con.prepareStatement(query);  // 동적 쿼리 
            psmt.setString(1, id);  
            psmt.setString(2, pass);
            psmt.setString(3, name);
            psmt.executeUpdate(); 
            System.out.println("회원 가입 성공");
        }
        catch (Exception e) {
            System.out.println("회원 가입 실패");
            e.printStackTrace();
        }
    }
    
    // 전체 게시물을 삭제
    public void allDeletePost(HttpServletRequest request, HttpServletResponse response) { 

        try {
            String query = "delete from board"; 
            psmt = con.prepareStatement(query); 
            psmt.executeUpdate(); 
            Controller.PageMove = "../board/List.jsp";
            System.out.println("전체 게시물 삭제 성공");
        } 
        catch (Exception e) {
            System.out.println("전체 게시물 삭제 실패");
            e.printStackTrace();
        }
        
    }
    
    // 아이디 중복 체크
    public int idOverlap(String id) {

        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT * FROM member";

        try {
            stmt = con.createStatement();   // 쿼리문 생성
            rs = stmt.executeQuery(query);  // 쿼리 실행
            while (rs.next()) {
				if (id.equals(rs.getString("id"))) {
					System.out.println("아이디 중복 체크 성공");
					return 1;
				}
			}
        }
        catch (Exception e) {
            System.out.println("아이디 중복 체크 실패");
            e.printStackTrace();
        }
        return 0;
    }
    
    // 마이페이지 내 글 보기
    public ArrayList<BoardDTO> myBoard(String id) {
		
    	ArrayList<BoardDTO> bo = new ArrayList<BoardDTO>();
    	
		try {
			String sql = "select * from board where id=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();	// rs 필요할때
			
			while (rs.next()) {
				BoardDTO dto = new BoardDTO(); 
	            dto.setNum(rs.getString("num"));         		// 일련번호
	            dto.setTitle(rs.getString("title"));     		// 제목
	            dto.setContent(rs.getString("content")); 		// 내용
	            dto.setPostdate(rs.getDate("postdate"));  		// 작성일
	            dto.setId(rs.getString("id"));            		// 작성자 아이디
	            dto.setVisitcount(rs.getString("visitcount"));  // 조회수
				bo.add(dto);
			}
			System.out.println("마이페이지 내 글 보기 성공");
		}
		catch (Exception e) {
            System.out.println("마이페이지 내 글 보기 실패");
            e.printStackTrace();
        }
		return bo;
    }
    
    // 리스트에 게시글 담기
    public void ListAdd(HttpServletRequest request, HttpServletResponse response) {
		
    	Map<String, Object> param = new HashMap<String, Object>();
    	String searchField = request.getParameter("searchField");
    	String searchWord = request.getParameter("searchWord");
    	
    	if (searchWord != null) {
    	    param.put("searchField", searchField);
    	    param.put("searchWord", searchWord);
    	}
    	
    	int totalCount = selectCount(param);  		// 게시물 수 확인
    	List<BoardDTO> dto = selectList(param);
    	
    	System.out.println("리스트에 게시글 담기");
    	
    	request.setAttribute("totalCount", selectCount(param));
    	request.setAttribute("list", dto);
    	
    	Controller.PageMove = "../board/List2.jsp";
    }
    
    // 마이페이지 정보 수정
	public void MyPageUpdate(HttpServletRequest request, HttpServletResponse response) { 
        
		String pw = request.getParameter("pw1");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth1") + "/" + request.getParameter("birth2") + "/" + request.getParameter("birth3");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		String number = request.getParameter("number");
		String address = request.getParameter("address");
		String id = request.getParameter("id");
		
        try {
            String query = "UPDATE member SET pass=?, name=?, gender=?, birth=?, email=?, number=?, address=? WHERE id=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, pw);
            psmt.setString(2, name);
            psmt.setString(3, gender);
            psmt.setString(4, birth);
            psmt.setString(5, email);
            psmt.setString(6, number);
            psmt.setString(7, address);
            psmt.setString(8, id);
            psmt.executeUpdate();
            Controller.PageMove = "../board/MyPage.jsp";
            System.out.println("마이페이지 정보 수정 성공");
        } 
        catch (Exception e) {
            System.out.println("마이페이지 정보 수정 실패");
            e.printStackTrace();
        }
    }
	
    // 로그인 관련
    public void Login(HttpServletRequest request, HttpServletResponse response) {
		
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	session = request.getSession();
    	MemberDAO mdao = new MemberDAO();
    	MemberDTO mdto = mdao.getMemberDTO(id, pw);
    	
    	
    	// 로그인 페이지에서 id가 빈값으로 넘어왔으면 다시 로그인 페이지로
    	if (id.equals("")) {
    		session.setAttribute("nullId", 0);
    		Controller.PageMove = "../board/Login.jsp";
    		return;
    	}
    	
    	// 로그인 페이지에서 pw가 빈값으로 넘어왔으면 다시 로그인 페이지로
    	else if (pw.equals("")) {
    		session.setAttribute("nullPw", 0);
    		Controller.PageMove = "../board/Login.jsp";
    		return;
    	}
    	
    	// 로그인 페이지에서 입력한 id, pw가 member 테이블에 있으면 세션 설정 후 어느 페이지에서 왔는지에 따라 다시 그 페이지로 보내줌
    	if (id.equals(mdto.getId()) && pw.equals(mdto.getPass())) {
    		session.setAttribute("id", id);
    		session.setAttribute("pw", pw);
    		
    		// board/Write 에서 로그인 했을때
    		if (session.getAttribute("route") != null && session.getAttribute("route") == "Write") {
    			session.removeAttribute("Write");
    			Controller.PageMove = "../board/Write.jsp";
    			return;
    		}
    		
    		// product/ProductSelectAll 에서 로그인 했을때
    		else if (session.getAttribute("route") != null && session.getAttribute("route") == "ProductSelectAll") {
    			session.removeAttribute("ProductSelectAll");
    			Controller.PageMove = "../product/ProductSelectAll.jsp";
    			return;
    		}
    		
    		// board/List 에서 로그인 했을때
    		else if (session.getAttribute("route") != null && session.getAttribute("route") == "List") {
    			session.removeAttribute("List");
    			Controller.PageMove = "../board/List.jsp";
    			return;
    		}
    	}
    	
    	// 회원이 아니면 다시 로그인 페이지로
    	else {
    		session.setAttribute("member", 0);
    		Controller.PageMove = "../board/Login.jsp";
    		return;
		}
    }
}