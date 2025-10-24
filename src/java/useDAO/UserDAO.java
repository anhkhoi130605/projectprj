/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package useDAO;

import dao.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author Hieu
 */
public class UserDAO implements IUserDAO {

    private static final String LOGIN =
    "SELECT * FROM User WHERE [userName]=? AND [password]=?";
    
    
    private User mapResultSet(ResultSet rs) throws SQLException {
        User user = new User();

        user.setUserID(rs.getString("Id"));
        user.setUserName(rs.getString("UserName"));
        user.setPassword(rs.getString("Password"));
        user.setEmail(rs.getString("Email"));

        user.setAvatarUrl(rs.getString("AvatarUrl"));
        user.setRole(rs.getString("Role"));
        user.setToken(rs.getString("Token"));
        user.setRefreshToken(rs.getString("RefreshToken"));

        user.setLoginProvider(rs.getString("LoginProvider"));
        user.setProviderKey(rs.getString("ProviderKey"));
        user.setBio(rs.getString("Bio"));
        user.setDateofbirth(rs.getDate("dateofbirth"));
        user.setPhoneNumber(rs.getString("Phone"));
        user.setEnrollmentCount(rs.getInt("EnrollmentCount"));
        return user;
    }
    @Override
    public User checkLogin(String username, String password) {
        User us = null;
        System.out.println("DEBUG: Attempting login for username: " + username + ", hashed password: [REDACTED]");
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ptm = con.prepareStatement(LOGIN)) {

            ptm.setString(1, username);
            ptm.setString(2, password);  // truyền password đã hash
            ResultSet rs = ptm.executeQuery();

            if (rs.next()) {
                us = mapResultSet(rs);
            } else {
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;

    }
    
}
