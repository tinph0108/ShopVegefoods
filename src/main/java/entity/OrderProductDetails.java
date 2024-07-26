package entity;

import java.util.List;

public class OrderProductDetails {
    private Order order;
    private List<Product> products;

    public OrderProductDetails(Order order, List<Product> products) {
        this.order = order;
        this.products = products;
    }

    public Order getOrder() {
        return order;
    }

    public List<Product> getProducts() {
        return products;
    }

    @Override
    public String toString() {
        return "OrderProductDetails [order=" + order + ", products=" + products + "]";
    }
}
