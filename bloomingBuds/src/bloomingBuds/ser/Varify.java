package bloomingBuds.ser;

import java.io.IOException;
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
 * Servlet implementation class Varify
 */
@WebServlet("/Varify")
public class Varify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement ps=null;
	private java.sql.Connection con=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Varify() {
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
		HttpSession hs=request.getSession(false);
		String userid=(String)hs.getAttribute("log");

		if(userid==null|| hs.isNew())
		{
			request.setAttribute("msg", "not authorised user pls do login");
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
			rd.forward(request, response); 
		}
		else{
		String arr[]=request.getParameterValues("chkbox");
		String strdel="update kidregistration set status=? where regid=?";
		
		con=Dboperation.createConnection();
		try{
			con.setAutoCommit(false);
			ps=con.prepareStatement(strdel);
			for(int i=0;i<arr.length;i++)
			{
				ps.setString(1,"true");
				ps.setInt(2,Integer.parseInt(arr[i]));
				ps.addBatch();
			}
			int []rw=ps.executeBatch();
			int flag=0;
			for(int j=0;j<rw.length;j++)
			{
				if(rw[j]<0)
					flag=1;
			}
			
			if(flag==0)
			{con.commit();
			request.setAttribute("info", "Draft verified");
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/verifydraft.jsp");
			rd.forward(request, response);
			
			}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		finally
		{
			try{
				if(ps!=null)
				{
					ps.close();
				}
			}
				catch(SQLException se)
				{
					System.out.println(se);
				}
			}
	}

}
	}


