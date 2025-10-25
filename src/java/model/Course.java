package model;

import java.util.UUID;

public class Course {
    private UUID courseID;
    private UUID userID;
    private String status;
    private String name;
    private String description;
    private String imgURL;
    private Integer rating;
    private Integer price;
    private String level;
    private Boolean isApproved;

    // Constructor không-tham số
    public Course() {
    }

    // Constructor toàn tham số
    public Course(UUID courseID,
                  UUID userID,
                  String status,
                  String name,
                  String description,
                  String imgURL,
                  Integer rating,
                  Integer price,
                  String level,
                  Boolean isApproved) {
        this.courseID = courseID;
        this.userID = userID;
        this.status = status;
        this.name = name;
        this.description = description;
        this.imgURL = imgURL;
        this.rating = rating;
        this.price = price;
        this.level = level;
        this.isApproved = isApproved;
    }

    // Getters & Setters
    public UUID getCourseID() { return courseID; }
    public void setCourseID(UUID courseID) { this.courseID = courseID; }

    public UUID getUserID() { return userID; }
    public void setUserID(UUID userID) { this.userID = userID; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImgURL() { return imgURL; }
    public void setImgURL(String imgURL) { this.imgURL = imgURL; }

    public Integer getRating() { return rating; }
    public void setRating(Integer rating) { this.rating = rating; }

    public Integer getPrice() { return price; }
    public void setPrice(Integer price) { this.price = price; }

    public String getLevel() { return level; }
    public void setLevel(String level) { this.level = level; }

    public Boolean getIsApproved() { return isApproved; }
    public void setIsApproved(Boolean isApproved) { this.isApproved = isApproved; }
}
