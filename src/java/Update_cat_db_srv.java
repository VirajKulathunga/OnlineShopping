import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Update_cat_db_srv  extends HttpServlet
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
			    prst = con.prepareStatement("update CATEGORY set VENDOR_CODE=?,CATEGORY_NAME=? where CATEGORY_CODE=?");
			    String str1 = hreq.getParameter("t1");   
			    String str2 = hreq.getParameter("t2");   	
			    String str3 = hreq.getParameter("t3");   	
				
				prst.setString(1,str1);
			  //  prst.setString(2,str2);
			    prst.setString(2,str3);
				prst.setString(3,str2);

				Rec = prst.executeUpdate();

				if(Rec>=1)
				{
						hresp.sendRedirect("Update_Category.html");
				}
				else
				{
				hresp.sendRedirect("Update_error.html");
				}
  		    }catch(Exception exc){out.println("<html><body bgcolor=pink><h2><br><br><br><center>Error occured due to the insertion");
				out.println("<BR><BR><center><a href=\"categ_update.jsp\">Back To Category Administration</a></center></h2>");	}
	}
}