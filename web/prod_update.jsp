<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>

<HTML>
<BODY BGCOLOR="#FFCCAA">
<FORM METHOD=POST ACTION="Updatprod">
<script>

function update(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].dataset.myvalue//.split(" ");
document.forms[0].prodname.value=obj//[obj.length-1]
}

function cadd(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].dataset.myvalue//.split(" ");

}
function vadd(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].dataset.myvalue//.split(" ");
}

onload=function() {document.forms[0].t1.options[document.forms[0].selectedIndex]=1;}
</script>



<BR><BR><BR>
<center>
<U> <h3> Update a New Product </h3> </U>
 <BR>
 <FORM name="f" method="post" action="Updatprod">
<TABLE width=600 align=center>
<TR>
	<TD nowrap>Product Code : </TD> 
	<TD><select name=t1 onchange=update(this);>
	<option value="" myvalue="">Select Prod Code</option>
<% 
	Connection con=null;
	Statement sst=null,sst1=null,sst2=null;
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

</select></TD><TD nowrap>Prduct Name : </TD><TD nowrap> <INPUT TYPE="text" NAME="prodname" > 	</TD></tr>

	<TD>Category Code :</TD>
	<TD><select name="cat_cod" onchange=cadd(this);>
	<option value="" myvalue="">Select Categ. Code</option>

<%
    String cmd1="select category_code from category";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd1);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option value='"+vall+"'>"+vall+"</option>");
	}
	
%>
	  <TD>Vendor Code :</TD>
      <TD><select name="Vendor_Code" onchange=vadd(this);>
	  <option value="" myvalue="">Select Vendor Code</option>
<%
	
	String cmd2="select vendor_code from vendor";
    sst1=con.createStatement();
    rs=sst.executeQuery(cmd2);	
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
	<TD nowrap>Unit Cost : </TD> <TD nowrap> <INPUT TYPE="text" NAME="t3"></TD>
	<TD nowrap>Description  : </td> <TD nowrap> <TEXTAREA NAME="" ROWS="2" COLS="17"></TEXTAREA></TD>
</TR>
<TR>
	<TD nowrap>Tax  : </TD> <TD nowrap> <INPUT TYPE="text" NAME="t4"></TD>
</TR>
<TR>
	<TD nowrap>Min_Quantity : </TD> <TD nowrap> <INPUT TYPE="text" NAME="t5"></TD>
</TR>
<TR>
	<TD nowrap>Product Description : </TD> <TD nowrap> <TEXTAREA NAME="pd" ROWS="2" COLS="16"> </TEXTAREA></TD>
	<TD nowrap>Discount : </TD> <TD nowrap> <INPUT TYPE="text" NAME="dis"></TD>
</TR>
</TABLE> <BR>

	
</FORM>
<INPUT TYPE="submit" VALUE="Submit"> <BR> <BR>
	Click to go back to Product Administration <a
	href="product_administration.html">back</a> <BR> <BR>
	Click to go back to Administration <a href="adm.html">back</a> 
</CENTER>
<script>

        var data=unescape(location.search.substring(1));
        data=data.split("+");
        var temp="";
        var mytt="";
        var strd=new Array();
        for(i=0;i<data.length;i++)temp+=data[i]+" ";
        temp=temp.split("&");
        for(j=0;j<temp.length;j++)
        strd[strd.length]=new Array(temp[j].split("=")[0],temp[j].split("=")[1]);
        var df=document.forms[0];
   try {
        for(i=0;i<df.elements.length;i++) {
        df.elements[i].value=strd[i][1];
        mytt+=strd[i][1]+"\n";}
        } catch(e) {// status=e.description+"          "+e.constructor() 
                   }
</script>
</FORM>
</BODY>
</HTML>