/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package service;

import model.User;

/**
 *
 * @author Hieu
 */
public interface IUserService {
    User checkLoginUser(String username, String password);
}
