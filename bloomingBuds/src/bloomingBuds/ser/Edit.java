package bloomingBuds.ser;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import bloomingBuds.dbinfo.*;

/**
 * Servlet implementation class Edit
 */
@WebServlet("/Edit")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private  Connection con=null;
	private  PreparedStatement ps=null;

	
	
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		String userid=(String)hs.getAttribute("log");
		String em=request.getParameter("ctemail");
		
		String add=request.getParameter("ctaddress");
		long pho=Long.parseLong(request.getParameter("ctphone"));
		
		String strupdate="update caretaker set address=?,email=?,phoneno=? where userid=?";
		con=Dboperation.createConnection();
		try{
			
		ps=con.prepareStatement(strupdate);
		ps.setString(1,add);
		ps.setString(2,em);
		ps.setLong(3, pho);
		ps.setString(4,userid);
		
		int rw=ps.executeUpdate();
		
		if(rw>0)
		{
			response.sendRedirect("/bloomingBuds/jsp/ctprofile.jsp");
		}
		}
	catch(SQLException se)	
		
	{
		System.out.println(se);
	}

		finally{
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
