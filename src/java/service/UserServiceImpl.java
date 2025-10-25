package service;

import model.User;
import useDAO.IUserDAO;
import useDAO.UserDAO;

import java.util.List;

public class UserServiceImpl implements IUserService {
    private final IUserDAO userDAO;

    // Constructor: truyền vào DAO (có thể dùng DI nếu bạn dùng framework)
    public UserServiceImpl() {
        this.userDAO = new UserDAO();
    }

    public UserServiceImpl(IUserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public User checkLoginUser(String usernameOrEmail, String password) {
        if (usernameOrEmail == null || usernameOrEmail.isBlank() ||
            password == null || password.isBlank()) {
            return null;
        }
        // Có thể ở đây bạn sẽ mã hóa password hoặc so sánh hash
        // Ví dụ: String hashed = hash(password); ...
        User user = userDAO.checkLogin(usernameOrEmail, password);
        // Có thể check status, role … trước khi trả về
        if (user == null) {
            return null;
        }
        if (!user.getStatus()) {  // nếu status = false (bị khóa)
            return null;
        }
        return user;
    }

    @Override
    public User getUserById(String userID) {
        if (userID == null || userID.isBlank()) {
            return null;
        }
        return userDAO.getUserById(userID);
    }

    @Override
    public boolean createUser(User user) {
        if (user == null) {
            return false;
        }
        // Validate bắt buộc: userName, email, password…
        if (user.getUserName() == null || user.getUserName().isBlank()) {
            return false;
        }
        if (user.getEmail() == null || user.getEmail().isBlank()) {
            return false;
        }
        if (user.getPassword() == null || user.getPassword().isBlank()) {
            return false;
        }
        // Mã hóa mật khẩu trước khi lưu (nếu cần)
        // user.setPassword(hash(user.getPassword()));

        // Set những trường mặc định nếu cần
        user.setStatus(true);
        // user.setCreateAt(new Date());  // hoặc hiện tại
        // user.setEnrollmentCount(0);

        return userDAO.createUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        if (user == null || user.getUserID() == null) {
            return false;
        }
        // Nếu chỉnh profile: email, avatarUrl, bio, dateofbirth
        // Nếu đổi password: mật khẩu phải khác trước, mã hóa…
        // Bạn có thể phân biệt như DAO đã làm

        return userDAO.updateUser(user);
    }

    @Override
    public boolean softDeleteUser(String userID, String lastModifiedID) {
        if (userID == null || userID.isBlank()) {
            return false;
        }
        if (lastModifiedID == null || lastModifiedID.isBlank()) {
            return false;
        }
        return userDAO.softDeleteUser(userID, lastModifiedID);
    }

    @Override
    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }

}
