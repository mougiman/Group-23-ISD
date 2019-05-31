package isd.model.dao;

import isd.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserManager {
	private DBConnector db;

	public List<User> allUser(User u1) throws SQLException {
		List<User> list = new ArrayList<User>();
		Statement statement = null;
		try {
			db = new DBConnector();
			statement = db.openConnection().createStatement();
			StringBuffer sb = new StringBuffer();
			sb.append("select * from huser where 1=1 ");
			if (null!=u1.getName()) {
				sb.append(" and User_Name = '"+u1.getName()+"'");
			}
			if (null!=u1.getPhone()) {
				sb.append(" and User_Phone = '"+u1.getPhone()+"'");
			}
			ResultSet rs = statement.executeQuery(sb.toString());
			while (rs.next()) {
				User u = new User();
				u.setId(rs.getString("User_id"));
				u.setEmail(rs.getString("User_Email"));
				u.setUserName(rs.getString("User_Username"));
				u.setActivate(rs.getInt("User_Activate"));
				u.setDob(rs.getString("User_DOB"));
				u.setPhone(rs.getString("User_Phone"));
				u.setName(rs.getString("User_Name"));
				list.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			statement.close();
			db.closeConnection();
		}

		return list;
	}

	public void addUser(User u) throws SQLException {
		Statement statement = null;
		try {
			db = new DBConnector();
			statement = db.openConnection().createStatement();
			String sql = "INSERT INTO huser (`User_Username`, `User_DOB`, `User_Email`, `User_Password` , User_Activate,User_Phone)"
					+ "VALUES ('" + u.getUserName()+ "', sysdate(), '" + u.getEmail() + "', '"
					+ u.getPassword() + "',1,'"+u.getPhone()+"')";

			statement.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			statement.close();
			db.closeConnection();
		}

	}

	public void activateUser(User u) throws SQLException {
		Statement statement = null;
		try {
			db = new DBConnector();
			statement = db.openConnection().createStatement();
			String sql = "UPDATE huser SET User_Activate = 1 WHERE User_id = " + u.getId();

			statement.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			statement.close();
			db.closeConnection();
		}
	}

	public void deactivateUser(User u) throws SQLException {
		Statement statement = null;
		try {
			db = new DBConnector();
			statement = db.openConnection().createStatement();
			String sql = "UPDATE huser SET User_Activate = 0 WHERE User_id = " + u.getId();

			statement.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			statement.close();
			db.closeConnection();
		}
	}

	public void deleteUser(User u) throws SQLException {
		Statement statement = null;
		try {
			db = new DBConnector();
			statement = db.openConnection().createStatement();
			String sql = "delete from huser WHERE User_id = " + u.getId();
			statement.executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			statement.close();
			db.closeConnection();
		}
	}
}
