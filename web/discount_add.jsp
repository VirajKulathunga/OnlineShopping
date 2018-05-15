<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<HTML>
<BODY BGCOLOR="#FFCCAA">


<script>

function add(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].myvalue//.split(" ");
<!-- document.forms[0].quant.value=obj//[obj.length-1] -->

}
</script>


<FORM METHOD=POST ACTION="ins_dis_db_srv">
<BR><BR><BR>
<center>


<U> <h3> Add a New Discount </h3> </U>
 <BR><BR>
<TABLE>
<TR>
	<TD>Product Code :</TD>


	<TD colspan=3><select name=t1 onchange=dele(this);>
	<option value="" myvalue="">Select Proudct Code</option>
	

<% 
	Connection con=null;
	PreparedStatement st=null;
	Statement sst=null;
	ResultSet rs=null;
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");
    String cmd="select product_code from product";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option value='"+vall+"'>"+vall+"</option>");
	}
	
%>
</select></TD></tr>
<%

			}catch(Exception e){	out.println("Error Occured"+e);	}

%>

</tr> <BR>
<tr>
	<TD>Quantity : </TD> 
	<TD> <INPUT TYPE="text" NAME="t2"> 	</TD>
</TR><BR>
<TR>
	<TD>Discount   : <TD> <INPUT TYPE="text" NAME="t3"> 	</TD>
</TR>
</TABLE> <BR>
<CENTER> 
	<INPUT TYPE="submit" VALUE="Submit"> <BR> <BR>
	<A HREF="discount_admin.html">Click to go back to Vendor Administration </A><BR> <BR>
	<A HREF="adm.html">Click to go back to Administration</A>
</CENTER>
</FORM>
</BODY>
</HTML>
