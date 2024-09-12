package com.etiya;

public class ProductRepository implements ProductRepo
{

    @Override
    public void save(Product product) {
        System.out.println("Postgresql");
    }
}
