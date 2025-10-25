package model;

import java.util.UUID;

public class Cart {
    private UUID cartID;
    private UUID userID;
    private UUID courseID;

    // getters & setters
    public UUID getCartID() { return cartID; }
    public void setCartID(UUID cartID) { this.cartID = cartID; }

    public UUID getUserID() { return userID; }
    public void setUserID(UUID userID) { this.userID = userID; }

    public UUID getCourseID() { return courseID; }
    public void setCourseID(UUID courseID) { this.courseID = courseID; }
}
