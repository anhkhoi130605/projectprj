package service;

import model.Cart; // Import model.Cart mới
import model.CartItem;
import model.Product;

public class CartServiceImpl implements ICartService {

    @Override
    public void addToCart(Cart cart, Product product, int quantity) { 
        if (product == null || quantity <= 0 || cart == null) return;
        
        // Kiểm tra tồn kho
        if (quantity > product.getStock()) {
            throw new IllegalArgumentException("Số lượng yêu cầu (" + quantity + ") vượt quá tồn kho hiện có (" + product.getStock() + ") của sản phẩm " + product.getName());
        }

        CartItem existingItem = cart.getItemByProductId(product.getId());

        if (existingItem != null) {
            int newTotalQuantity = existingItem.getQuantity() + quantity;
            // Kiểm tra tổng số lượng sau khi thêm
            if (newTotalQuantity > product.getStock()) {
                throw new IllegalArgumentException("Tổng số lượng trong giỏ (" + newTotalQuantity + ") vượt quá tồn kho hiện có (" + product.getStock() + ") của sản phẩm " + product.getName());
            }
            existingItem.setQuantity(newTotalQuantity);
        } else {
           cart.getItems().add(new CartItem(product, quantity));
        }
    }

    @Override
    public void updateCartItem(Cart cart, int productId, int newQuantity) { 
        if (cart == null) return;
        if (newQuantity <= 0) {
            removeCartItem(cart, productId);
            return;
        }
        
        CartItem existingItem = cart.getItemByProductId(productId);

        if (existingItem != null) {
            Product product = existingItem.getProduct();
            // Kiểm tra tồn kho trước khi cập nhật
            if (newQuantity > product.getStock()) {
                throw new IllegalArgumentException("Số lượng yêu cầu (" + newQuantity + ") vượt quá tồn kho hiện có (" + product.getStock() + ") của sản phẩm " + product.getName());
            }
            existingItem.setQuantity(newQuantity);
        }
    }

    @Override
    public void removeCartItem(Cart cart, int productId) { 
        if (cart == null) return;
        cart.getItems().removeIf(item -> item.getProduct().getId() == productId);
    }

    @Override
    public double calculateTotal(Cart cart) { 
        if (cart == null) return 0.0;
return cart.getTotalPrice();
    }
}