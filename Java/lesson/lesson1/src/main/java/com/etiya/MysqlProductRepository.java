package com.etiya;

public class MysqlProductRepository implements ProductRepo
{
  @Override
  public void save(Product product) {
    System.out.println("mysql");
  }
}
