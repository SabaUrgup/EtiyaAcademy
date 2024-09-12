package org.example;

// Class naming convention      : PascalCase
// Method naming convention     : camelCase
// Variable naming convention   : camelCase
// Field naming convention      : camelCase
public class Product {
    // Setting up the environment to define general products. Can be considered a template.
    // private => Accessible only within this class.

    private String name;        // Product's name
    private double unitPrice;   // Product's unit price
    private double discount;    // Product's discount rate
    private String imageUrl;    // Product's image URL
    private int unitsInStock;   // Product's stock quantity

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getUnitsInStock() {
        return unitsInStock;
    }

    public void setUnitsInStock(int unitsInStock) {
        this.unitsInStock = unitsInStock;
    }

    // Right-click -> Source -> Generate Getters and Setters to generate all of them.

    // Example from real life: If the manager decides that no discounts will be applied to products anymore, we can remove the setter immediately. We don’t need to remove it separately for each product.
}
