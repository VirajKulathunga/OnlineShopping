<%@ page import="java.sql.*,java.sql.Date"%>
<HTML>
<HEAD>
<TITLE> Stock Available Information </TITLE>
<!--<LINK href="dyn.xsl" rel="stylesheet">-->
</HEAD>
<BODY BGCOLOR="#FFF99R">
<script>
function setPayment(obj) {
samp=obj.value
obj3=obj.options[obj.selectedIndex].dataset.myvalue//.split(" ");
console.log(obj3);
document.forms[0].pmtamt2.value=obj3
obj4=obj.options[obj.selectedIndex].dataset.myvalue1
document.forms[0].pmtamt3.value=obj4
}
</script>
<TABLE><form action="" method=GET onsubmit="return validate(this)">  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<tr><td><h1><center>Available Stock  Information</center></h1></td></tr>
<br><br><br><br><br>
<TR>
	<TD>PRODUCT_CODE   </TD>
	<TD colspan=3><select name=lnno onchange="setPayment(this)">
<% 
	Connection con=null;
PreparedStatement st=null;
Statement sst=null;
ResultSet rs=null;
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");
    String cmd="select  PRODUCT_CODE ,PRODUCT_NAME ,QUANTITY  from  STOCK";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option data-myvalue="+rs.getString(2)+" data-myvalue1="+rs.getString(3)+" value='"+vall+"'>"+vall+"</option>");
		}
}
	catch(Exception e){e.printStackTrace();}
%>
</select></TD></tr>

<TR><TD>PRODUCT_NAME </TD>
<TD  colspan=3><INPUT TYPE="text" NAME="pmtamt2"  maxlength=6 readonly onkeypress="return bloc(this)"></td></tr>
<TR><TD>QUANTITY </TD>
<TD  colspan=3><INPUT TYPE="text" NAME="pmtamt3"  maxlength=6 readonly onkeypress="return blockkey(this)"></td></tr>
<tr><td><a href="stock1.html"> Go To Stock Administration</a></td></tr>