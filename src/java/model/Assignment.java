package model;

import java.util.UUID;

public class Assignment {
    private UUID assignmentID;
    private UUID userID;
    private String name;
    private String description;
    private Integer order;
    private UUID sectionID;

    // getters & setters
    public UUID getAssignmentID() { return assignmentID; }
    public void setAssignmentID(UUID assignmentID) { this.assignmentID = assignmentID; }

    public UUID getUserID() { return userID; }
    public void setUserID(UUID userID) { this.userID = userID; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Integer getOrder() { return order; }
    public void setOrder(Integer order) { this.order = order; }

    public UUID getSectionID() { return sectionID; }
    public void setSectionID(UUID sectionID) { this.sectionID = sectionID; }
}
