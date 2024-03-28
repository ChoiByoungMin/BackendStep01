package spms.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/delete")
@SuppressWarnings("serial")
public class MemberDeleteServlet extends HttpServlet{

//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		Connection conn = null;
//		Statement stmt = null;
//		ResultSet rs = null;
//		
//		try {
//			ServletContext sc = this.getServletContext();
//			Class.forName(sc.getInitParameter("driver"));
//			conn = DriverManager.getConnection(
//					sc.getInitParameter("url"),
//					sc.getInitParameter("username"),
//					sc.getInitParameter("password")
//					);
//			stmt = conn.createStatement();
//			rs = stmt.executeQuery(
//					"SELECT mno,email,mname,cre_date FROM members" +
//							" WHERE mno=" + req.getParameter("no")
//					);
//			
//			rs.next();
//			
//			resp.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = resp.getWriter();
//			out.println("<html><head><title></title></head>");
//			out.println("<body><h1>회원정보</h1>");
//			out.println("<form action='delete' method='post'>");
//			out.println("번호: <input type='text' name='no' value='" + 
//					req.getParameter("no") + "' readonly><br>");
//			out.println("이름: <input type='text' name='name'" +
//					" value='" + rs.getString("mname") + "'><br>");
//			out.println("이메일: <input type='text' name='email'" + 
//					" value='" + rs.getString("email") + "'><br>");
//			out.println("가입일: " + rs.getDate("CRE_DATE") + "<br>");
//			out.println("<input type='submit' value='삭제'>");
//			out.println("<input type='button' value='취소'" + 
//						" onclick='location.href=\"list\"'>");
//			out.println("</form>");
//			
//			out.println("</body></html>");
//			
//		}catch(Exception e){
//			
//		}finally {
//			try {if(rs!=null) rs.close();} catch(Exception e) {}
//			try {if(stmt!=null) stmt.close();} catch(Exception e) {}
//			try {if(conn!=null) conn.close();} catch(Exception e) {}
//		}
//	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			ServletContext sc = this.getServletContext();
			Class.forName(sc.getInitParameter("driver"));
			conn = DriverManager.getConnection(
					sc.getInitParameter("url"),
					sc.getInitParameter("username"),
					sc.getInitParameter("password")
					);
			stmt = conn.prepareStatement(
						"DELETE FROM members WHERE mno=?"
					);
			stmt.setInt(1, Integer.parseInt(req.getParameter("no")));
			stmt.executeUpdate();
			
			resp.sendRedirect("list");
			
		}catch(Exception e) {
			
		}finally {
			try {if(stmt!=null) stmt.close();} catch(Exception e) {}
			try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
	}
}
