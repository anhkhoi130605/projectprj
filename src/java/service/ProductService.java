package service;

import model.Product;
import productDao.IProductDAO;
import productDao.ProductDao;
import java.sql.SQLException;
import java.util.List;

public class ProductService implements IProductService {
    private IProductDAO productDAO;

    public ProductService() {
        productDAO = new ProductDao();
    }

    @Override
    public void insertProduct(Product product) throws SQLException {
        productDAO.insertProduct(product);
    }

    @Override
    public Product getProduct(int id) {
        return productDAO.selectProduct(id);
    }

    @Override
    public List<Product> getAllProducts() {
        return productDAO.selectAllProducts();
    }

    @Override
    public List<Product> getProductsPage(int page, int pageSize) {
        if (page < 1) page = 1;
        if (pageSize < 1) pageSize = 10;
        int offset = (page - 1) * pageSize;
        return productDAO.selectProductsPage(offset, pageSize);
    }

    @Override
    public int countAllProducts() {
        return productDAO.countAllProducts();
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        return productDAO.deleteProduct(id);
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        return productDAO.updateProduct(product);
    }
}
