package dao;

import java.sql.*;
import java.util.*;

import bean.Admin;

public class AdminDAO {

	//DB情報
	private static String RDB_DRIVE = "com.mysql.jdbc.Driver";
	private static String URL = "jdbc:mysql://localhost/uniform_db";
	private static String USER = "root";
	private static String PASSWD = "root123";

	private Connection getConnection() {

		try {
			Class.forName(RDB_DRIVE);
			Connection con = DriverManager.getConnection(URL,USER,PASSWD);
			return con;
		}
		catch (Exception e) {
			throw new IllegalStateException(e);
		}
	}

	public Admin selectByAdmin(String userid, String password) {

		Connection con  = null;
		Statement smt = null;
		String sql = "SELECT * FROM admin_info WHERE userid ='"+userid+"' and password='"+password+"'";
		Admin admin = new Admin();

		try {

			//DBのアクセス・操作の準備
			con = getConnection();
			smt = con.createStatement();

			//sql文を実行し、結果を取得
			ResultSet rs = smt.executeQuery(sql);

			rs.first();

			if (rs != null) {
				admin.setUserid(userid);
				admin.setPassword(password);
			}

		}
		catch (Exception e) {
			throw new IllegalStateException(e);
		}
		//リソース開放処理
		finally {
			if (smt == null) {
				try {
					smt.close();
				}
				catch (SQLException ignore) {

				}
			}
			if (con == null) {
				try {
					con.close();
				}
				catch(SQLException e) {

				}
			}
		}
		return admin;
	}

}
