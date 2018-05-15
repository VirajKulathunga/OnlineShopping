import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class PassCheck extends HttpServlet
{
	Connection con;
	PreparedStatement st;
	ResultSet rs;

	public void init(ServletConfig sc) throws ServletException
	{
	    try{
				super.init(sc);
				Class.forName("com.mysql.jdbc.Driver");
				
			}catch(Exception exc){exc.printStackTrace();}
	}

	public void service(HttpServletRequest hreq , HttpServletResponse hresp) throws ServletException,IOException
	{
		PrintWriter out=hresp.getWriter();
		try{
			con = MysqlConnect.getDbCon().conn;
				st = con.prepareStatement("select USER_NAME,PASSWORD from LOGIN where USER_NAME=? and PASSWORD=?");
			    String str1 = hreq.getParameter("loging").trim();   
			    String str2 = hreq.getParameter("passwd").trim();   	
				out.println(str1+" "+str2);
				st.setString(1,str1);
			    st.setString(2,str2);

			    rs = st.executeQuery();
				out.println(str1+" "+str2);
						
	            if(rs.next())
				{
						
						hresp.sendRedirect("adminGo.html");
				}
				else
				{
						hresp.sendRedirect("Inval_login.html");
				
				}
  		    }catch(Exception exc){exc.printStackTrace();}
	}
}