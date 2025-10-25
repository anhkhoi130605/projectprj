package service;

import model.Product;
import java.sql.SQLException;
import java.util.List;

public interface IProductService {
    void insertProduct(Product product) throws SQLException;
    Product getProduct(int id);
    List<Product> getAllProducts();
    List<Product> getProductsPage(int page, int pageSize);
    int countAllProducts();
    boolean deleteProduct(int id) throws SQLException;
    boolean updateProduct(Product product) throws SQLException;
}
