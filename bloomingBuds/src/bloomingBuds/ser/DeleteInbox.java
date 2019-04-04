package bloomingBuds.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bloomingBuds.dbinfo.*;

/**
 * Servlet implementation class DeleteInbox
 */
@WebServlet("/DeleteInbox")
public class DeleteInbox extends HttpServlet {
	private Connection con = null;
	private PreparedStatement ps = null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteInbox() {
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
		String[] msgarr = request.getParameterValues("chkbox");
		con = Dboperation.createConnection();
		String strupdate="update message set receiverstatus=? where msgid=?";
		try{
			con.setAutoCommit(false);
			ps = con.prepareStatement(strupdate);
			for(int i=0;i<msgarr.length;i++){
				ps.setInt(2, Integer.parseInt(msgarr[i]));
				ps.setString(1, "false");
				ps.addBatch();}
			
				int[] rw = ps.executeBatch();
				int count=0;
				for(int i =0;i<rw.length;i++){
					if(rw[i]<1){
						count++;break;
					}
				}
				if(count==0){
					con.setAutoCommit(true);
					response.sendRedirect("/bloomingBuds/jsp/inbox.jsp");
				}
			}
		catch(SQLException e ){
			System.out.println(e);
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
