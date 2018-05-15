<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
 
<html><body BGCOLOR="pink">
<U> <h3><center> Delete Discount </h3> </U>
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
document.forms[0].quant.value=obj//[obj.length-1]
<!-- document.forms[0].disc.value=obj -->
}
</script>



 <BR><BR>
 <FORM name="f" method="post" action="del_dis_db_srv">
 <center><FONT COLOR="blue"> Enter Product Code for deltete Discount</FONT><BR><BR>
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
    String cmd="select product_code,quantity,discount from discount";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option data-myvalue="+rs.getString(2)+ " value='"+vall+"'>"+vall+"</option>");
	
//	 out.println("<option myvalue1="+rs.getString(3)+ " value='"+val2+"'>"+val2+"</option>");
	}
	

%>
</select></TD></tr>

<TR><TD>Quantity : </TD><TD> <INPUT TYPE="text" NAME="quant" readonly > 	</TD> </tr>

<!-- <TR><TD>Discount : </TD><TD> <INPUT TYPE="text" NAME="disc" readonly > 	</TD> </tr> -->



<%
			}catch(Exception e){	out.println("Error Occured"+e);	}
%>

</TABLE><BR>
<BR>
<CENTER><input type="submit" name="submit" value="Delete"><TD>
</TR>
<!-- <a href="del_prod.jsp">Go Back</a> -->
<a href="discount_admin.html">Back</a>

</form>
