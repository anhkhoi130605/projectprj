/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trank
 */
import java.util.Date;

/**
 *
 * @author trank
 */
public class article {
     private int articleID;
     private int userID;
     private Date createAt;
     private String status;
     private String title;
     private String content;

    public article(int articleID, int userID, Date createAt, String status, String title, String content) {
        this.articleID = articleID;
        this.userID = userID;
        this.createAt = createAt;
        this.status = status;
        this.title = title;
        this.content = content;
    }

    public article() {
    }

    public int getArticleID() {
        return articleID;
    }

    public void setArticleID(int articleID) {
        this.articleID = articleID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "article{" + "articleID=" + articleID + ", userID=" + userID + ", createAt=" + createAt + ", status=" + status + ", title=" + title + ", content=" + content + '}';
    }

     
     
}
