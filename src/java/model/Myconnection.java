
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Myconnection {
    
    public static Connection getConnection() { 
        Connection connection = null ;
        try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourisme", "root", "");
                System.out.println("Connection avec succes a la base de donnees !");
        } catch (ClassNotFoundException cnf) {
                System.out.print("Driver non chargé...");
        } catch (SQLException sqlex) {
                System.out.println("Incapable de connecter a la base de donnees...");
        }
      return connection ;  
    }
}
