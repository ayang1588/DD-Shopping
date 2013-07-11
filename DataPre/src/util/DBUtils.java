package util;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

import org.apache.commons.dbcp.BasicDataSource;

public class DBUtils {
	private static BasicDataSource dataSource;

	private static ThreadLocal tl = new ThreadLocal();
	static {
		try {
			dataSource = new BasicDataSource();
			Properties props = new Properties();
			props.load(DBUtils.class.getClassLoader().getResourceAsStream(
					"util/db.properties"));
			dataSource.setDriverClassName(props.getProperty("driver"));
			dataSource.setUrl(props.getProperty("url"));
			dataSource.setUsername(props.getProperty("username"));
			dataSource.setPassword(props.getProperty("password"));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static Connection getConnection() throws SQLException {
		Connection con = (Connection) tl.get();
		if (con == null) {
			con = dataSource.getConnection();
			tl.set(con);
		}
		return con;
	}

	public static void closeConnection() {
		try {
			Connection con = (Connection) tl.get();
			if (con != null) {
				con.close();
				tl.set(null);
			}
		} catch (SQLException e) {
		}
	}

	public static void beginTx() {
		try {
			Connection con = getConnection();
			con.setAutoCommit(false);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public static void commitTx() {
		try {
			Connection con = getConnection();
			con.commit();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public static void rollbackTx() {
		try {
			Connection con = getConnection();
			con.rollback();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public static void main(String[] args) throws Exception {
		List list = new ArrayList();
		List list1 = Collections.synchronizedList(list);
	}

}
