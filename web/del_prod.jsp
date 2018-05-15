<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
 
<html><body BGCOLOR="pink">
<U> <h3><center> Delete Product </h3> </U>
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

function dele(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].dataset.myvalue//.split(" ");
document.forms[0].prodname.value=obj//[obj.length-1]
}
</script>



 <BR><BR>
 <FORM name="f" method="post" action="del_prd_db_srv">
 <center><FONT COLOR="blue"> Enter Product Code That u want to Delete</FONT><BR><BR>
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
    String cmd="select product_code, product_name from product";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option data-myvalue="+rs.getString(2)+ " value='"+vall+"'>"+vall+"</option>");
	}

%>
</select></TD></tr>


<TR><TD>Prduct Name : </TD><TD> <INPUT TYPE="text" NAME="prodname" readonly > 	</TD> </tr>
<%
			}catch(Exception e){	out.println("Error Occured"+e);	}
%>

</TABLE><BR>
<BR>
<CENTER><input type="submit" name="submit" value="Delete"><TD>
</TR>
<!-- <a href="del_prod.jsp">Go Back</a> -->
<a href="product_administration.html">Back</a>

</form>
