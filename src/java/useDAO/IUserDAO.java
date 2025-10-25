/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package useDAO;

import model.User;
import java.util.List;

public interface IUserDAO {
    User checkLogin(String username, String password);
    User getUserById(String userID);
    boolean createUser(User user);
    boolean updateUser(User user);
    boolean softDeleteUser(String userID, String lastModifiedID);
    List<User> getAllUsers();
}
