package bloomingBuds.ser;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.jmx.snmp.Enumerated;

import java.sql.*;
import java.util.Enumeration;

import bloomingBuds.dbinfo.*;

/**
 * Servlet implementation class Upload
 */
@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private PreparedStatement ps=null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
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
		HttpSession hs=request.getSession(false);
		String userid=(String)hs.getAttribute("log");
		
		
		ServletContext sc=getServletContext();
		String path=sc.getRealPath("/");
		System.out.println(path);
		String newpath=path+userid;
		File f =new File(newpath);
		if(!f.exists()){
			f.mkdir();
		}
		MultipartRequest mpr=new MultipartRequest(request, newpath,6*1024*1024,new DefaultFileRenamePolicy());
		System.out.println("data uploaded");
		String title=mpr.getParameter("title");
		System.out.println(title);
		Enumeration<String> em=mpr.getFileNames();
		String ctrlname=null;
		String filename=null;
		File fileobj=null;
		if(mpr!=null){
			while(em.hasMoreElements()){
				ctrlname=(String)em.nextElement();
				fileobj=mpr.getFile(ctrlname);
				filename=fileobj.getName();
			}
		}
		
	String query="insert into uploads(userid,title,filename) values(?,?,?)";
	con=Dboperation.createConnection();
	try{
		ps=con.prepareStatement(query);
		ps.setString(1, userid);
		ps.setString(2, title);
		ps.setString(3, filename);
		int rw=ps.executeUpdate();
		if(rw>0){
			request.setAttribute("info", "uploaded successfully");
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/upload.jsp");
			rd.forward(request, response);
		}
		
	}
		
	
	catch(SQLException se){
		System.out.println(se);
	}
		
		finally{
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
