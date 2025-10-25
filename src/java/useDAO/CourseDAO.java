package useDAO;

import dao.DBConnection;
import model.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.UUID;

public class CourseDAO implements ICourseDAO {

    private static final String INSERT_SQL =
        "INSERT INTO [dbo].[Courses] (courseID, userID, status, name, description, imgURL, rating, price, level, isApproved) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String GET_BY_ID_SQL =
        "SELECT * FROM [dbo].[Courses] WHERE courseID = ?";

    private static final String GET_ALL_SQL =
        "SELECT * FROM [dbo].[Courses]";

    private static final String UPDATE_SQL =
        "UPDATE [dbo].[Courses] " +
        "SET userID = ?, status = ?, name = ?, description = ?, imgURL = ?, rating = ?, price = ?, level = ?, isApproved = ? " +
        "WHERE courseID = ?";

    // Thay vì DELETE thực sự, chúng ta “xóa” ở đây bằng cách SET isApproved = false
    private static final String SOFT_DELETE_SQL =
        "UPDATE [dbo].[Courses] " +
        "SET isApproved = 0 " +
        "WHERE courseID = ?";

    private static final String GET_BY_USER_ID_SQL =
        "SELECT * FROM [dbo].[Courses] WHERE userID = ?";

    private Course mapResultSet(ResultSet rs) throws SQLException {
        Course c = new Course();
        c.setCourseID(UUID.fromString(rs.getString("courseID")));
        String userIDStr = rs.getString("userID");
        if (userIDStr != null) {
            c.setUserID(UUID.fromString(userIDStr));
        }
        c.setStatus(rs.getString("status"));
        c.setName(rs.getString("name"));
        c.setDescription(rs.getString("description"));
        c.setImgURL(rs.getString("imgURL"));
        int rating = rs.getInt("rating");
        if (!rs.wasNull()) {
            c.setRating(rating);
        }
        int price = rs.getInt("price");
        if (!rs.wasNull()) {
            c.setPrice(price);
        }
        c.setLevel(rs.getString("level"));
        boolean approved = rs.getBoolean("isApproved");
        c.setIsApproved(approved);
        return c;
    }

    @Override
    public boolean createCourse(Course course) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(INSERT_SQL)) {

            ps.setString(1, course.getCourseID().toString());
            if (course.getUserID() != null) {
                ps.setString(2, course.getUserID().toString());
            } else {
                ps.setNull(2, java.sql.Types.VARCHAR);
            }
            ps.setString(3, course.getStatus());
            ps.setString(4, course.getName());
            ps.setString(5, course.getDescription());
            ps.setString(6, course.getImgURL());
            if (course.getRating() != null) {
                ps.setInt(7, course.getRating());
            } else {
                ps.setNull(7, java.sql.Types.INTEGER);
            }
            if (course.getPrice() != null) {
                ps.setInt(8, course.getPrice());
            } else {
                ps.setNull(8, java.sql.Types.INTEGER);
            }
            ps.setString(9, course.getLevel());
            ps.setBoolean(10, course.getIsApproved() != null ? course.getIsApproved() : false);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Course getCourseById(UUID courseID) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_BY_ID_SQL)) {

            ps.setString(1, courseID.toString());
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
    public List<Course> getAllCourses() {
        List<Course> list = new ArrayList<>();
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

    @Override
    public boolean updateCourse(Course course) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(UPDATE_SQL)) {

            if (course.getUserID() != null) {
                ps.setString(1, course.getUserID().toString());
            } else {
                ps.setNull(1, java.sql.Types.VARCHAR);
            }
            ps.setString(2, course.getStatus());
            ps.setString(3, course.getName());
            ps.setString(4, course.getDescription());
            ps.setString(5, course.getImgURL());
            if (course.getRating() != null) {
                ps.setInt(6, course.getRating());
            } else {
                ps.setNull(6, java.sql.Types.INTEGER);
            }
            if (course.getPrice() != null) {
                ps.setInt(7, course.getPrice());
            } else {
                ps.setNull(7, java.sql.Types.INTEGER);
            }
            ps.setString(8, course.getLevel());
            ps.setBoolean(9, course.getIsApproved() != null ? course.getIsApproved() : false);
            ps.setString(10, course.getCourseID().toString());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteCourse(UUID courseID) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(SOFT_DELETE_SQL)) {

            ps.setString(1, courseID.toString());
            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Course> getCoursesByUserId(UUID userID) {
        List<Course> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_BY_USER_ID_SQL)) {

            ps.setString(1, userID.toString());
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapResultSet(rs));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
