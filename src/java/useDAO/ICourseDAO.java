package useDAO;

import java.util.List;
import java.util.UUID;
import model.Course;

public interface ICourseDAO {

    boolean createCourse(Course course);

    Course getCourseById(UUID courseID);

    List<Course> getAllCourses();

    boolean updateCourse(Course course);

    boolean deleteCourse(UUID courseID);

    List<Course> getCoursesByUserId(UUID userID);
}
