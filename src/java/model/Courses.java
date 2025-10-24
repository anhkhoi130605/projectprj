/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Hieu
 */
@Entity
@Table(name = "Courses")
@NamedQueries({
    @NamedQuery(name = "Courses_1.findAll", query = "SELECT c FROM Courses_1 c"),
    @NamedQuery(name = "Courses_1.findByCourseID", query = "SELECT c FROM Courses_1 c WHERE c.courseID = :courseID"),
    @NamedQuery(name = "Courses_1.findByStatus", query = "SELECT c FROM Courses_1 c WHERE c.status = :status"),
    @NamedQuery(name = "Courses_1.findByName", query = "SELECT c FROM Courses_1 c WHERE c.name = :name"),
    @NamedQuery(name = "Courses_1.findByDescription", query = "SELECT c FROM Courses_1 c WHERE c.description = :description"),
    @NamedQuery(name = "Courses_1.findByImgURL", query = "SELECT c FROM Courses_1 c WHERE c.imgURL = :imgURL"),
    @NamedQuery(name = "Courses_1.findByRating", query = "SELECT c FROM Courses_1 c WHERE c.rating = :rating"),
    @NamedQuery(name = "Courses_1.findByPrice", query = "SELECT c FROM Courses_1 c WHERE c.price = :price"),
    @NamedQuery(name = "Courses_1.findByLevel", query = "SELECT c FROM Courses_1 c WHERE c.level = :level")})
public class Courses implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "courseID")
    private String courseID;
    @Column(name = "status")
    private String status;
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
    @Column(name = "imgURL")
    private String imgURL;
    @Column(name = "rating")
    private Integer rating;
    @Column(name = "price")
    private Integer price;
    @Basic(optional = false)
    @Column(name = "level")
    private String level;
    @JoinColumn(name = "userID", referencedColumnName = "userID")
    @ManyToOne
    private User userID;

    public Courses() {
    }

    public Courses(String courseID) {
        this.courseID = courseID;
    }

    public Courses(String courseID, String level) {
        this.courseID = courseID;
        this.level = level;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public User getUserID() {
        return userID;
    }

    public void setUserID(User userID) {
        this.userID = userID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (courseID != null ? courseID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Courses)) {
            return false;
        }
        Courses other = (Courses) object;
        if ((this.courseID == null && other.courseID != null) || (this.courseID != null && !this.courseID.equals(other.courseID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Courses_1[ courseID=" + courseID + " ]";
    }
    
}
