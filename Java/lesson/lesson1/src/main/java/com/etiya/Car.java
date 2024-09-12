package com.etiya;

public class Car
{
  // Araba nesnesi detayları..

  // Encapsulation
  private String brand; // Field - Attribute (Özellik)
  private String model;
  private String color;
  private int year;

  // getter-setter methods

  public String getBrand() {
    return brand;
  }

  public void setBrand(String brand) {
    this.brand = brand;
  }

  public String getModel() {
    return model;
  }

  public void setModel(String model) {
    this.model = model;
  }

  public String getColor() {
    return color;
  }

  public void setColor(String color) {
    this.color = color;
  }

  public int getYear() {
    return year;
  }

  public void setYear(int year) {
    this.year = year;
  }
}
