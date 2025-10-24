/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package useDAO;

import model.User;

/**
 *
 * @author Hieu
 */
public interface IUserDAO {
    User checkLogin(String username, String password);
}
