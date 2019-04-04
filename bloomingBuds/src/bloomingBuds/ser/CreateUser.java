package bloomingBuds.ser;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bloomingBuds.dbinfo.Dboperation;

import java.sql.*;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/CreateUser")
public class CreateUser extends HttpServlet {
	private Connection con = null;
	private PreparedStatement pslg,pskid = null;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateUser() {
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
		con=Dboperation.createConnection();
		HttpSession hs = request.getSession(false);
		String user=(String)hs.getAttribute("log");
		if(user==null||hs.isNew())
		{
			 request.setAttribute("msg", "not authorised user");
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
			rd.forward(request, response); 
			
		}
		else{
		String strlg = "insert into login values(?,?,?)";
		String strkid = "update kidregistration set userid=? where regid=?";
		try {
			pslg = con.prepareStatement(strlg);
			pskid = con.prepareStatement(strkid);
			System.out.println(pskid);
			pslg.setString(1, request.getParameter("userid"));
			pslg.setString(2, request.getParameter("password"));
			pslg.setString(3, "user");
			
			pskid.setString(1, request.getParameter("userid"));
			
			pskid.setString(2, request.getParameter("kid"));
			int rwlg = pslg.executeUpdate();
			int rwkid = pskid.executeUpdate();
			if(rwkid>0 && rwlg>0){
				request.setAttribute("info", "kid account created successfully");
				RequestDispatcher rd=request.getRequestDispatcher("/jsp/createuser.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				pslg.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				pskid.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	}
}
