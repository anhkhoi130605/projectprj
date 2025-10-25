/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package articleDAO;

import java.sql.SQLException;
import model.article;


public interface IArticleDAO {
    article getAllArticle() throws SQLException;
    article findArticleByID(int articleID) throws SQLException;
    article findArtileByUser(int userID) throws SQLException;
    void deleteUserArticle(int userID) throws SQLException;
    void deleteArticleByID(int articleID) throws SQLException;
    void addNewArticle(int userID, String status, String title ,String content) throws SQLException;
    
}
