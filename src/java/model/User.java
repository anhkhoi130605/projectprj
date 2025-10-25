package model;

import java.sql.Date;
import jakarta.persistence.*;
@Entity
@Table (name = "Users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "username",nullable = false)
    private String username;
    @Column(name = "email",nullable = false)
    private String email;
    @Column(name = "country",nullable = true)
    private String country;
    @Column(name = "role",nullable = false)
    private String role;
    @Column(name = "status",nullable = false)
    private boolean status;
    @Column(name = "password",nullable = false)
    private String password;
    @Column(nullable = true)
    private Date dob;

    public User() {}

    // full constructor
    public User(int id, String username, String email, String country, String role, boolean status, String password, Date dob) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.country = country;
        this.role = role;
        this.status = status;
        this.password = password;
        this.dob = dob;
    }

    // constructor without dob (for login demo)
    public User(int id, String username, String email, String country, String role, boolean status, String password) {
        this(id, username, email, country, role, status, password, null);
    }

    // getters/setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public boolean isStatus() { return status; }
    public void setStatus(boolean status) { this.status = status; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public java.sql.Date getDob() { return dob; }
    public void setDob(java.sql.Date dob) { this.dob = dob; }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", country='" + country + '\'' +
                ", role='" + role + '\'' +
                ", status=" + status +
                ", password='" + password + '\'' +
                ", dob=" + dob +
                '}';
    }
}