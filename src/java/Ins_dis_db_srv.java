import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class Ins_dis_db_srv  extends HttpServlet
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
			    prst = con.prepareStatement("insert into DISCOUNT  values(?,?,?)");
			    String pcode = hreq.getParameter("t1");   
			     int qun= Integer.parseInt(hreq.getParameter("t2"));   	
			     int dis =Integer.parseInt(hreq.getParameter("t3"));   	
				
				prst.setString(1,pcode);
			    prst.setInt(2,qun);
			    prst.setInt(3,dis);

				Rec = prst.executeUpdate();
				if(Rec>=1)
				{
						hresp.sendRedirect("dis_inserted.html");
				}
				else
				{
				hresp.sendRedirect("Ins_error.html");
				}
  		    }catch(Exception exc){out.println("<html><body bgcolor=pink><h2><br><br><br><center>Error occured due to the insertion");
				out.println("<BR><BR><center><a href=\"discount_admin.html\">Back To Discount Administration</a></center></h2>");	}
	}
}