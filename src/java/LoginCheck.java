import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class LoginCheck extends HttpServlet
{
	Connection con;
	//Statement st;
	PreparedStatement st;
	ResultSet rs;
//    private MysqlConnect _dbConnection;

	public void init(ServletConfig sc) throws ServletException
	{
	    try{
				super.init(sc);
//                                _dbConnection = MysqlConnect.getDbCon();
//				Class.forName("com.mysql.jdbc.Driver");
				
			}catch(Exception exc){exc.printStackTrace();}
	}

	public void service(HttpServletRequest hreq , HttpServletResponse hresp) throws ServletException,IOException
	{
		PrintWriter out=hresp.getWriter();
		try{
//			con = MysqlConnect.getDbCon().conn;
			con = MysqlConnect.getDbCon().conn;
			/*	String str1 = hreq.getParameter("login").trim().toLowerCase();   
			    String str2 = hreq.getParameter("pass").trim().toLowerCase();   	
				System.out.println(str1+" "+str2);
				String comm="select USER_NAME,PASSWORD from REGISTRATION where lower(USER_NAME)='"+str1+"' and lower(PASSWORD)='"+str2+"'";
				out.println(comm);*/
				st = con.prepareStatement("select USER_NAME,PASSWORD from REGISTRATION where USER_NAME=? and PASSWORD=?");
				
				String str1 = hreq.getParameter("login").trim();   
			    String str2 = hreq.getParameter("pass").trim();   	
				st.setString(1,str1);
			    st.setString(2,str2);
			//  st=con.createStatement();
				
			    rs = st.executeQuery();
			//	System.out.println(rs);
						
	            if(rs.next())
				{
						
						hresp.sendRedirect("Val_login_User.html");
				}
				else
				{
						hresp.sendRedirect("Inval_login_User.html");
				
				}
  		    }catch(Exception exc){exc.printStackTrace();}
	}
}