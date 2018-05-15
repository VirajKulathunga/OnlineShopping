import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ChangePass extends HttpServlet {
	Connection con;
	PreparedStatement prst;
	int Rec;
	String test;

	public void init(ServletConfig sc) throws ServletException {
		try {
			super.init(sc);
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager
					.getConnection("jdbc:odbc:web", "scott", "tiger");
		} catch (Exception exc) {
			exc.printStackTrace();
		}
	}

	public void service(HttpServletRequest hreq, HttpServletResponse hresp)
			throws ServletException, IOException {
		try {
			prst = con
					.prepareStatement("update LOGIN set PASSWORD=? where USER_NAME=? and PASSWORD=?");
			String str1 = hreq.getParameter("t1").trim();
			String str2 = hreq.getParameter("t2").trim();
			String str3 = hreq.getParameter("t3").trim();
			String str4 = hreq.getParameter("t4").trim();
			System.out.println(" After  getparameter");
			//System.out.println(str2+"   "+str3+"  "+str3);
			prst.setString(2, str1);
			prst.setString(3, str2);
			prst.setString(1, str3);
			System.out.println(" After  setString");

			int n = 0;
			if (str3.equals(str4)) {
				System.out.println(" before  .executeUpdate()");
				n = 1;
				Rec = prst.executeUpdate();
				System.out.println(" after   .executeUpdate()");

			}
			test = ((Rec > 0 && n == 1) ? "Success" : "Failure");
			hresp.sendRedirect("changepassword.html?" + test);

		} catch (Exception exc) {
			exc.printStackTrace();
		}
	}
}