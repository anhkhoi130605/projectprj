package productDao;

import model.Product;
import java.sql.SQLException;
import java.util.List;

public interface IProductDAO {
    void insertProduct(Product pro) throws SQLException;
    Product selectProduct(int id);
    List<Product> selectAllProducts();
    List<Product> selectProductsPage(int offset, int pageSize);
    int countAllProducts();
    boolean deleteProduct(int id) throws SQLException;
    boolean updateProduct(Product pro) throws SQLException;
}
