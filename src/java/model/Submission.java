package model;

import java.util.UUID;
import java.util.Date;

public class Submission {
    private UUID submissionID;
    private UUID userID;
    private Date createAt;
    private String status;
    private UUID assignmentID;

    // getters & setters
    public UUID getSubmissionID() { return submissionID; }
    public void setSubmissionID(UUID submissionID) { this.submissionID = submissionID; }

    public UUID getUserID() { return userID; }
    public void setUserID(UUID userID) { this.userID = userID; }

    public Date getCreateAt() { return createAt; }
    public void setCreateAt(Date createAt) { this.createAt = createAt; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public UUID getAssignmentID() { return assignmentID; }
    public void setAssignmentID(UUID assignmentID) { this.assignmentID = assignmentID; }
}
