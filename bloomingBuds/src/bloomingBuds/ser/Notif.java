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
 * Servlet implementation class Notif
 */
@WebServlet("/Notif")
public class Notif extends HttpServlet {
	private Connection con = null;
	private PreparedStatement ps = null;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notif() {
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
		HttpSession hs = request.getSession(false);
		String user=(String)hs.getAttribute("log");
		if(user==null||hs.isNew())
		{
			 request.setAttribute("msg", "not authorised user pls do login");
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
			rd.forward(request, response); 
			
		}
		else{
		con = Dboperation.createConnection();
		String strins = "insert into notif(adminid,date,notification) values(?,?,?)";
		try {
			java.util.Date d = new java.util.Date();
			java.sql.Date dt = new java.sql.Date(d.getTime());
			ps=con.prepareStatement(strins);
			ps.setString(1, user);
			ps.setDate(2, dt);
			ps.setString(3, request.getParameter("notif"));
			int r = ps.executeUpdate();
			if(r>0)
				response.sendRedirect("/bloomingBuds/jsp/notif.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	}
}
