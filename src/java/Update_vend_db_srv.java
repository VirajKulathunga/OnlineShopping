import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Update_vend_db_srv  extends HttpServlet
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
			    prst = con.prepareStatement("update VENDOR set VENDOR_CODE=?,VENDOR_NAME=?,ADDRESS=? where VENDOR_CODE=?");
			    String str1 = hreq.getParameter("t1");   
			    String str2 = hreq.getParameter("vendorname");   	
			    String str3 = hreq.getParameter("t3");   	
				
				prst.setString(1,str1);
			    prst.setString(2,str2);
			    prst.setString(3,str3);
				prst.setString(4,str1);

				Rec = prst.executeUpdate();

				if(Rec>=1)
				{
						hresp.sendRedirect("Update_Vendor.html");
				}
				else
				{
				hresp.sendRedirect("Update_error.html");
				}
  		    }catch(Exception exc){out.println("<html><body bgcolor=pink><h2><br><br><br><center>Error occured due to the insertion");
				out.println("<BR><BR><center><a href=\"vendor_adm_screen.html\">Back To Prduct Administration</a></center></h2>");	}
	}
}