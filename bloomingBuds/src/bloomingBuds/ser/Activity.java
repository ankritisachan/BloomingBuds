package bloomingBuds.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bloomingBuds.dbinfo.Dboperation;

/**
 * Servlet implementation class Activity
 */
@WebServlet("/Activity")
public class Activity extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con = null;
	private PreparedStatement ps=null;
	private int flag;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Activity() {
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
		HttpSession hs = request.getSession(false);
		String user=(String)hs.getAttribute("log");
		if(user==null||hs.isNew())
		{
			 request.setAttribute("msg", "not authorised user pls do login");
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
			rd.forward(request, response); 
			
		}
		else{
			con=Dboperation.createConnection();
			String str="insert into activity(userid,activity,date) values(?,?,?)";
			try
			{
				
				ps=con.prepareStatement(str);
				ps.setString(1, "caretaker");
				ps.setString(2, request.getParameter("activ"));
				ps.setString(3, request.getParameter("date"));
				int rw=ps.executeUpdate();
				if(rw>0)
				{
					request.setAttribute("info"," one activity added successfully" );
					RequestDispatcher rd=request.getRequestDispatcher("/jsp/activity.jsp");
					rd.forward(request, response);
					
				}
				
				
			}
			catch (SQLException e) {
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
	
		