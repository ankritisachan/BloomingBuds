package bloomingBuds.ser;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bloomingBuds.dbinfo.*;
import java.sql.*;

/**
 * Servlet implementation class Createprofile
 */
@WebServlet("/Createprofile")
public class Createprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Createprofile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid=request.getParameter("userid");
		String name=request.getParameter("name");
		String add=request.getParameter("ctaddress");
		String email=request.getParameter("cemail");
		String phone=request.getParameter("cphone");
		String gender=request.getParameter("kgen");
		con=Dboperation.createConnection();
		try{
			con.setAutoCommit(false);
			String creg="insert into caretaker(userid,name,address,email,phoneno,gender,totalkids) values(?,?,?,?,?,?,?)";
			ps=con.prepareStatement(creg);
			ps.setString(1,uid);
			ps.setString(2, name);
			ps.setString(3, add);
			ps.setString(4, email);
			ps.setString(5, phone);
			ps.setString(6, gender);
			ps.setInt(7, 0);
			int rows=ps.executeUpdate();
			if(rows>0)
			{
				con.commit();
				System.out.println("row inserted");
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


