package my.com.dao.impl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import my.com.dao.UserDAO;
import my.com.model.User;
import my.com.utils.DBConnection;

public class UserDAOImpl implements UserDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public User isAccountExist(User user) throws SQLException {
		String sql = "SELECT * \r\n" + "FROM Account\r\n" + "WHERE username = ? AND hash_p = ?";
		User u = null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getHash_p());
			rs = ps.executeQuery();
			if (rs.next()) {
				u = new User();
				u.setIdUser(rs.getInt("id_user"));
				u.setUsername(rs.getString("username"));
				u.setSalt_p(rs.getString("salt_p"));
				u.setHash_p(rs.getString("hash_p"));
				u.setRole(rs.getInt("role"));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return u;
	}

	@Override
	public boolean isUsernameExist(String username) throws SQLException {
		boolean check = false;
		String sql = "SELECT *\r\n" + "FROM Account\r\n" + "WHERE username = ?";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				check = true;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return check;
	}

	@Override
	public boolean insertUser(User user) throws SQLException {
		int row = 0;
		String sql = "INSERT INTO Account VALUES (?,?,?,?,'','','','','','')";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getSalt_p());
			ps.setString(3, user.getHash_p());
			ps.setInt(4, user.getRole());
			row = ps.executeUpdate();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return row > 0;
	}

	@Override
	public boolean updateUser(User user) throws SQLException {
		int row = 0;
		String sql = "UPDATE Account \r\n"
				+ "SET fullname = ?, dob = ?, gender = ?, email = ?, phone = ?, [address] = ?\r\n"
				+ "WHERE id_user = ?";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getFullname());
			ps.setString(2, user.getDob());
			ps.setString(3, user.getGender());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getPhone());
			ps.setString(6, user.getAddress());
			ps.setInt(7, user.getIdUser());
			row = ps.executeUpdate();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return row > 0;
	}

	@Override
	public String getSaltPassword(String username) throws SQLException {
		String s = "";
		String sql = "SELECT salt_p\r\n" + "FROM Account\r\n" + "WHERE username = ?";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				s = rs.getString("salt_p");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return s;
	}

	@Override
	public User getDetailInformationAccount(String username) throws SQLException {
		String sql = "SELECT a.id_user, username, fullname, dob, gender, email, phone,[address]\r\n"
				+ "FROM Account a\r\n" + "WHERE a.username = ?";
		User u = null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				u = new User();
				u.setIdUser(rs.getInt("id_user"));
				u.setUsername(rs.getString("username"));
				u.setFullname(rs.getString("fullname"));
				u.setDob(rs.getString("dob"));				
				if("true".equals(rs.getString("gender"))) {
					u.setGender("Male");
				}else {
					u.setGender("Female");
				}
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getString("phone"));
				u.setAddress(rs.getString("address"));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public List<User> getAllUser(int row) throws SQLException{
		String sql="SELECT a.id_user, username, fullname, dob, gender, email, phone,[address]\r\n"
				+ "FROM Account a\r\n"
				+ "ORDER BY id_user offset ? ROWS FETCH NEXT 3 ROWS only";
		List<User> lst =new ArrayList<User>();
		User u =null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, row);
			rs=ps.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setIdUser(rs.getInt("id_user"));
				u.setUsername(rs.getString("username"));
				u.setFullname(rs.getString("fullname"));
				u.setDob(rs.getString("dob"));				
				if("true".equals(rs.getString("gender"))) {
					u.setGender("Male");
				}else {
					u.setGender("Female");
				}
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getString("phone"));
				u.setAddress(rs.getString("address"));
				lst.add(u);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lst;
	}

	@Override
	public int countTotalUser() throws SQLException {
		String sql="SELECT COUNT(*)\r\n"
				+ "from Account";
		int count = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}

		return count;
	}

	@Override
	public boolean deleteUser(String id) throws SQLException {
		int row = 0;
		String sql = "DELETE FROM Account WHERE id_user = ?";
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			row = ps.executeUpdate();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return row > 0;
	}

}
