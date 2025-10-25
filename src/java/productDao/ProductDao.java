package productDao;

import dao.DBConnection;
import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductDao implements IProductDAO {
    private static final String INSERT_PRODUCT_SQL =
            "INSERT INTO Product (name, price, description, stock, import_date, status) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_PRODUCT_BY_ID =
            "SELECT id, name, price, description, stock, import_date, status FROM Product WHERE id = ? AND status = 1";
    private static final String SELECT_ALL_PRODUCTS =
            "SELECT id, name, price, description, stock, import_date, status FROM Product WHERE status = 1 ORDER BY id DESC";
    private static final String SELECT_PRODUCTS_PAGE =
            "SELECT id, name, price, description, stock, import_date, status FROM Product WHERE status = 1 ORDER BY id DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
    private static final String COUNT_ALL_PRODUCTS =
            "SELECT COUNT(*) AS total FROM Product WHERE status = 1";
    private static final String DELETE_PRODUCT_SQL =
            "UPDATE Product SET status = 0 WHERE id = ?";
    private static final String UPDATE_PRODUCT_SQL =
            "UPDATE Product SET name = ?, price = ?, description = ?, stock = ?, import_date = ? WHERE id = ?";

    @Override
    public void insertProduct(Product pro) throws SQLException {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_PRODUCT_SQL)) {

            ps.setString(1, pro.getName());
            ps.setDouble(2, pro.getPrice());
            ps.setString(3, pro.getDescription());
            ps.setInt(4, pro.getStock());

            // import_date: nếu null -> dùng thời gian hiện tại
            if (pro.getImportDate() != null) {
                ps.setTimestamp(5, new Timestamp(pro.getImportDate().getTime()));
            } else {
                ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            }
            // status: nếu chưa set thì mặc định 1
            ps.setInt(6, pro.getStatus() == 0 ? 1 : pro.getStatus());

            ps.executeUpdate();
        }
    }

    @Override
    public Product selectProduct(int id) {
        Product product = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_PRODUCT_BY_ID)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Timestamp ts = rs.getTimestamp("import_date");
                    Date importDate = (ts != null) ? new Date(ts.getTime()) : null;
                    product = new Product(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getDouble("price"),
                            rs.getString("description"),
                            rs.getInt("stock"),
                            importDate,
                            rs.getInt("status")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> selectAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_PRODUCTS);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Timestamp ts = rs.getTimestamp("import_date");
                Date importDate = (ts != null) ? new Date(ts.getTime()) : null;
                products.add(new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("stock"),
                        importDate,
                        rs.getInt("status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> selectProductsPage(int offset, int pageSize) {
        List<Product> products = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_PRODUCTS_PAGE)) {
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Timestamp ts = rs.getTimestamp("import_date");
                    Date importDate = (ts != null) ? new Date(ts.getTime()) : null;
                    products.add(new Product(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getDouble("price"),
                            rs.getString("description"),
                            rs.getInt("stock"),
                            importDate,
                            rs.getInt("status")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public int countAllProducts() {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(COUNT_ALL_PRODUCTS);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE_PRODUCT_SQL)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    @Override
    public boolean updateProduct(Product pro) throws SQLException {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_PRODUCT_SQL)) {
            ps.setString(1, pro.getName());
            ps.setDouble(2, pro.getPrice());
            ps.setString(3, pro.getDescription());
            ps.setInt(4, pro.getStock());
            if (pro.getImportDate() != null) {
                ps.setTimestamp(5, new Timestamp(pro.getImportDate().getTime()));
            } else {
                ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            }
            ps.setInt(6, pro.getId());
            return ps.executeUpdate() > 0;
        }
    }
}
