package org.example;

public class Main {
    public static void main(String[] args) {
        // Object definition:
        // data_type object_name = new data_type();
        // set value = Assigning value
        // get value = Retrieving value, reading

        // Product product1 = new Product();
        // product1.name = "Delonghi Coffee Machine"; // set value
        // product1.unitPrice = 7500;
        // product1.discount = 7;
        // product1.unitsInStock = 10;
        // product1.imageUrl = "img.jpg";

        // System.out.println(product1.name); // get value

        Product product1 = new Product();
        product1.setName("Delonghi Coffee Machine");
        product1.setUnitPrice(7500);
        product1.setDiscount(7);
        product1.setUnitsInStock(10);
        product1.setImageUrl("img.jpg");

        Product product2 = new Product();
        product2.setName("Sweg Coffee Machine");
        product2.setUnitPrice(8500);
        product2.setDiscount(8);
        product2.setUnitsInStock(10);
        product2.setImageUrl("img-2.jpg");

        Product product3 = new Product();
        product3.setName("Kitchen Aid Coffee Machine");
        product3.setUnitPrice(4500);
        product3.setDiscount(9);
        product3.setUnitsInStock(10);
        product3.setImageUrl("img-3.jpg");

        // Declared an array of Product type named products.
        Product[] products = {product1, product2, product3};
        for (Product product : products) {
            System.out.println(product.getName());
            System.out.println(product.getUnitPrice());
            System.out.println(product.getDiscount());
            System.out.println(product.getUnitsInStock());
            System.out.println(product.getImageUrl());
            System.out.println("===================================");
        }

        IndividualCustomer individualCustomer = new IndividualCustomer();
        individualCustomer.setId(1);
        individualCustomer.setCustomerNumber("12345");
        individualCustomer.setPhone("555-555-5555");
        individualCustomer.setFirstName("John");
        individualCustomer.setLastName("Doe");

        CorporateCustomer corporateCustomer = new CorporateCustomer();
        corporateCustomer.setId(2);
        corporateCustomer.setCustomerNumber("54321");
        corporateCustomer.setPhone("555-555-5555");
        corporateCustomer.setCompanyName("ABC Company");
        corporateCustomer.setTaxNumber("1234567890");

        Customer[] customers = {individualCustomer, corporateCustomer};
    }
}
