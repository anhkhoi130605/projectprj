package service;

import model.User;
import java.util.List;

public interface IUserService {
    /**
     * Kiểm tra đăng nhập: dùng username hoặc email, và mật khẩu.
     * @param usernameOrEmail tên người dùng hoặc email
     * @param password mật khẩu
     * @return đối tượng User nếu đúng, null nếu sai
     */
    User checkLoginUser(String Email, String password);

    /**
     * Lấy thông tin người dùng theo ID.
     * @param userID ID của người dùng
     * @return User nếu tìm thấy, null nếu không
     */
    User getUserById(String userID);

    /**
     * Tạo mới người dùng.
     * @param user đối tượng User cần tạo
     * @return true nếu tạo thành công, false nếu thất bại
     */
    boolean createUser(User user);

    /**
     * Cập nhật thông tin người dùng (profile hoặc mật khẩu).
     * @param user đối tượng User với thông tin mới
     * @return true nếu cập nhật thành công, false nếu thất bại
     */
    boolean updateUser(User user);

    /**
     * Xóa mềm người dùng (chẳng hạn đặt status = false).
     * @param userID ID người dùng cần xóa
     * @param lastModifiedID ID người thực hiện việc xóa
     * @return true nếu thành công, false nếu không
     */
    boolean softDeleteUser(String userID, String lastModifiedID);

    /**
     * Lấy danh sách tất cả người dùng.
     * @return List<User> danh sách người dùng
     */
    List<User> getAllUsers();
}
