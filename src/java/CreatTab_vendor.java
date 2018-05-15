import java.sql.*;
public class  CreatTab_vendor
{
	public static void main(String[] args) 
	{
		try{
		         Class.forName("com.mysql.jdbc.Driver");
		         Connection con = MysqlConnect.getDbCon().conn;
		         Statement stmt = con.createStatement();
				 boolean val = stmt.execute("create table Vendor(vend_code number(10) primary key,vendor_name  varchar2(25),address varchar2(30) )");
				 if(!val)
				 	System.out.println(" Vendor Table Created successfully");
				 else
					System.out.println(" Vendor Table not Created ");
		     }catch(Exception exc) { exc.printStackTrace();}
	}
}
