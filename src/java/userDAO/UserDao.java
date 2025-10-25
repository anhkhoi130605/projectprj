package userDAO;

import dao.DBConnection;
import model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.*;
public class UserDao implements IUserDAO {

    private static EntityManagerFactory emf;
    
    // Không khởi tạo static để tránh lỗi khi main method không có đủ classpath
    
    private static synchronized EntityManagerFactory getEntityManagerFactory() {
        if (emf == null) {
            try {
                emf = Persistence.createEntityManagerFactory("userPU");
            } catch (Exception e) {
                throw new RuntimeException("Failed to initialize EntityManagerFactory for userPU. Make sure:\n" +
                    "1. persistence.xml file is in META-INF directory\n" +
                    "2. Hibernate JAR files are in classpath\n" +
                    "3. Database connection is available", e);
            }
        }
        return emf;
    }
    private EntityManager getEntitymanager(){
        return getEntityManagerFactory().createEntityManager();
    }
    // ---------- LOGIN ----------
    @Override
    public User login(String usernameOrEmail, String password) {
        EntityManager em = getEntitymanager();
        try  {
           TypedQuery<User> query = em.createQuery(
                "SELECT u FROM User u WHERE (u.username = :username OR u.email = :email) " +
                "AND u.password = :password AND u.status = true",
                User.class
            );
            query.setParameter("username", usernameOrEmail);
            query.setParameter("email", usernameOrEmail);
            query.setParameter("password", password);

            List<User> users = query.getResultList();
            return users.isEmpty() ? null : users.get(0);
        } 
        finally{
            em.close();
        }
        
    }

     @Override
    public void insertUser(User user) {
        EntityManager em = getEntitymanager();
        try {
            em.getTransaction().begin();
            em.persist(user); // 💥 Hibernate tự sinh INSERT
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // ---------- SELECT ----------
    @Override
    public User selectUser(int id) {
        EntityManager em = getEntitymanager();
        try {
            return em.find(User.class, id); // 💥 Tự sinh SELECT ... WHERE id = ?
        } finally {
            em.close();
        }
    }

    @Override
    public List<User> selectAllUsers() {
        EntityManager em = getEntitymanager();
        try {
            return em.createQuery("SELECT u FROM User u", User.class)
                     .getResultList();
        } finally {
            em.close();
        }
    }

    // ---------- UPDATE ----------
    @Override
    public boolean updateUser(User user) {
        EntityManager em = getEntitymanager();
        try {
            em.getTransaction().begin();
            em.merge(user); // 💥 Hibernate tự sinh UPDATE
            em.getTransaction().commit();
            return true;
        } finally {
            em.close();
        }
    }

    @Override
    public boolean updateStatus(int id, boolean status) {
        EntityManager em = getEntitymanager();
        try {
            em.getTransaction().begin();
            User u = em.find(User.class, id);
            if (u != null) {
                u.setStatus(status);
                em.merge(u);
                em.getTransaction().commit();
                return true;
            }
        } finally {
            em.close();
        }
        return false;
    }

    // ---------- DELETE ----------
    @Override
    public boolean deleteUser(int id) {
        EntityManager em = getEntitymanager();
        try {
            em.getTransaction().begin();
            User u = em.find(User.class, id);
            if (u != null) {
                em.remove(u); // 💥 Hibernate tự sinh DELETE
                em.getTransaction().commit();
                return true;
            }
        } finally {
            em.close();
        }
        return false;
    }

    // ---------- SEARCH ----------
    @Override
    public List<User> searchUser(String keyword) {
        EntityManager em = getEntitymanager();
        try {
            TypedQuery<User> query = em.createQuery(
                "SELECT u FROM User u WHERE u.username LIKE :kw OR u.email LIKE :kw",
                User.class
            );
            query.setParameter("kw", "%" + keyword + "%");
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    // ---------- Helper ----------
    private static User mapUser(ResultSet rs) throws SQLException {
        return new User(
                rs.getInt("id"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("country"),
                rs.getString("role"),
                rs.getBoolean("status"),
                rs.getString("password"),
                null
        );
    }

    // ---------- Test ----------
    public static void main(String[] args) {
     UserDao u = new UserDao();
     u.deleteUser(5);
}
}
