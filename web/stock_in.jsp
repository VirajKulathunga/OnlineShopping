<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<html>
<body bgcolor=lightblue>
<table border=0 width=120% height =120%   scrolling=no ><tr>
<%!
	Connection con=null;
PreparedStatement st=null;
Statement sst=null;
ResultSet rs=null;
%>
<%
 String s1=request.getParameter("lnno");
 String s2=request.getParameter("pmtamt2");
 String s3=request.getParameter("Qty");
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");
    st=con.prepareStatement("update  STOCK  set QUANTITY=? where  PRODUCT_CODE =? ");
    st.setString(1,s3);
	//st.setString(2,s2);
	st.setString(2,s1);
	int i=st.executeUpdate();
    if(i==1) {%>

		<td align="center"><h2>Successfully Updated</h2></td>
		

	<% }else{ %>
		<td>failure</td></tr>
		
<% }}
catch(Exception e)
{e.printStackTrace();
} %>
<tr>
<td align="center"><a href="stock1.html"> Go To Stock Administration</a></td></tr>
</table></body></html>


		 