/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.UUID;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Hieu
 */
@Entity
@Table(name = "User")
@NamedQueries({
    @NamedQuery(name = "User_1.findAll", query = "SELECT u FROM User_1 u"),
    @NamedQuery(name = "User_1.findByUserID", query = "SELECT u FROM User_1 u WHERE u.userID = :userID"),
    @NamedQuery(name = "User_1.findByPhoneNumber", query = "SELECT u FROM User_1 u WHERE u.phoneNumber = :phoneNumber"),
    @NamedQuery(name = "User_1.findByEmail", query = "SELECT u FROM User_1 u WHERE u.email = :email"),
    @NamedQuery(name = "User_1.findByAvatarUrl", query = "SELECT u FROM User_1 u WHERE u.avatarUrl = :avatarUrl"),
    @NamedQuery(name = "User_1.findByStatus", query = "SELECT u FROM User_1 u WHERE u.status = :status"),
    @NamedQuery(name = "User_1.findByPassword", query = "SELECT u FROM User_1 u WHERE u.password = :password"),
    @NamedQuery(name = "User_1.findByRole", query = "SELECT u FROM User_1 u WHERE u.role = :role"),
    @NamedQuery(name = "User_1.findByUserName", query = "SELECT u FROM User_1 u WHERE u.userName = :userName"),
    @NamedQuery(name = "User_1.findByCreateAt", query = "SELECT u FROM User_1 u WHERE u.createAt = :createAt"),
    @NamedQuery(name = "User_1.findByLastModifiedAt", query = "SELECT u FROM User_1 u WHERE u.lastModifiedAt = :lastModifiedAt"),
    @NamedQuery(name = "User_1.findByLastModifiedID", query = "SELECT u FROM User_1 u WHERE u.lastModifiedID = :lastModifiedID"),
    @NamedQuery(name = "User_1.findByBio", query = "SELECT u FROM User_1 u WHERE u.bio = :bio"),
    @NamedQuery(name = "User_1.findByDateofbirth", query = "SELECT u FROM User_1 u WHERE u.dateofbirth = :dateofbirth"),
    @NamedQuery(name = "User_1.findByFirstName", query = "SELECT u FROM User_1 u WHERE u.firstName = :firstName"),
    @NamedQuery(name = "User_1.findByLastName", query = "SELECT u FROM User_1 u WHERE u.lastName = :lastName"),
    @NamedQuery(name = "User_1.findByToken", query = "SELECT u FROM User_1 u WHERE u.token = :token"),
    @NamedQuery(name = "User_1.findByRefreshToken", query = "SELECT u FROM User_1 u WHERE u.refreshToken = :refreshToken"),
    @NamedQuery(name = "User_1.findByLoginProvider", query = "SELECT u FROM User_1 u WHERE u.loginProvider = :loginProvider"),
    @NamedQuery(name = "User_1.findByProviderKey", query = "SELECT u FROM User_1 u WHERE u.providerKey = :providerKey"),
    @NamedQuery(name = "User_1.findByEnrollmentCount", query = "SELECT u FROM User_1 u WHERE u.enrollmentCount = :enrollmentCount")})
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "userID")
    private String userID;
    @Column(name = "phoneNumber")
    private String phoneNumber;
    @Column(name = "email")
    private String email;
    @Column(name = "avatarUrl")
    private String avatarUrl;
    @Basic(optional = false)
    @Column(name = "status")
    private boolean status;
    @Column(name = "password")
    private String password;
    @Column(name = "role")
    private String role;
    @Column(name = "userName")
    private String userName;
    @Column(name = "createAt")
    @Temporal(TemporalType.DATE)
    private Date createAt;
    @Column(name = "lastModifiedAt")
    @Temporal(TemporalType.DATE)
    private Date lastModifiedAt;
    @Column(name = "lastModifiedID")
    private String lastModifiedID;
    @Column(name = "bio")
    private String bio;
    @Column(name = "dateofbirth")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateofbirth;
    @Column(name = "firstName")
    private String firstName;
    @Column(name = "lastName")
    private String lastName;
    @Basic(optional = false)
    @Column(name = "token")
    private String token;
    @Basic(optional = false)
    @Column(name = "RefreshToken")
    private String refreshToken;
    @Column(name = "LoginProvider")
    private String loginProvider;
    @Column(name = "ProviderKey")
    private String providerKey;
    @Basic(optional = false)
    @Column(name = "EnrollmentCount")
    private int enrollmentCount;
    @OneToMany(mappedBy = "userID")
    private Collection<Courses> coursesCollection;

   public User() {
        this.userID = UUID.randomUUID().toString().toUpperCase();
        this.avatarUrl = "";
        this.token = "";
        this.refreshToken = "";
        this.loginProvider = null;
        this.providerKey = null;
        this.bio = "";
        this.dateofbirth = null;
        this.enrollmentCount = 0;
        this.createAt = new Date();
        this.lastModifiedAt = this.createAt;
        this.firstName = "";
        this.lastName = "";
        this.userName = "";
        this.email = "";
        this.password = "";
        this.role = "Learner";
        this.status = true;
    }

    public User(String userName, String password, String email, String firstName, String lastName, String phone, String role) {
        this(); // Gọi constructor mặc định
        this.userName = safeString(userName);
        this.password = safeString(password);
        this.email = safeString(email);
        this.firstName = safeString(firstName);
        this.lastName = safeString(lastName);
        this.phoneNumber = safeString(phone);
        this.role = mapRole(role);
    }

    // -------------------- HÀM HỖ TRỢ --------------------
    private String safeString(String input) {
        return (input == null) ? "" : input.trim();
    }

    private String mapRole(String role) {
        if (role == null) return "Learner";
        switch (role.trim().toLowerCase()) {
            case "admin":
                return "Admin";
            case "instructor":
                return "Instructor";
            default:
                return "Learner";
        }
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getLastModifiedAt() {
        return lastModifiedAt;
    }

    public void setLastModifiedAt(Date lastModifiedAt) {
        this.lastModifiedAt = lastModifiedAt;
    }

    public String getLastModifiedID() {
        return lastModifiedID;
    }

    public void setLastModifiedID(String lastModifiedID) {
        this.lastModifiedID = lastModifiedID;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public Date getDateofbirth() {
        return dateofbirth;
    }

    public void setDateofbirth(Date dateofbirth) {
        this.dateofbirth = dateofbirth;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    public String getLoginProvider() {
        return loginProvider;
    }

    public void setLoginProvider(String loginProvider) {
        this.loginProvider = loginProvider;
    }

    public String getProviderKey() {
        return providerKey;
    }

    public void setProviderKey(String providerKey) {
        this.providerKey = providerKey;
    }

    public int getEnrollmentCount() {
        return enrollmentCount;
    }

    public void setEnrollmentCount(int enrollmentCount) {
        this.enrollmentCount = enrollmentCount;
    }

    public Collection<Courses> getCoursesCollection() {
        return coursesCollection;
    }

    public void setCoursesCollection(Collection<Courses> coursesCollection) {
        this.coursesCollection = coursesCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userID != null ? userID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.userID == null && other.userID != null) || (this.userID != null && !this.userID.equals(other.userID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.User_1[ userID=" + userID + " ]";
    }
    
}
