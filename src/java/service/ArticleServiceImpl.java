/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import articleDAO.ArticleDAO;
import model.article;

/**
 *
 * @author trank
 */
public class ArticleServiceImpl implements IArticleService {
        private ArticleDAO articleDAO = new ArticleDAO();
    @Override
    public article getAllArticle() {
        return articleDAO.getAllArticle();
    }
    @Override
    public article findArticleByID(int articleID) {
        return articleDAO.findArticleByID(articleID);
    }
    

    @Override
    public article findArtileByUser(int userID) {
        return articleDAO.findArtileByUser(userID);
    }

    @Override
    public void deleteUserArticle(int userID) {
        articleDAO.deleteUserArticle(userID);
    }

    @Override
    public void deleteArticleByID(int articleID) {
        articleDAO.deleteArticleByID(articleID);
    }
    @Override
    public void addNewArticle(int userID, String status, String title, String content) {
        articleDAO.addNewArticle(userID, status, title, content);
    }
    
    
}
