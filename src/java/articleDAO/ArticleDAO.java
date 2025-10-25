/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package articleDAO;


import dao.DBConnection;
import model.article;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

public class ArticleDAO implements IArticleDAO{
@Override
public article findArticleByID(int articleID) {
    String sql = "SELECT * FROM article WHERE articleID = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setInt(1, articleID);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) { // ✅ di chuyển con trỏ đến dòng đầu tiên
            article a = new article();
            a.setArticleID(rs.getInt("articleID"));
            a.setContent(rs.getString("content"));
            a.setUserID(rs.getInt("userID"));
            a.setStatus(rs.getString("status"));
            a.setTitle(rs.getString("title"));
            a.setCreateAt(rs.getDate("createAt"));
            return a;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}
    @Override
    public article findArtileByUser(int userID){
        String sql = "SELECT * FROM article WHERE userID = ?" ;
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){
           ps.setInt(1, userID);
           ResultSet rs = ps.executeQuery();
           if (rs.next()) {
               article a = new article();
               a.setArticleID(rs.getInt("articleID"));
               a.setContent(rs.getString("content"));
               a.setStatus(rs.getString("status"));
               a.setTitle(rs.getString("title"));
               a.setCreateAt(rs.getDate("createAt"));
               return a;
               
           }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
        
    }
    
    @Override
    public article getAllArticle(){
        String sql = "SELECT * FROM " ;
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){
           ResultSet rs = ps.executeQuery();
    if (rs.next()) {
               article a = new article();
               a.setArticleID(rs.getInt("articleID"));
               a.setContent(rs.getString("content"));
               a.setStatus(rs.getString("status"));
               a.setTitle(rs.getString("title"));
               a.setCreateAt(rs.getDate("createAt"));
               return a;
               
           }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
        
    }
    
    @Override
    public void deleteUserArticle(int userID){
        String sql = "DELETE FROM article Where userID = ? " ;
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){
        ps.setInt(1, userID);
        ps.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public void deleteArticleByID(int articleID){
        String sql = "DELETE FROM article Where articleID = ? " ;
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){
        ps.setInt(1, articleID);
        ps.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    public void addNewArticle(int userID, String status, String title ,String content){
        String sql = "INSERT INTO article (userID, createAt , status, title, content) VALUES (?, ? ,? , ?, ?); " ;
        try (Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql)){
        java.sql.Date date = new java.sql.Date(System.currentTimeMillis());
        ps.setInt(1, userID);
        ps.setDate(2, date);
        ps.setString(3, status);
        ps.setString(4, title);
        ps.setString(5, content);
        
        ps.executeUpdate();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        ArticleDAO dao = new ArticleDAO();

        // Test thêm bài viết mới
        System.out.println("=== Thêm bài viết mới ===");
        dao.addNewArticle(1, "Active", "Bài viết test", "Nội dung bài viết test");
        System.out.println("Đã thêm thành công!");

        // Test tìm bài viết theo ID
        System.out.println("\n=== Tìm bài viết theo ID ===");
        article a = dao.findArticleByID(1); // giả sử có bài ID = 1
        if (a != null) {
            System.out.println("Tiêu đề: " + a.getTitle());
            System.out.println("Nội dung: " + a.getContent());
            System.out.println("Trạng thái: " + a.getStatus());
            System.out.println("Ngày tạo: " + a.getCreateAt());
        } else {
            System.out.println("Không tìm thấy bài viết.");
        }

        // Test tìm bài viết theo userID
        System.out.println("\n=== Tìm bài viết theo userID ===");
        article b = dao.findArtileByUser(1);
        if (b != null) {
            System.out.println("Tiêu đề: " + b.getTitle());
            System.out.println("Nội dung: " + b.getContent());
        } else {
            System.out.println("Không có bài viết nào của user này.");
        }

        // Test xóa bài viết theo ID
        System.out.println("\n=== Xóa bài viết theo ID ===");
        dao.deleteArticleByID(1); // xóa bài có ID = 1
        System.out.println("Đã xóa bài viết có ID = 1 (nếu tồn tại).");
    }
}