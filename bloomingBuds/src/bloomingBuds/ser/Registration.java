package bloomingBuds.ser;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bloomingBuds.dbinfo.*;


/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Connection con = null;
	private PreparedStatement ps = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
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
		String name = request.getParameter("kname");
		String add = request.getParameter("kadd");
		String email = request.getParameter("kmail");
		long phone = Long.parseLong(request.getParameter("kphone"));
		String gender = request.getParameter("kgen");
		String mother = request.getParameter("mother");
		String father = request.getParameter("father");
		String school = request.getParameter("school");
		String draft = request.getParameter("draft");
		String date = request.getParameter("date");
		
		String strreg="insert into kidregistration(name,address,email,phoneno,gender,mothername,fathername,schoolname,draftno,date,status,assignstatus,caretakerid) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		con = Dboperation.createConnection();
		
		try{
		ps = con.prepareStatement(strreg);
		ps.setString(1, name);
		ps.setString(2, add);
		ps.setString(3, email);
		ps.setLong(4, phone);
		ps.setString(5, gender);
		ps.setString(6, mother);
		ps.setString(7, father);
		ps.setString(8, school);
		ps.setString(9, draft);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-mm-dd");
		try {
			java.util.Date d = sd.parse(date);
			long ld = d.getTime();
			java.sql.Date s = new java.sql.Date(ld);
			ps.setDate(10, s);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		ps.setString(11, "false");
		ps.setString(12, "not assigned");
		ps.setString(13, "none");
		
		System.out.println(ps);
		int rowReg = ps.executeUpdate();
		
		if(rowReg>0){
			request.setAttribute("info","You are registered successfully. Userid and password will be provided on your email after verification.");
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/regmessage.jsp");
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
