package config;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebServlet;

@WebServlet
public class Config implements ServletContextListener {

	public static Connection conn = null;

	public void contextDestroyed(ServletContextEvent arg0) {

		try {

			conn.close();

			System.out.println("DB DISCONNECTED");

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("DEST");

	}

	public void contextInitialized(ServletContextEvent arg0) {

		try {

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce", "root", "kirti@123");

			System.out.println("DB CONNECTED");

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("INIT");

	}

}
