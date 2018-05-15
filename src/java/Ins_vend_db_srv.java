import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Ins_vend_db_srv  extends HttpServlet
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
			    prst = con.prepareStatement("insert into VENDOR  values(?,?,?)");
			    String str1 = hreq.getParameter("t1");   
			    String str2 = hreq.getParameter("t2");   	
			    String str3 = hreq.getParameter("t3");   	
				
				prst.setString(1,str1);
			    prst.setString(2,str2);
			    prst.setString(3,str3);

				Rec = prst.executeUpdate();
				if(Rec>=1)
				{
						hresp.sendRedirect("Vebdor_Rec_inserted.html");
				}
				else
				{
				hresp.sendRedirect("Ins_error.html");
				}
  		    }catch(Exception exc){out.println("<html><body bgcolor=pink><h2><br><br><br><center>Error occured due to the insertion");
				out.println("<BR><BR><center><a href=\"vendor_adm_screen.html\">Back To Prduct Administration</a></center></h2>");	;}
	}
}