import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.mysql.jdbc.Connection;
public class Ins_prd_db_srv  extends HttpServlet
{
	Connection con;
	PreparedStatement prst ;
	int Rec;
	int Rec1;

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
			    prst = con.prepareStatement("insert into PRODUCT values(?,?,?,?,?,?,?,?,?)");
			   // prst1 = con.prepareStatement("insert into STOCK(PRODUCT_CODE,PRODUCT_NAME) values(?,?);
				String vencode=hreq.getParameter("Vendor_Code");
				String ccode=hreq.getParameter("cat_cod");
				String pcode = hreq.getParameter("t1").trim();
				String pname= hreq.getParameter("t2").trim();
				int unitcost=Integer.parseInt(hreq.getParameter("t3").trim());
				int tax=Integer.parseInt(hreq.getParameter("t4").trim());
				String pd=hreq.getParameter("pd").trim();
			//	String disstr=hreq.getParameter("dis");
				int disstr=Integer.parseInt(hreq.getParameter("dis").trim());
				int minqt=Integer.parseInt(hreq.getParameter("t5").trim());
				
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
				
                                //prst1.setString(1,pcode);
	                        //prst1.setString(2,pname);
                                //int ist = prst1.executeUpdate();
			    Rec = prst.executeUpdate();
	            System.out.println("result is"+Rec);

				System.out.println("tmr");
                  prst = con.prepareStatement("insert into stock values(?,?,?)");
			   System.out.println("tmr1");
						prst.setString(1,pcode);
						prst.setString(2,pname);
						prst.setString(3," ");
						Rec1 = prst.executeUpdate();
						 
			 			
									if(Rec1>=1)
								{
								System.out.println("result1 is"+Rec1);
												}
				
									else
								{
								}	
	            if(Rec>=1 && Rec1==1  )

				{

						hresp.sendRedirect("Prod_Rec_inserted.html");
						
							}
				else
				{
						hresp.sendRedirect("Ins_error.html");
				
				}
  		    }catch(Exception exc){
				out.println("<html><body bgcolor=pink><h2><br><br><br><center>Error occured due to the insertion");
				out.println("<BR><BR><center><a href=\"product_add.jsp\">Back To Prduct Administration</a></center></h2>");	
				}
	}
}	