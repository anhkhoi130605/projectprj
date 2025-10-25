package model;

import java.util.Date;
import jakarta.persistence.*;
@Entity //=table
@Table (name = "Product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column (name = "name",nullable = false)
    private String name;
    @Column (name = "price",nullable = false)
    private double price;
    @Column (name = "description",nullable = false)
    private String description;
    @Column (name = "stock",nullable = false)
    private int stock;
    @Column (name = "import_date",nullable = false)
    private Date importDate;
    @Column (name = "status",nullable = false)
    private int status; // 0 = ngừng bán, 1 = còn kinh doanh

    public Product() {
        this.status = 1;
    }

    // Constructor cho insert (có importDate + status)
    public Product(String name, double price, String description, int stock, Date importDate, int status) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.stock = stock;
        this.importDate = importDate;
        this.status = status == 0 ? 0 : 1;
    }

    // Constructor đầy đủ (update / select)
    public Product(int id, String name, double price, String description, int stock, Date importDate, int status) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.stock = stock;
        this.importDate = importDate;
        this.status = status;
    }

    // Constructor cũ (giữ để không ảnh hưởng code cũ)
    public Product(String name, double price, String description, int stock) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.stock = stock;
        this.status = 1; // mặc định là 1 (còn kinh doanh)
    }

    // Getter & Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }
    public Date getImportDate() { return importDate; }
    public void setImportDate(Date importDate) { this.importDate = importDate; }
    public int getStatus() { return status; }
    public void setStatus(int status) { this.status = status; }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", stock=" + stock +
                ", importDate=" + importDate +
                ", status=" + status +
                '}';
    }
}
