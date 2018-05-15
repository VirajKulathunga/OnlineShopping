import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Del_cat_db_srv  extends HttpServlet
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
			    prst = con.prepareStatement("delete from CATEGORY where CATEGORY_CODE=?");
			    String ccode = hreq.getParameter("t1");   
				prst.setString(1,ccode);
				int n=prst.executeUpdate();
				
				String test=(n>0)?"Success":"Failure";
				hresp.sendRedirect("cat_del.jsp?"+test);
		}catch(Exception exp) { } 
	}
}