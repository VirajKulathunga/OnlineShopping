<%@ page import="java.util.*,java.text.*,java.lang.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<html><body BGCOLOR="pink">
<U> <h3><center>Order Product </h3> </U>

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
obj1=obj.options[obj.selectedIndex].dataset.myvalue//.split(" ");
obj2=obj.options[obj.selectedIndex].dataset.myvalue1
obj3=obj.options[obj.selectedIndex].dataset.myvalue2
obj4=obj.options[obj.selectedIndex].dataset.myvalue3
obj5=obj.options[obj.selectedIndex].dataset.myvalue4
document.forms[0].prodname.value=obj1//[obj.length-1]
document.forms[0].unitcost.value=obj2
document.forms[0].tax.value=obj3
document.forms[0].dis.value=obj4
document.forms[0].minqtyord.value=obj5
}
function valid(ThisForm)
 {
      
 if(ThisForm.custid.value=="") 
    {
     alert("Enter Cust id") ; 
     ThisForm.custid.focus();
     return false;
    }
 
  if(ThisForm.minqtyord.value=="") 
    {
     alert("Select Product Code");
     return false;
    }
	if(ThisForm.ordqty.value=="") 
    {
     alert("Enter Quantity to be ordered");
     return false;
    }
 }    
/*function product(frm,qty){
var taxx=frm.tax.value
var minqty=frm.minqtyord.value
var unitcostt=frm.unitcost.value
var disc=frm.dis.value;
var calcu1=0;
msg=taxx+"\t"+minqty+"\t"+unitcostt+"\t"+disc+"\t"+qty;
if(minqty<qty){
             calcu=Math.round((disc/100)*(unitcostt));
			 calcu1=(calcu*qty)-taxx;
			 alert(calcu1);
			 }
frm.netcost.value=calcu1;
}*/
</script>



 <FORM name="f" method="post" action="ord1.jsp" onSubmit="return valid(this)">
 <center> <CENTER><I><font color="#666666"><b>Order form for Product u Selected is...</b></font></I></CENTER><BR>
<TABLE align="center">
<TR><TD>Customer ID : </TD><TD> <INPUT TYPE="text" NAME="custid" ></TD> </tr>

<TR>
	<TD>Product Code :</TD>


	<TD colspan=3><select name=prodcode onchange=dele(this);>
	<option value="" myvalue="" myvalue1="" myvalue2="" myvalue3="">Select Product Code</option>
<% 
	String todb=null;
	Connection con=null;
//PreparedStatement st=null;
Statement sst=null;
ResultSet rs=null;
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");
    String cmd="select product_code, product_name,unit_cost,tax,discount,min_quantity from product";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd);	
    while(rs.next()) {
	String vall=rs.getString(1);
        System.out.println(vall);
	out.println("<option data-myvalue="+rs.getString(2)+ " data-myvalue1='"+rs.getInt(3)+"' data-myvalue2="+rs.getInt(4)+ " data-myvalue3="+rs.getFloat(5)+ " data-myvalue4="+rs.getInt(6)+ " value='"+vall+"'>"+vall+"</option>");
	}
	

%>
</select></TD></tr>
<TR><TD>Prduct Name : </TD><TD> <INPUT TYPE="text" NAME="prodname" readonly ></TD> </tr>
<TR>
	<TD>  Tax : </TD> <TD> <INPUT TYPE="text" NAME="tax"> </TD>
	<TD>  Min Qty to Order : </TD> <TD> <INPUT TYPE="text" NAME="minqtyord"> </TD>
</TR>
<TR>

</TR>
<TR> 
	<TD> Ordering Quantity :  </TD> <TD> <INPUT TYPE="text" NAME="ordqty" > </TD>
</TR>
<TR>
	<TD>  Discount : </TD> <TD> <INPUT TYPE="text" NAME="dis"> </TD> 
	
</TR>
<TR>
	<TD>  Unit Cost   : </TD> <TD> <INPUT TYPE="text" NAME="unitcost"> </TD>
</TR>

<TR>
	<TD> Mode of Payment : </TD> <TD> <SELECT NAME="modeofpmt"> 
									<option value=cash>credit card
									<option value=DD> DD
									<option value=cheque> cheque
									</SELECT> 
							  </TD>
  <TD>  ccno/ddno/chequeno </TD> <TD> <INPUT TYPE="text" NAME="cc"> </TD>
</TR>


<%
		java.util.Date td=new java.util.Date();
		String temp=td.toString();
		StringTokenizer st=new StringTokenizer(temp," ");
		Vector vec=new Vector();
		while(st.hasMoreTokens()) vec.addElement(st.nextToken());
		for(int i=0;i<vec.size();i++) 
			vec.elementAt(i);	
			todb=vec.elementAt(2)+"-"+vec.elementAt(1)+"-"+vec.elementAt(vec.size()-1);	
%>
<TR>
	<TD>  Order Date   : </TD> <TD> <INPUT TYPE="text" NAME="orddate" value='<%=todb%>'> </TD>
</TR>


<%
			}catch(Exception e){	out.println("Error Occured"+e);	}
%>

</TABLE><BR>

<CENTER><input type="submit" name="submit" value="Order">&nbsp;&nbsp;&nbsp;&nbsp;
<A HREF="Val_login_User.html">home</A></CENTER>

</form>
