import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class update_prod  extends HttpServlet
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
			PreparedStatement psrt;
			psrt=con.prepareStatement("update products set prod_code=?,prod_name=?,categ_code=?,vend_code=?,unit_cost=?,tax=?,min_qty=?,prod_descr=?,discount=? where prod_code=?");
			
				String pcode = hreq.getParameter("t1");   
			    String pname= hreq.getParameter("t2");
				String ccode=hreq.getParameter("cat_cod");
				String vencode=hreq.getParameter("Vendor_Code");
				int unitcost=Integer.parseInt(hreq.getParameter("t3"));
				int tax=Integer.parseInt(hreq.getParameter("t4"));
				int minqt=Integer.parseInt(hreq.getParameter("t5"));
				String pd=hreq.getParameter("pd");
				String disstr=hreq.getParameter("dis");

				prst.setString(1,pcode);
			    prst.setString(2,pname);
				prst.setString(3,ccode);
				prst.setString(4,vencode);
				prst.setInt(5,unitcost);
				prst.setInt(6,tax);
				prst.setInt(7,minqt);
				prst.setString(8,pd);
				prst.setString(9,disstr);
				prst.setString(10,pcode);

				prst.executeUpdate();
		}catch(Exception e){}
	}
}