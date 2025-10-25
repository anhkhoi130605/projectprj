package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private int userId; 
    private List<CartItem> items;

    // Constructor mặc định
    public Cart() {
        this.userId = 0; 
        this.items = new ArrayList<>();
    }
    
   
    public Cart(int userId) {
        this.userId = userId;
        this.items = new ArrayList<>();
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }

    // Business Methods

    /**
     * Thêm CartItem vào giỏ hàng.
     */
    public void addItem(CartItem item) {
        if (item != null) {
             this.items.add(item);
        }
    }
    
    /**
     * Tính tổng tiền của toàn bộ giỏ hàng.
     */
    public double getTotalPrice() {
        return items.stream()
                    .mapToDouble(CartItem::getTotalPrice)
                    .sum();
    }
    
    /**
     * Tìm CartItem theo ID sản phẩm.
     */
    public CartItem getItemByProductId(int productId) {
        return items.stream()
                    .filter(item -> item.getProduct().getId() == productId)
                    .findFirst()
                    .orElse(null);
    }
}