package model;

import java.util.UUID;
import java.util.Date;

public class CourseReview {
    private UUID courseReviewID;
    private UUID userID;
    private Date createAt;
    private String comment;
    private UUID courseID;

    // getters & setters
    public UUID getCourseReviewID() { return courseReviewID; }
    public void setCourseReviewID(UUID courseReviewID) { this.courseReviewID = courseReviewID; }

    public UUID getUserID() { return userID; }
    public void setUserID(UUID userID) { this.userID = userID; }

    public Date getCreateAt() { return createAt; }
    public void setCreateAt(Date createAt) { this.createAt = createAt; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public UUID getCourseID() { return courseID; }
    public void setCourseID(UUID courseID) { this.courseID = courseID; }
}
