package model;

import java.util.UUID;
import java.util.Date;

public class Article {
    private UUID articleID;
    private UUID userID;
    private Date createAt;
    private String status;
    private String title;
    private String content;

    // getters & setters
    public UUID getArticleID() { return articleID; }
    public void setArticleID(UUID articleID) { this.articleID = articleID; }

    public UUID getUserID() { return userID; }
    public void setUserID(UUID userID) { this.userID = userID; }

    public Date getCreateAt() { return createAt; }
    public void setCreateAt(Date createAt) { this.createAt = createAt; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
}
