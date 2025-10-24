package dao;

import java.lang.reflect.Field;
import java.sql.*;
import java.util.*;
import dao.DBConnection;

/**
 * GenericDAO – CRUD cơ bản với đối tượng entity thuần (JDBC)
 */
public abstract class GenericDAO<T> extends DBConnection {

    private final Class<T> entityClass;
    private final String tableName;
    private final String idColumn;

    public GenericDAO(Class<T> entityClass, String tableName, String idColumn) {
        this.entityClass = entityClass;
        this.tableName = tableName;
        this.idColumn = idColumn;
    }

    // ===================== INSERT =====================
    public boolean save(T entity) {
        try (Connection conn = getConnection()) {
            Field[] fields = entityClass.getDeclaredFields();
            List<String> columns = new ArrayList<>();
            List<Object> values = new ArrayList<>();

            for (Field f : fields) {
                f.setAccessible(true);
                Object val = f.get(entity);
                if (val != null) {
                    columns.add(f.getName());
                    values.add(val);
                }
            }

            String sql = "INSERT INTO " + tableName + " (" +
                    String.join(", ", columns) + ") VALUES (" +
                    String.join(", ", Collections.nCopies(columns.size(), "?")) + ")";

            PreparedStatement stmt = conn.prepareStatement(sql);
            for (int i = 0; i < values.size(); i++) {
                stmt.setObject(i + 1, values.get(i));
            }

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ===================== UPDATE =====================
    public boolean update(T entity) {
        try (Connection conn = getConnection()) {
            Field idField = entityClass.getDeclaredField(idColumn);
            idField.setAccessible(true);
            Object idValue = idField.get(entity);

            Field[] fields = entityClass.getDeclaredFields();
            List<String> setClauses = new ArrayList<>();
            List<Object> values = new ArrayList<>();

            for (Field f : fields) {
                f.setAccessible(true);
                Object val = f.get(entity);
                if (!f.getName().equals(idColumn) && val != null) {
                    setClauses.add(f.getName() + " = ?");
                    values.add(val);
                }
            }

            String sql = "UPDATE " + tableName + " SET " +
                    String.join(", ", setClauses) +
                    " WHERE " + idColumn + " = ?";

            PreparedStatement stmt = conn.prepareStatement(sql);

            int index = 1;
            for (Object val : values) {
                stmt.setObject(index++, val);
            }
            stmt.setObject(index, idValue);

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ===================== SOFT DELETE =====================
    public boolean delete(String idValue) {
        String sql = "UPDATE " + tableName + " SET status = 0 WHERE " + idColumn + " = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setObject(1, idValue);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ===================== FIND BY ID =====================
    public T findById(String idValue) {
        String sql = "SELECT * FROM " + tableName + " WHERE " + idColumn + " = ? AND status = 1";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setObject(1, idValue);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                T obj = entityClass.getDeclaredConstructor().newInstance();
                ResultSetMetaData meta = rs.getMetaData();
                int colCount = meta.getColumnCount();

                for (int i = 1; i <= colCount; i++) {
                    String col = meta.getColumnLabel(i);
                    Object val = rs.getObject(i);
                    try {
                        Field f = entityClass.getDeclaredField(col);
                        f.setAccessible(true);
                        f.set(obj, val);
                    } catch (NoSuchFieldException ignored) {}
                }
                return obj;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // ===================== FIND ALL (status = 1) =====================
    public List<T> findAll() {
        List<T> list = new ArrayList<>();
        String sql = "SELECT * FROM " + tableName + " WHERE status = 1";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            ResultSetMetaData meta = rs.getMetaData();
            int colCount = meta.getColumnCount();

            while (rs.next()) {
                T obj = entityClass.getDeclaredConstructor().newInstance();
                for (int i = 1; i <= colCount; i++) {
                    String col = meta.getColumnLabel(i);
                    Object val = rs.getObject(i);
                    try {
                        Field f = entityClass.getDeclaredField(col);
                        f.setAccessible(true);
                        f.set(obj, val);
                    } catch (NoSuchFieldException ignored) {}
                }
                list.add(obj);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
