package com.etiya;

import java.util.ArrayList;
import java.util.List;

public class Main {
  public static void main(String[] args) {
    System.out.println("Hello world!");

    int a = 0;
    System.out.println(a);

    String b = "Merhaba, Etiya";
    System.out.println(b);

    for(int i=0; i<5; i++)
    {
      System.out.println(i);
    }
    String[] names = { "Asli", "Huseyin", "Eylul", "Eren" };
    for(String name: names) {
      System.out.println(name);
    }

    int c=0;
    int d=1;

    System.out.println("-----");

    String s1 = new String("Merhaba");
    String s2 = new String("Merhaba");

    System.out.println(s1==s2);
    System.out.println(s1.equals(s2));

    System.out.println("-----");
    // Wrapper Classes
    // Java -128-127 cache
    Integer x = 128; // Referans tip -2.147.xxxxx - 2.147.xxxxx
    Integer y = 128;
    System.out.println(x==y);
    System.out.println(x.equals(y)); // BEST PRACTICE
    // IRepository<Integer>

    // String Pool
    List<String> languages = new ArrayList<>();
    languages.add(new String("C#"));
    languages.add("Javascript");
    languages.add("Java");

    List<String> languages2 = new ArrayList<>();
    languages2.add(new String("C#"));
    languages2.add("Java");
    languages2.add("Javascript");

    System.out.println("-----");

    System.out.println(languages == languages2);
    System.out.println(languages.equals(languages2));

    // JDK => Java Dev. Kit
    // SDK => Software Dev. Kit

    // OOP => Object Oriented Programming

    // garenta => rent a car
    // araba kiralama işlemi fonk.

    String car1Brand = "BMW";
    String car1Model = "118";
    int car1Year = 2021;

    // Instance
    Car car = new Car(); // ilgili kalıptan örnek üretme işlemi.
    car.setBrand("BMW");
    car.setModel("118"); // set
    car.setColor("Beyaz"); // set
    car.setYear(2021); // set
    System.out.println("*-----");
    System.out.println(car.getBrand()); // get
    System.out.println(car.getModel()); // get


    Product product = new Product();

    // Bağlılık -> Sıkı-Gevşek
    // Loose Coupling
    ProductRepo productRepository = new ProductRepository();
    productRepository.save(product);
    // Sürdürülebilirlik
  }
}