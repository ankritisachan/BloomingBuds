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
 * Servlet implementation class Deleteupload
 */
@WebServlet("/Deleteupload")
public class Deleteupload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deleteupload() {
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
		String[] upid=request.getParameterValues("chkbox");
		
		String query="delete from uploads where uploaded=?";
		con=Dboperation.createConnection();
		try{
			ps=con.prepareStatement(query);
			for(int i=0;i<upid.length;i++){
				int uploadid=Integer.parseInt(upid[i]);
				ps.setInt(1,uploadid);
				ps.addBatch();
				
			}
			
			int[] rw=ps.executeBatch();
			int flag=0;
			for(int j=0;j<rw.length;j++)
			{
				if(rw[j]<0)
					{flag=1;
				break;}
			}
			if(flag==0){
				
				request.setAttribute("info", " file is deleted");
				RequestDispatcher rd=request.getRequestDispatcher("/jsp/upload.jsp");
				rd.forward(request, response);
			}
			
		}
		
		catch(SQLException se){
			System.out.println(se);
		}
		
		finally {
			if(ps!=null)
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		
		
		
	}

}
