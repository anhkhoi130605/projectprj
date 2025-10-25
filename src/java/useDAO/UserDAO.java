package useDAO;

import dao.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import model.User;

public class UserDAO implements IUserDAO {

    private static final String LOGIN_SQL =
        "SELECT * FROM [dbo].[User] WHERE (userName = ? OR email = ?) AND password = ? AND status = 1";

    private static final String GET_BY_ID_SQL =
        "SELECT * FROM [dbo].[User] WHERE userID = ?";

    private static final String INSERT_SQL =
        "INSERT INTO [dbo].[User] (userID, userName, password, email, phoneNumber, avatarUrl, bio, dateofbirth, status, role, createAt, lastModifiedAt, lastModifiedID, token, RefreshToken, LoginProvider, ProviderKey, EnrollmentCount, firstName, lastName) "
        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String UPDATE_PROFILE_SQL =
        "UPDATE [dbo].[User] "
      + "SET email = ?, avatarUrl = ?, bio = ?, dateofbirth = ?, lastModifiedAt = ?, lastModifiedID = ? "
      + "WHERE userID = ?";

    private static final String UPDATE_PASSWORD_SQL =
        "UPDATE [dbo].[User] "
      + "SET password = ?, lastModifiedAt = ?, lastModifiedID = ? "
      + "WHERE userID = ?";

    private static final String SOFT_DELETE_SQL =
        "UPDATE [dbo].[User] "
      + "SET status = 0, lastModifiedAt = ?, lastModifiedID = ? "
      + "WHERE userID = ?";

    private static final String GET_ALL_SQL =
        "SELECT * FROM [dbo].[User]";

    private User mapResultSet(ResultSet rs) throws SQLException {
        User user = new User();

        user.setUserID(rs.getString("userID"));
        user.setUserName(rs.getString("userName"));
        user.setPassword(rs.getString("password"));
        user.setEmail(rs.getString("email"));
        user.setPhoneNumber(rs.getString("phoneNumber"));
        user.setAvatarUrl(rs.getString("avatarUrl"));
        user.setBio(rs.getString("bio"));
        Timestamp dob = rs.getTimestamp("dateofbirth");
        if (dob != null) {
            user.setDateofbirth(dob);
        }
        user.setStatus(rs.getBoolean("status"));
        user.setRole(rs.getString("role"));
        Date createAt = rs.getDate("createAt");
        if (createAt != null) {
            user.setCreateAt(createAt);
        }
        Date lastModifiedAt = rs.getDate("lastModifiedAt");
        if (lastModifiedAt != null) {
            user.setLastModifiedAt(lastModifiedAt);
        }
        user.setLastModifiedID(rs.getString("lastModifiedID"));
        user.setToken(rs.getString("token"));
        user.setRefreshToken(rs.getString("RefreshToken"));
        user.setLoginProvider(rs.getString("LoginProvider"));
        user.setProviderKey(rs.getString("ProviderKey"));
        user.setEnrollmentCount(rs.getInt("EnrollmentCount"));
        user.setFirstName(rs.getString("firstName"));
        user.setLastName(rs.getString("lastName"));

        return user;
    }

    @Override
    public User checkLogin(String usernameOrEmail, String password) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(LOGIN_SQL)) {

            ps.setString(1, usernameOrEmail);
            ps.setString(2, usernameOrEmail);
            ps.setString(3, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public User getUserById(String userID) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_BY_ID_SQL)) {

            ps.setString(1, userID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean createUser(User user) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(INSERT_SQL)) {

            ps.setString(1, user.getUserID());
            ps.setString(2, user.getUserName());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhoneNumber());
            ps.setString(6, user.getAvatarUrl());
            ps.setString(7, user.getBio());
            if (user.getDateofbirth() != null) {
                ps.setTimestamp(8, new Timestamp(user.getDateofbirth().getTime()));
            } else {
                ps.setTimestamp(8, null);
            }
            ps.setBoolean(9, user.getStatus());
            ps.setString(10, user.getRole());
            if (user.getCreateAt() != null) {
                ps.setDate(11, new Date(user.getCreateAt().getTime()));
            } else {
                ps.setDate(11, null);
            }
            if (user.getLastModifiedAt() != null) {
                ps.setDate(12, new Date(user.getLastModifiedAt().getTime()));
            } else {
                ps.setDate(12, null);
            }
            ps.setString(13, user.getLastModifiedID());
            ps.setString(14, user.getToken());
            ps.setString(15, user.getRefreshToken());
            ps.setString(16, user.getLoginProvider());
            ps.setString(17, user.getProviderKey());
            ps.setInt(18, user.getEnrollmentCount());
            ps.setString(19, user.getFirstName());
            ps.setString(20, user.getLastName());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        if (user.getPassword() != null && !user.getPassword().isBlank()) {
            return updatePassword(user);
        }
        return updateProfile(user);
    }

    private boolean updateProfile(User user) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(UPDATE_PROFILE_SQL)) {

            ps.setString(1, user.getEmail());
            ps.setString(2, user.getAvatarUrl());
            ps.setString(3, user.getBio());
            if (user.getDateofbirth() != null) {
                ps.setTimestamp(4, new Timestamp(user.getDateofbirth().getTime()));
            } else {
                ps.setTimestamp(4, null);
            }
            ps.setDate(5, new Date(System.currentTimeMillis()));
            ps.setString(6, user.getLastModifiedID());
            ps.setString(7, user.getUserID());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean updatePassword(User user) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(UPDATE_PASSWORD_SQL)) {

            ps.setString(1, user.getPassword());
            ps.setDate(2, new Date(System.currentTimeMillis()));
            ps.setString(3, user.getLastModifiedID());
            ps.setString(4, user.getUserID());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean softDeleteUser(String userID, String lastModifiedID) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(SOFT_DELETE_SQL)) {

            ps.setDate(1, new Date(System.currentTimeMillis()));
            ps.setString(2, lastModifiedID);
            ps.setString(3, userID);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_ALL_SQL);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(mapResultSet(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}
