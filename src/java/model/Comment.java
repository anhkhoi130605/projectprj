package model;

import java.util.UUID;
import java.util.Date;

public class Comment {
    private UUID commentID;
    private UUID userID;
    private Date createAt;
    private UUID parentID;
    private String content;
    private UUID articleID;
    private UUID lessionID;

    // getters & setters
    public UUID getCommentID() { return commentID; }
    public void setCommentID(UUID commentID) { this.commentID = commentID; }

    public UUID getUserID() { return userID; }
    public void setUserID(UUID userID) { this.userID = userID; }

    public Date getCreateAt() { return createAt; }
    public void setCreateAt(Date createAt) { this.createAt = createAt; }

    public UUID getParentID() { return parentID; }
    public void setParentID(UUID parentID) { this.parentID = parentID; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public UUID getArticleID() { return articleID; }
    public void setArticleID(UUID articleID) { this.articleID = articleID; }

    public UUID getLessionID() { return lessionID; }
    public void setLessionID(UUID lessionID) { this.lessionID = lessionID; }
}
