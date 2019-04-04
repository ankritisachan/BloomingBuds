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
 * Servlet implementation class CTaccount
 */
@WebServlet("/CTaccount")
public class CTaccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CTaccount() {
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
		String uid=request.getParameter("ctid");
		String upass=request.getParameter("ctpassword");
		String query="insert into login values(?,?,?)";
		con=Dboperation.createConnection();
		try{
			ps=con.prepareStatement(query);
			ps.setString(1, uid);
			ps.setString(2, upass);
			ps.setString(3, "caretaker");
			int z=ps.executeUpdate();
			if(z>0){
				request.setAttribute("verify","caretaker account created successfully");
				RequestDispatcher rd=request.getRequestDispatcher("/jsp/akcaretaker.jsp");
						rd.forward(request, response);
			}
		}
		catch(SQLException se){
			System.out.println(se);
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
