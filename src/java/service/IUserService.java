package service;

import java.util.List;
import model.User;

public interface IUserService {
    User login(String usernameOrEmail, String password);
    void insertUser(User user);
    User selectUser(int id);
    List<User> selectAllUsers();
    boolean updateUser(User user);
    boolean updateStatus(int id, boolean status);
    boolean deleteUser(int id);
    List<User> searchUser(String keyword);
}
