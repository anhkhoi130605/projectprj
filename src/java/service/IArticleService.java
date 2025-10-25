/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import java.sql.SQLException;
import model.article;

/**
 *
 * @author trank
 */
public interface IArticleService {
    article getAllArticle(); 
    article findArticleByID(int articleID); 
    article findArtileByUser(int userID); 
    void deleteUserArticle(int userID); 
    void deleteArticleByID(int articleID) ;
    void addNewArticle(int userID, String status, String title ,String content) ;
}
