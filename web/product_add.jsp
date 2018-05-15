<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<HTML>
<BODY BGCOLOR="#FFCCAA">
<BR><BR><BR>
<center>
<U> <h3> Add a New Product </h3> </U>
 <BR><BR><BR>

<script>

function cadd(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].myvalue//.split(" ");

}
function vadd(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].myvalue//.split(" ");

}

</script>



 <FORM name="f" method="POST" action="ins_prd_db_srv">
<TABLE>
<TR>
	<TD>Product Code : </TD> 
	<TD> <INPUT TYPE="text" NAME="t1"> 	</TD> 
	<TD>Product Name : </TD> 
	<TD> <INPUT TYPE="text" NAME="t2"> 	</TD>
</TR>
<TR>

<% 
	Connection con=null;
	Statement sst=null,sst1=null;
	ResultSet rs=null;
%>
	<TD>Category Code :</TD>
	<TD><select name="cat_cod" onchange=cadd(this);>
	<option value="" myvalue="">Select Categ. Code</option>
<%
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");
    String cmd="select category_code from category";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option value='"+vall+"'>"+vall+"</option>");
	}
	
%>
	  <TD>Vendor Code :</TD>
      <TD><select name="Vendor_Code" onchange=vadd(this);>
	  <option value="" myvalue="">Select Vendor Code</option>
<%
	
	
	
	String cmd1="select vendor_code from vendor";
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


</tr>
<TR>
	<TD>Unit Cost : </TD> <TD> <INPUT TYPE="text" NAME="t3"></TD>
	<TD>CatDescription  : </td> <TD> <TEXTAREA NAME="desc" ROWS="2" COLS="17"></TEXTAREA></TD>
</TR>
<TR>
	<TD>Tax (%) : </TD> <TD> <INPUT TYPE="text" NAME="t4"></TD>
</TR>
<TR>
	<TD>Min_Quantity : </TD> <TD> <INPUT TYPE="text" NAME="t5"></TD>
</TR>
<TR>
	<TD>Product Description : </TD> <TD> <TEXTAREA NAME="pd" ROWS="2" COLS="16"> </TEXTAREA></TD>
	<!-- <TD>Discount Struction  : </TD> <TD> <TEXTAREA NAME="dis" ROWS="2" COLS="16"> </TEXTAREA></TD> --> 
      <TD>Discount : </TD> <TD> <INPUT TYPE="text" NAME="dis"></TD>
</TR>
</TABLE> <BR>
<CENTER> 
	<INPUT TYPE="submit" VALUE="Submit" NAME=SUBMIT> <BR> <BR>
</FORM>
	Click to go back to Product Administration <a
	href="product_administration.html">back</a> <BR> <BR>
	Click to go back to Administration <a href="adm.html">back</a> 
</CENTER>
</BODY>
</HTML>
