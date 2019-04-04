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
import javax.servlet.http.HttpSession;

import bloomingBuds.dbinfo.*;

/**
 * Servlet implementation class Compose
 */
@WebServlet("/Compose")
public class Compose extends HttpServlet {
	private Connection con = null;
	private PreparedStatement ps = null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Compose() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {HttpSession hs = request.getSession(false);
	String user=(String)hs.getAttribute("log");
	String recid = request.getParameter("recid");
	String subject = request.getParameter("subject");
	String msg = request.getParameter("msg");
	java.util.Date d = new java.util.Date();
	java.sql.Date dt = new java.sql.Date(d.getTime());
	con = Dboperation.createConnection();
	String strsend = "insert into message(senderid,receiverid,msgtext,subject,date,senderstatus,receiverstatus) values(?,?,?,?,?,?,?)";

    try {
		ps = con.prepareStatement(strsend);
		ps.setString(1, user);
		ps.setString(2,recid );
		ps.setString(3, msg);
		ps.setString(4, subject);
		ps.setDate(5, dt);
		ps.setString(6, "true");
		ps.setString(7, "true");
		int rw = ps.executeUpdate();
		if(rw>0){
			response.sendRedirect("/bloomingBuds/jsp/sentitem.jsp");
		}
	} catch (SQLException e) {
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

