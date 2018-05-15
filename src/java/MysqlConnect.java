

import com.mysql.jdbc.Connection;
import java.sql.*;
import java.sql.DriverManager;

/**
 * @desc A singleton database access class for MySQL
 * @author Ramindu
 */
public final class MysqlConnect {

    public Connection conn;
    private Statement statement;
    private PreparedStatement stmt;
    public static MysqlConnect db;

    private MysqlConnect() {
        java.sql.Connection conn = null;
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "onlineshopping";
        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
//        String password = "hanky#panky@123";
        String password = "123";
        try {
            Class.forName(driver).newInstance();
            this.conn = (Connection) DriverManager.getConnection(url + dbName, userName, password);
            System.out.println("Connection Success");
        } catch (Exception sqle) {
            sqle.printStackTrace();
        }
    }

    /**
     *
     * @return MysqlConnect Database connection object
     */
    public static MysqlConnect getDbCon() {
        if (db == null) {
            db = new MysqlConnect();
        }
        return db;

    }

    /**
     *
     * @param query String The query to be executed
     * @return a ResultSet object containing the results or null if not
     * available
     * @throws SQLException
     */
    public ResultSet query(String query) throws SQLException {
        statement = db.conn.createStatement();
        ResultSet res = statement.executeQuery(query);
        return res;
    }

    /**
     * @desc Method to insert data to a table
     * @param insertQuery String The Insert query
     * @return boolean
     * @throws SQLException
     */
    public int insert(String insertQuery) throws SQLException {
        statement = db.conn.createStatement();
        int result = statement.executeUpdate(insertQuery);
        return result;

    }

    public int insertAI(String insertQuery) throws SQLException {
        int generatedkey = -1;
        stmt = db.conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
        stmt.executeUpdate();
        ResultSet rs = stmt.getGeneratedKeys();
        if (rs.next()) {
            generatedkey = rs.getInt(1);
            System.out.println("Auto Generated Primary Key " + generatedkey);
        }
        return generatedkey;

    }

}
