/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.GenericDAO;
import java.util.List;
import model.User;
import useDAO.IUserDAO;
import useDAO.UserDAO;

/**
 *
 * @author Hieu
 */
public class UserServiceImpl implements IUserService  {
   
    private final IUserDAO userDAO;

    public UserServiceImpl() {
        this.userDAO = new UserDAO();
    }

    @Override
    public User checkLoginUser(String username, String password) {
        return userDAO.checkLogin(username, password);
    }
    
    
}
