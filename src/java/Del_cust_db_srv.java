import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Del_cust_db_srv  extends HttpServlet
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

			out.println("connecting to database");
	
		try{
			    prst = con.prepareStatement("delete from VENDOR where VENDOR_CODE=?");
			    String vcode = hreq.getParameter("t1");   
				prst.setString(1,vcode);
				int n=prst.executeUpdate();
				
				String test=(n>0)?"Success":"Failure";
				hresp.sendRedirect("Ven_del_disp.html?"+test);
		}catch(Exception exp) { } 
	}
}