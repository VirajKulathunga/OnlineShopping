import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.io.*;
import  java.sql.*;
import com.mysql.jdbc.Connection;

public class Registration extends HttpServlet
      {
       public void init(ServletConfig config) throws ServletException {
       super.init(config);
              }

			   
  public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException , IOException {

	  PrintWriter out = res.getWriter();
     try { 
	
		  
	      String code="AB";
		  String cid=null;
		  Connection con1=null;
		  ResultSet rs=null;
		  PreparedStatement pst=null;
		  Statement st1=null;		
		  Statement st=null;
		  int result=0,res2=0;	
 
          
           Class.forName("com.mysql.jdbc.Driver").newInstance();
           con1 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");
           st=con1.createStatement();
		   rs=st.executeQuery("select IFNULL((select count(CUSTOMER_ID)+1 from REGISTRATION),'1') from dual");	   
		   //int val=0;
		   while(rs.next())
		  {
		   int val=rs.getInt(1);
		   out.print(rs);
		   out.println("ID"+val);
		   if (val>=0)
			   {
			     val+=1;
			   }
		   else  {
		   val=1;
		         }			
		   cid=code+val;
		  }

		  String username=req.getParameter("login");
		  String passwd=req.getParameter("pass");
		  String repass=req.getParameter("retype");
		  String disname=req.getParameter("distributor");
		  String add=req.getParameter("text");
		  String cit=req.getParameter("city");
		  String sta=req.getParameter("state");
		  String coun=req.getParameter("country");
		  String regi=req.getParameter("region");
		  String mail=req.getParameter("email");
		  int ph=Integer.parseInt(req.getParameter("phone"));
		  int fa=Integer.parseInt(req.getParameter("fax"));
		 
		 pst=con1.prepareStatement("insert into REGISTRATION values(?,?,?,?,?,?,?,?,?,?,?,?)");

		 pst.setString(1,cid);
		 pst.setString(2,username);
		 pst.setString(3,passwd);
		 pst.setString(4,disname);
		 pst.setString(5,add);
		 pst.setString(6,cit);
		 pst.setString(7,sta);
		 pst.setString(8,coun);
		 pst.setString(9,regi);
		 pst.setString(10,mail);
		 pst.setInt(11,ph);
		 pst.setInt(12,fa);

		 out.println("register values"+cid  +username  +passwd  +repass  +disname +add +cit +sta +coun +regi +mail +ph  +fa);
       
		 if(passwd.equals(repass))
		 {
				   	
			result=pst.executeUpdate();
			out.print("hello world");
		 }
		 else
		 {
			res.sendRedirect("Reg_Pass_Check.html");
	     }		 
			
 	     if(result>=1)
		 {
    		st1=con1.createStatement();
			//res2=st1.executeUpdate("update CUSTOMERID set CUSTOMER_ID="+val);
			out.print("hello friend");
			res.sendRedirect("Register_Success.html?id="+cid);
		 } 	
		 else{
			  res.sendRedirect("Reg_Invalid.html");        
		 }  	
	/*	  con1.close();
		  rs.close();
		  pst.close();
    	  st1.close();
		  st.close();
	*/	  		
 }//try
catch (Exception e){
	out.println("<html><body bgcolor=pink><h2><br><br><br><center>Error occured due to the insertion"+e);
				
	out.println("<BR><BR><center><a href=\"registration.html\">Back To Registration Screen</a></center></h2>");	} 
}//dopost
  
 }//class	