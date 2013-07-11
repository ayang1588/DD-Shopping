package util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;


public class DBUtil_noTX {
	private static String user;

	private static String password;

	private static String url;
	static {
		try {
			ClassLoader classLoader = DBUtil_noTX.class.getClassLoader();
			InputStream is = classLoader.getResourceAsStream("util/db.properties");
			Properties props = new Properties();
			props.load(is);
			url = props.getProperty("url");
			user = props.getProperty("username");
			password = props.getProperty("password");
			Class.forName(props.getProperty("driver"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new RuntimeException("");
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("");
		}
	}

	public static Connection getConnection() throws Exception {
		return DriverManager.getConnection(url, user, password);
	}

	public static void close(ResultSet rs, Statement stat, Connection conn)
			throws Exception {
		if (rs != null) {
			rs.close();
		}
		if (stat != null) {
			stat.close();
		}
		if (conn != null) {
			conn.close();
		}
	}

	public static void close(Statement stat, Connection conn) throws Exception {
		if (stat != null) {
			stat.close();
		}
		if (conn != null) {
			conn.close();
		}
	}

    public static void main(String[] args) throws Exception {
        Connection conn = getConnection();
        System.out.println(conn);
    }
}
