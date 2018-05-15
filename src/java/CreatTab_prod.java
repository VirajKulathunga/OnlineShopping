import java.sql.*;
public class  CreatTab_prod  
{
	public static void main(String[] args) 
	{
		try{
		         Class.forName("com.mysql.jdbc.Driver");
		         Connection con = MysqlConnect.getDbCon().conn;
		         Statement stmt = con.createStatement();
				 boolean val = stmt.execute("create table Products(prod_code varchar2(10) primary key, prod_name varchar2(12),categ_code varchar2(15),vend_code varchar2(10),unit_cost number(10),tax number(10),min_qty number(10),prod_descr varchar2(30),discount varchar2(20) )");
				 if(!val)
				 	System.out.println(" Product Table Created successfully");
				 else
					System.out.println(" Product Table not Created ");
		     }catch(Exception exc) { exc.printStackTrace();}
	}
}
