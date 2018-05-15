<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<HTML>
<BODY BGCOLOR="#FFCCAA">

<script>

function vupd(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].myvalue//.split(" ");

}

function cupd(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].myvalue//.split(" ");

}

</script>



<FORM METHOD=POST ACTION="update_cat_db_srv">
<BR>
<center>
<U> <h3> Update a Category </h3> </U>
 <BR>
<TABLE>
<% 
	Connection con=null;
	Statement sst=null,sst1=null;
	ResultSet rs=null;
%>

	  <TD>Vendor Code </TD>
      <TD><select name="t1" onchange=vupd(this);>
	  <option value="" myvalue="">Select Vend Code</option>

<%
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");

	String cmd="select VENDOR_CODE from VENDOR";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option value='"+vall+"'>"+vall+"</option>");
	      }
	

	%>
		<tr>
	  <TD>Category Code :</TD>
      <TD><select name="t2" onchange=cupd(this);>
	  <option value="" myvalue="">Select Categ Code</option>
		
<%

	String cmd1="select CATEGORY_CODE from CATEGORY";
    sst1=con.createStatement();
    rs=sst.executeQuery(cmd1);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option value='"+vall+"'>"+vall+"</option>");
	      }
%>
</select></TD></tr>
<%

			}catch(Exception e){	out.println("Error Occured"+e);	}

%>

<TR>
	<TD>Category Name    
	<TD> <INPUT TYPE="text" NAME="t3"> 	</TD>
</TR>
</TABLE> <BR>
<CENTER> 
	<INPUT TYPE="submit" VALUE="Submit"> <BR> <BR>
	<A HREF="cat_admin.html">Click to go back to Vendor Administration </A><BR> <BR>
	<A HREF="adm.html">Click to go back to Administration</A>
</CENTER>
</FORM>
</BODY>
</HTML>
