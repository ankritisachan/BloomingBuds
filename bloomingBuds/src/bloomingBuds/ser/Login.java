package bloomingBuds.ser;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import bloomingBuds.dbinfo.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private  Connection con=null;
	private  PreparedStatement ps=null;
	private ResultSet rs=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getParameter("txtid");
		String upass=request.getParameter("txtpass");
		String strsql="select * from login where userid=? and userpass=?";
		con=Dboperation.createConnection();
		try{
			ps=con.prepareStatement(strsql);
			ps.setString(1, uid);
			ps.setString(2, upass);
			rs=ps.executeQuery();
			if(rs.next()){
				HttpSession hs=request.getSession();
				hs.setAttribute("log", uid);
				String ut=rs.getString("usertype");
				if(ut.equals("admin")){
					response.sendRedirect("/bloomingBuds/jsp/admin.jsp");
				}
				if(ut.equals("user")){
					response.sendRedirect("/bloomingBuds/jsp/parent.jsp");
				}
				if(ut.equals("caretaker")){
					String strsql1="select userid from caretaker where userid=?";
					con=Dboperation.createConnection();
					try{
						ps=con.prepareStatement(strsql1);
						ps.setString(1, uid);
						rs=ps.executeQuery();
						if(rs.next()){
							response.sendRedirect("/bloomingBuds/jsp/ctprofile.jsp");
						}
						else{
							response.sendRedirect("/bloomingBuds/jsp/createprofile.jsp");
						}
					}
					catch(SQLException se){
						System.out.println(se);
					}
				}
				
			}
			
			else{
				request.setAttribute("msg", "invalid userid and password");
				RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
				rd.forward(request, response);
			}
			
			
			
			
		}
		catch(SQLException se){
			System.out.println(se);
		}
		finally {
			if(ps!=null){
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	

}
