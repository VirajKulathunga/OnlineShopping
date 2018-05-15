<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<HTML>
<BODY BGCOLOR="#FFCCAA">

<script>

function update(obj) {
samp=obj.value
obj=obj.options[obj.selectedIndex].dataset.myvalue//.split(" ");
document.forms[0].vendorname.value=obj//[obj.length-1]
}
onload=function() {document.forms[0].t1.options[document.forms[0].selectedIndex]=1;}
</script>


<FORM METHOD=POST ACTION="update_vend_db_srv">
<BR>
<center>
<U> <h3> Update a New Vendor </h3> </U>

<TABLE>
<TR>
	<TD>Vendor Code  </TD> 
	<TD><select name=t1 onchange=update(this);>
	<option value="" >Select Vendor Code</option>

<% 
	Connection con=null;
PreparedStatement st=null;
Statement sst=null;
ResultSet rs=null;
try {
	Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopping","root","123");
    String cmd="select vendor_code, vendor_name from vendor";
    sst=con.createStatement();
    rs=sst.executeQuery(cmd);	
    while(rs.next()) {
	String vall=rs.getString(1);
	out.println("<option data-myvalue="+rs.getString(2)+ " value='"+vall+"'>"+vall+"</option>");
	}

%>


</tr> <BR>
<tr>
</select></TD><TD nowrap>Vendor Name  </TD><TD nowrap> <INPUT TYPE="text" NAME="vendorname" >
</TR><BR>

<%
			}catch(Exception e){	out.println("Error Occured"+e);	}
%>
<TR>
	<TD>Address    </TD> <TD> <TEXTAREA NAME="t3" ROWS="2" COLS="16"> </TEXTAREA></TD>
</TR>
</TABLE>
<CENTER> 
	<INPUT TYPE="submit" VALUE="Submit"> <BR> <BR>
	<A HREF="vendor_adm_screen.html">Click to go back to Vendor Administration </A><BR> <BR>
	<A HREF="adm.html">Click to go back to Administration</A>
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
