package bloomingBuds.ser;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import bloomingBuds.dbinfo.*;

/**
 * Servlet implementation class Contact
 */
@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contact() {
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
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		long ph=Long.parseLong(phone);
		String query=request.getParameter("text");
		String sql1="insert into enquiry(name,email,phone,enquiry) values(?,?,?,?)";
		con=Dboperation.createConnection();
		try{
			ps=con.prepareStatement(sql1);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setLong(3, ph);
			ps.setString(4, query);
			int s=ps.executeUpdate();
			if(s>0){
				request.setAttribute("key", "submited successfully");
				RequestDispatcher rd=request.getRequestDispatcher("/jsp/contactus.jsp");
				rd.forward(request, response);
			}
			else{
				request.setAttribute("key", "please try again");
				RequestDispatcher rd=request.getRequestDispatcher("/jsp/contactus.jsp");
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
		}
	}

}
