
package Conexiones;

import java.sql.*;

public class dbConnection {
    static String url="jdbc:mysql://localhost:3306/plataformaagricola"; 
    static String user="root";
    static String pass="root";
    
    public static Connection conectar()
    {
       Connection con=null;
       try
       {
       con=DriverManager.getConnection(url,user,pass);
           System.out.println("Conexión exitosa");
       }catch(SQLException e)
       {
        e.printStackTrace();
       }
       
       return con;
               
    }
}
