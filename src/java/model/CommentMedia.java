package model;

import java.util.UUID;
import java.util.Date;

public class CommentMedia {
    private UUID commentMediaID;
    private UUID userID;
    private Date createAt;
    private String contentUrl;
    private UUID commentID;

    // getters & setters
    public UUID getCommentMediaID() { return commentMediaID; }
    public void setCommentMediaID(UUID commentMediaID) { this.commentMediaID = commentMediaID; }

    public UUID getUserID() { return userID; }
    public void setUserID(UUID userID) { this.userID = userID; }

    public Date getCreateAt() { return createAt; }
    public void setCreateAt(Date createAt) { this.createAt = createAt; }

    public String getContentUrl() { return contentUrl; }
    public void setContentUrl(String contentUrl) { this.contentUrl = contentUrl; }

    public UUID getCommentID() { return commentID; }
    public void setCommentID(UUID commentID) { this.commentID = commentID; }
}
