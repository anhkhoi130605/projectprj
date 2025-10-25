package service;

import java.util.List;
import model.User;
import userDAO.UserDao;

public class UserServiceImpl implements IUserService {
    private UserDao userDao = new UserDao();

    @Override
    public User login(String usernameOrEmail, String password) {
        return userDao.login(usernameOrEmail, password);
    }

    @Override
    public void insertUser(User user) {
        userDao.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userDao.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userDao.selectAllUsers();
    }

    @Override
    public boolean updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public boolean updateStatus(int id, boolean status) {
        return userDao.updateStatus(id, status);
    }

    @Override
    public boolean deleteUser(int id) {
        return userDao.deleteUser(id);
    }

    @Override
    public List<User> searchUser(String keyword) {
        return userDao.searchUser(keyword);
    }
}
