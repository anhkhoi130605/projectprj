package service;

import model.Cart; // Import model.Cart mới
import model.Product;

public interface ICartService {
    void addToCart(Cart cart, Product product, int quantity);
    void updateCartItem(Cart cart, int productId, int newQuantity);
    void removeCartItem(Cart cart, int productId); 
    double calculateTotal(Cart cart); 
}