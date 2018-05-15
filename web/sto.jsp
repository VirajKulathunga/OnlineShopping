<%@ page import="java.sql.*,java.sql.Date"%>
<HTML>
<HEAD>
<TITLE>Add  Stock Administration </TITLE>
<LINK href="dyn.xsl" rel="stylesheet">
</HEAD>
<BODY BGCOLOR="#FFF99R">
<script>
function setPayment(obj) {
samp=obj.value
obj2=obj.options[obj.selectedIndex].dataset.myvalue//.split(" ");
document.forms[0].pmtamt2.value=obj2
/*obj2=obj.options[obj.selectedIndex].myvalue1
document.forms[0].pmtamt1.value=obj2*/
}
</script>
<TABLE><form action="./stock_in.jsp" method=GET onsubmit="return validate(this)"  align left=10>  
<TR><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h1><center>Add  Stock Administration</center></h1></td></tr>
<!--<TD>Payment ID:</td><td colspan=3><input type=text name="pmtid" maxlength=5  onkeypress="return blockkey(this)"></td></tr>-->

	<TD>PRODUCT_CODE</TD>
	<TD colspan=3><select name=lnno onchange="setPayment(this)">
<% 
	Connection con=null;
PreparedStatement st=null;
Statement sst=null;
ResultSet rs=null;
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");
    String cmd="select PRODUCT_CODE, PRODUCT_NAME from PRODUCT";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option data-myvalue="+rs.getString(2)+"   value='"+vall+"'>"+vall+"</option>");
		}
}
	catch(Exception e){e.printStackTrace();}
%>
</select></TD></tr>

<TR><TD>PRODUCT_NAME</TD>
<TD  colspan=3><INPUT TYPE="text" NAME="pmtamt2"  maxlength=6 readonly onkeypress="return bloc(this)"></td></tr>
<TR><TD>QUANTITY</TD>
<TD  colspan=3><INPUT TYPE="text" NAME="Qty"  maxlength=6 ></td></tr>
<tr><td><a href="stock1.html"> Go To Stock Administration</a></td></tr>

<td><center><INPUT TYPE="submit" VALUE="Submit"></center> </td><BR> <BR>
<td><center><input type ="reset" value="refresh" >
</html>