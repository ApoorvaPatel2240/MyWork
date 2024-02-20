 
package project;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class NewClass 
{
    public ResultSet rs;
    public int x;
    public int Insert(String str) throws ClassNotFoundException, SQLException
    {
        Connection con= null;
        Statement stmt = null;
        int x;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studenterp","root","");
        stmt = con.createStatement();
        x = stmt.executeUpdate(str);
        return x;
        
    }
    
    public ResultSet SelectAll(String str) throws ClassNotFoundException, SQLException
    {
        Connection con= null;
        Statement stmt = null;
        int x;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studenterp","root","");
        stmt = con.createStatement();
        ResultSet rs=null;
        rs = stmt.executeQuery(str);
        return rs;
        
    }
    public ResultSet fetch(String str) throws ClassNotFoundException, SQLException
    {
        Connection con= null;
        Statement stmt = null;
        int x;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studenterp","root","");
        stmt = con.createStatement(ResultSet.CONCUR_READ_ONLY, ResultSet.TYPE_SCROLL_SENSITIVE);
        ResultSet rs=null;
        rs = stmt.executeQuery(str);
        return rs;
        
    }
    
}
