<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>


<HTML>
<BODY BGCOLOR="#FFCCAA">

<script>

function vadd(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].myvalue//.split(" ");

}

</script>




<FORM METHOD=POST ACTION="ins_cat_db_srv">
<BR><BR><BR>
<center>
<U> <h3> Add a Category </h3> </U>
 <BR><BR>
<TABLE>

<% 
	Connection con=null;
	Statement sst=null;
	ResultSet rs=null;
%>

	  <TD>Vendor Code :</TD>
      <TD><select name="t1" onchange=vadd(this);>
	  <option value="" myvalue="">Select Vendor Code</option>

<%
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");

	String cmd="select vendor_code from vendor";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option value='"+vall+"'>"+vall+"</option>");
	}
	
%>
</select></TD></tr>
<%

			}catch(Exception e){out.println("Error Occured"+e);	}

%>


<tr>
	<TD>Category Code : </TD> 
	<TD> <INPUT TYPE="text" NAME="t2"> 	</TD>
</TR><BR>
<TR>
	<TD>Category Name   : <TD> <INPUT TYPE="text" NAME="t3"> 	</TD>
</TR>
</TABLE> <BR>
<CENTER> 
	<INPUT TYPE="submit" VALUE="Submit"> <BR> <BR>
	<A HREF="cat_admin.html">Click to go back to Category Administration </A><BR> <BR>
	<A HREF="adm.html">Click to go back to Administration</A>
</CENTER>
</FORM>
</BODY>
</HTML>
