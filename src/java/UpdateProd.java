import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
public class UpdateProd  extends HttpServlet
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
			prst=con.prepareStatement("update PRODUCT set VENDOR_CODE=?,CATEGORY_CODE=?,PRODUCT_CODE=?,PRODUCT_NAME=?,UNIT_COST=?,TAX=?,DESCRIPTION=?,DISCOUNT=?,MIN_QUANTITY=? where PRODUCT_CODE=?");
							
				String vencode=hreq.getParameter("Vendor_Code");
				String ccode=hreq.getParameter("cat_cod");
				String pcode = hreq.getParameter("t1");
				String pname= hreq.getParameter("prodname");
				int unitcost=Integer.parseInt(hreq.getParameter("t3"));
				int tax=Integer.parseInt(hreq.getParameter("t4"));
				String pd=hreq.getParameter("pd");
			    int disstr=Integer.parseInt(hreq.getParameter("dis"));
				int minqt=Integer.parseInt(hreq.getParameter("t5"));
				
				System.out.println("u entered " +pcode+"\t"  +pname+"\t" +ccode+"\t" +vencode+"\t"+unitcost+"\t"+tax+"\t"+minqt+"\t"+pd+"\t"+disstr);
				

				prst.setString(1,vencode);
				prst.setString(2,ccode);
				prst.setString(3,pcode);
			    prst.setString(4,pname);
				prst.setInt(5,unitcost);
				prst.setInt(6,tax);
				prst.setString(7,pd);
				prst.setInt(8,disstr);
				prst.setInt(9,minqt);
				prst.setString(10,pcode);
				Rec = prst.executeUpdate();
	         
			    System.out.println("result is"+Rec);
	           
				if(Rec>=1)

				{
						hresp.sendRedirect("Prod_Rec_inserted.html");
				}
		
				
				
				else
					System.out.println("result is"+Rec);
				{
				        hresp.sendRedirect("Update_error.html");
				}
		
		}catch(Exception e){out.println("<html><body bgcolor=pink><h2><br><br><br><center>Error occured due to the insertion");
				out.println("<BR><BR><center><a href=\"prod_update.jsp\">Back To Prduct Administration</a></center></h2>");	}

	}
}