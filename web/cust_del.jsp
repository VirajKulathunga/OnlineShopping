<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<html><body BGCOLOR="pink">
<U> <h3><center> Delete Customer </h3> </U>
<center><h1 id=trans></h1></center>
<sCRIPT>
var rdata=location.search.substring(1).toLowerCase();
if(rdata.indexOf("success")!=-1)
document.getElementById('trans').innerHTML="<font face=tahoma color=blue>Records Deleted Successfully<BR>"+rdata;
else if(rdata.indexOf("failure")!=-1)
document.getElementById('trans').innerHTML="<font color=red face=tahoma>Transaction Failure</font>";
else {}
</SCRIPT>

<script>
function setDel(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].myvalue//.split(" ");
document.forms[0].prodname.value=obj//[obj.length-1]
}
</script>



 <BR><BR>
 <FORM name="f" method="post" action="cust_del_db_srv">
 <center><FONT COLOR="blue"> Enter Customer Code That u want to Delete</FONT><BR><BR>
<TABLE>
<TR>
	<TD>Select Customer Id : </TD>

	
	<TD colspan=3><select name=t1 >
<% 
	Connection con=null;
	PreparedStatement st=null;
	Statement sst=null;
	ResultSet rs=null;
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");
    String cmd="select CUSTOMER_ID from REGISTRATION";
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
	

	<!-- <TD> <INPUT TYPE="text" NAME="t1"> 	</TD>  -->
</TR>
</TABLE><BR>
<BR>
<CENTER><input type="submit" name="submit" value="Delete"><TD>
</TR>
<a href="cust_admin.html">Go Back</a>
</form>