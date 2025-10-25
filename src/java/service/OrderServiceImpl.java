package service;

import orderDao.IOrderDao;
import orderDao.OrderDao;
import model.Order;

import java.sql.SQLException;

public class OrderServiceImpl implements IOrderService {
    private IOrderDao orderDao = new OrderDao();

    @Override
    public int createOrder(Order order) throws SQLException {
        return orderDao.createOrder(order);
    }

    @Override
    public void addOrderDetail(int orderId, int productId, int quantity, double price) throws SQLException {
        orderDao.addOrderDetail(orderId, productId, quantity, price);
    }
}
