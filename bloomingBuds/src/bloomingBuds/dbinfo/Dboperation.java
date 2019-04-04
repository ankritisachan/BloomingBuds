package bloomingBuds.dbinfo;
import java.sql.*;
public class Dboperation {
	private static Connection con=null;
	private static PreparedStatement ps=null;
	private static ResultSet rs=null;
	public static Connection createConnection(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/blooming","root","root");
		}
		catch(ClassNotFoundException|SQLException cse){
			System.out.println(cse);
		}
		return con;
	}
	public static ResultSet getData(String str,String uid){
		con=createConnection();
		try{
			ps=con.prepareStatement(str);
			ps.setString(1, uid);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
	}
	public static ResultSet getData(String str,String status,String ctid){
		con=createConnection();
		try{
			ps=con.prepareStatement(str);
			ps.setString(1, status);
			ps.setString(2, ctid);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
	}
	public static ResultSet getData(String str,int mid){
		con=createConnection();
		try{
			ps=con.prepareStatement(str);
			ps.setInt(1, mid);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
	}
	
	public static ResultSet getMsg(String str,String mid){
		con=createConnection();
		try{
			ps=con.prepareStatement(str);
			ps.setString(1, mid);
			ps.setString(2, "true");
			rs=ps.executeQuery();
			
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
	}
	public static ResultSet getData(String str){
		con=createConnection();
		try{
			ps=con.prepareStatement(str);
			rs=ps.executeQuery();
			
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
	}
	public static ResultSet getData(String str,String status,String assign,String ctid){
		con=createConnection();
		try{
			ps=con.prepareStatement(str);
			ps.setString(1, status);
			ps.setString(2, assign);
			ps.setString(3, ctid);
			
			rs=ps.executeQuery();
			
		}
		catch(SQLException se){
			System.out.println(se);
		}
		return rs;
	}
}
