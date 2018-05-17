<%@ page import="java.sql.*,java.text.*,java.util.*"%>
<%  
	String custidd=request.getParameter("custid").trim();
	String custid=custidd.toUpperCase();
	System.out.println(custid);
	String prodcode=request.getParameter("prodcode").trim();
	int minqtyord=Integer.parseInt(request.getParameter("minqtyord"));
	int ordqty=Integer.parseInt(request.getParameter("ordqty"));
	float unitcost=Float.parseFloat(request.getParameter("unitcost"));
	String orddate=request.getParameter("orddate");
	String pmtmode=request.getParameter("modeofpmt");
	String ccno =request.getParameter("cc");
	float disc=Float.parseFloat(request.getParameter("dis"));
	float c=disc/100;
	float a=ordqty*unitcost;
	float b=a*c;
	float netcostt=a-b;

%>

<%
	Connection con=null;
	PreparedStatement st=null;
	Statement sst=null;
	ResultSet rs=null;
	int qt;
	 Integer in=null;
	String cmd;
	try{
   	       Class.forName("com.mysql.jdbc.Driver");
	      	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");
           System.out.println(prodcode);
			cmd="select * from  STOCK where  PRODUCT_CODE=?";
			st=con.prepareStatement(cmd);
			st.setString(1,prodcode);
			rs=st.executeQuery();
		     if(rs.next())
			 {
				 qt=Integer.parseInt(rs.getString(3))-ordqty;		
		         in=new Integer(qt);
				 System.out.println(qt);
		  	     if(qt<=5)
				 {
					 response.sendRedirect("NoStock.html");
					
				  }
				 else
				 {
				 		String cmd4="update STOCK  set QUANTITY=? where PRODUCT_CODE=?";
						st=con.prepareStatement(cmd4);
	          			st.setString(1,in.toString());
				  	    st.setString(2, prodcode);
		  			    int x=st.executeUpdate();
			 			String cmd1="Select * from registration where customer_id='"+custid+"'";
	    	   	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");
		        sst=con1.createStatement();
		        ResultSet rs1=sst.executeQuery(cmd1);
		        if(rs1.next())
		       	{
		                if(ordqty>minqtyord)
			            { 
//		                  String cmd2="INSERT INTO order VALUES(?,?,?,?,?,?,?,?)";
//                       	  st=con.prepareStatement(cmd2);
                                        
		                  String cmd2="INSERT INTO `order` (`CUSTOMER_ID`,`PRODUCT_CODE`,`QUANTITY_ORDERED`,`UNIT_COST`,`NET_COST`,`ORDER_DATE`,`PAYMENT_MODE`,`cc_dd_cheque_no`) VALUES"
                                          + "('"+custid+"','"+prodcode+"',"+ordqty+","+unitcost+","+netcostt+",'2018-05-18','"+pmtmode+"','')";
                       	  sst=con.createStatement();
                          sst.executeUpdate(cmd2);
//	                      st.setString(1,custid);
//		                  st.setString(2,prodcode);
//		                  st.setInt(3,ordqty);
//		                  st.setFloat(4,unitcost);
//		                  st.setFloat(5,netcostt);
//		                  st.setString(6,"2018-01-10");
//		                  st.setString(7,pmtmode);
//                                  st.setString(8,ccno);
//		                  st.executeUpdate();
		                  out.println("Your net cost is" +netcostt);
		                  out.println("<BR><BR><h4>Your order is accepted</h4>");
		                  out.println("<BR><BR><h5>Like to have another order...?</h5>"); 
						  out.println("<a href=\"ord.jsp\">Go to previous form</a>");
		               }
                       else
	                   {
		                   out.println("order qty should be greater than min order qty");
		                   out.println("<a href=\"ord.jsp\">Go to previous form</a>"); 
		                }
	           }
	           else
			   {
			        out.println("This is not a valid customer_id");	
		            out.println("<a href=\"ord.jsp\">Go to previous form</a>");
			   }
	   }
			 }
	} catch(Exception e)
		{
                    e.printStackTrace();
			//out.println("<br><h1>Check the values, all fields are not entered </h1>");
			out.println("<br><h1>This is not a valid customer ID</h1>");
			out.println("<a href=\"ord.jsp\">Go to previous form</a>");
			}
			 
%>