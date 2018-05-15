import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class del_prd_db_srv  extends HttpServlet
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
				String cmd="Select product_code from product";
				Statement st=con.createStatement();
				ResultSet rs=st.executeQuery(cmd);
				if(rs.next()){
					String a=rs.getString(1);
					out.println(a);}		

			    prst = con.prepareStatement("delete from PRODUCT where PRODUCT_CODE=?");
			    String pcode = hreq.getParameter("t1");   
				prst.setString(1,pcode);
				int n=prst.executeUpdate();
				
				String test=(n>0)?"Success":"Failure";
				hresp.sendRedirect("del_prod.jsp?"+test);
		}catch(Exception exp) { }
	}
}