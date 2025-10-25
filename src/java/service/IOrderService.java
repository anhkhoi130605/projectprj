package service;

import model.Order;
import java.sql.SQLException;

public interface IOrderService {
    int createOrder(Order order) throws SQLException;
    void addOrderDetail(int orderId, int productId, int quantity, double price) throws SQLException;
}
