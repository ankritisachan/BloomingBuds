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
 * Servlet implementation class KidAssignment
 */
@WebServlet("/KidAssignment")
public class KidAssignment extends HttpServlet {
	private Connection con = null;
	private PreparedStatement psct,psk,pscnt,psins = null;
	ResultSet rs = null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KidAssignment() {
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
			String str = "insert into caretakerassignment(caretakerid,kidid) values(?,?)";
			String up = "update kidregistration set assignstatus=?,caretakerid=? where userid=?";
			String query="select totalkids from caretaker where userid=?";
			/*String cnt = "select count(caretakerid) as total from caretakerassignment where caretakerid=?";*/
			String ins = "update caretaker set totalkids=? where userid=?";
			con=Dboperation.createConnection();
		String ct = request.getParameter("caretaker");
		String[] k = request.getParameterValues("kid");
			try {
				con.setAutoCommit(false);
				psct = con.prepareStatement(str);
				for(int i =0;i<k.length;i++){
					psct.setString(1, ct);
					psct.setString(2, k[i]);
					psct.addBatch();
				}
				int[] rwct=psct.executeBatch();
				
				psk = con.prepareStatement(up);
				
				for(int i =0;i<k.length;i++){
					psk.setString(1,"assigned");
					psk.setString(2, ct);
					psk.setString(3, k[i]);
					psk.addBatch();
					System.out.println(psk);
				}
				int[] rwk =psk.executeBatch();
				System.out.println(rwct.length+"&"+rwk.length);
				
				/*pscnt = con.prepareStatement(cnt);
				pscnt.setString(1, ct);
				rs = pscnt.executeQuery();
				int count = rs.getInt("total");
				System.out.println(count);*/
				pscnt=con.prepareStatement(query);
				pscnt.setString(1, ct);
				rs=pscnt.executeQuery();
				if(rs.next()){
				psins = con.prepareStatement(ins);
				int total=k.length+rs.getInt("totalkids");
				System.out.println(total);
				psins.setInt(1,total);
				psins.setString(2,ct);
				int r = psins.executeUpdate();}
				
				int count1 = 0;
				for(int a=0;a<rwct.length;a++){
					if(rwct[a]<1){
						count1++;
						break;
					}
				}
				int count2 = 0;
				for(int a=0;a<rwk.length;a++){
					if(rwk[a]<1){
						count2++;
						break;
					}
				}
				if(count1==0&&count2==0){
					con.setAutoCommit(true);
					request.setAttribute("info", "kid assigned successfully");
					RequestDispatcher rd=request.getRequestDispatcher("/jsp/kidassignment.jsp");
					rd.forward(request, response);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				try {
					psct.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					psk.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					pscnt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				/*try {
					psins.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}*/
			}	
		}
	}
}