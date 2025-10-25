package orderDao;

import model.Order;
import java.sql.SQLException;

public interface IOrderDao {
    int createOrder(Order order) throws SQLException; // trả về orderId
    void addOrderDetail(int orderId, int productId, int quantity, double price) throws SQLException;
}
