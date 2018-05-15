import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Cust_del_db_srv  extends HttpServlet
{
	Connection con;
	PreparedStatement prst;
	int Rec;

	public void init(ServletConfig sc) throws ServletException
	{
	    try{
				super.init(sc);
				Class.forName("com.mysql.jdbc.Driver");
				con = MysqlConnect.getDbCon().conn;
			}catch(Exception exc){exc.printStackTrace();}
	}

	public void service(HttpServletRequest hreq , HttpServletResponse hresp) throws ServletException,IOException
	{
			PrintWriter out=hresp.getWriter();
		try{
			    prst = con.prepareStatement("delete from REGISTRATION where CUSTOMER_ID=?");
			    String custid = hreq.getParameter("t1").toUpperCase();   
				out.println("customerid " +custid); 
				prst.setString(1,custid);
				int n=prst.executeUpdate();
				
				String test=(n>0)?"Success":"Failure";
				hresp.sendRedirect("cust_del_dsip.html?"+test);
		 } catch(Exception exp) { }
	}
}