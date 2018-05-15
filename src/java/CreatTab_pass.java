import java.sql.*;
public class  CreatTab_pass  
{
	public static void main(String[] args) 
	{
		try{
		         Class.forName("com.mysql.jdbc.Driver");
		         Connection con = DriverManager.getConnection("jdbc:odbc:web","sa","");
				 if(con!=null)
					 System.out.println("created:");
		         else
					 System.out.println("not");

				 Statement stmt = con.createStatement();
				 boolean val = stmt.execute("create table ValidUsers(usernames varchar(25) primary key, passwords varchar(20) )");
				 if(!val)
				 	System.out.println(" ValidUsers Table Created Successfully");
				 else
					
					System.out.println(" ValidUsers Table not Created ");
					/*ResultSet rs=stmt.executeQuery("select * from ValidUsers");
					while(rs.next())
					{
						System.out.println(rs.getString(1));
						System.out.println(rs.getString(2));
					}*/

		     }catch(Exception exc) { exc.printStackTrace();}
	}
}
