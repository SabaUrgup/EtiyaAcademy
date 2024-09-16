package com.etiya.kodlamaio;

import com.etiya.kodlamaio.model.Course;
import com.etiya.kodlamaio.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.List;
import java.util.Scanner;

@SpringBootApplication
public class KodlamaioApplication implements CommandLineRunner {

    @Autowired
    private CourseService courseService;

    public static void main(String[] args) {
        SpringApplication.run(KodlamaioApplication.class, args);
    }

    @Override
    public void run(String... args) {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.println("Course Management Application");
            System.out.println("1. List Courses");
            System.out.println("2. Add Course");
            System.out.println("3. Delete Course");
            System.out.println("4. Exit");
            System.out.print("Enter your choice: ");

            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {
                case 1:
                    listCourses();
                    break;
                case 2:
                    addCourse(scanner);
                    break;
                case 3:
                    deleteCourse(scanner);
                    break;
                case 4:
                    System.out.println("Exiting...");
                    scanner.close();
                    System.exit(0);
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
    }

    private void listCourses() {
        List<Course> courses = courseService.getAllCourses();
        if (courses.isEmpty()) {
            System.out.println("No courses available to list.");
        } else {
            System.out.println("Courses:");
            for (Course course : courses) {
                System.out.println(course);
            }
        }
    }

    private void addCourse(Scanner scanner) {
        System.out.print("Course name: ");
        String name = scanner.nextLine();
        System.out.print("Course description: ");
        String description = scanner.nextLine();

        Course course = new Course();
        course.setName(name);
        course.setDescription(description);

        Course savedCourse = courseService.addCourse(course);
        System.out.println("Course added successfully: " + savedCourse);
    }

    private void deleteCourse(Scanner scanner) {
        System.out.print("Enter the ID of the course you want to delete: ");
        Long id = scanner.nextLong();

        if (courseService.getCourseById(id).isPresent()) {
            courseService.deleteCourse(id);
            System.out.println("Course deleted successfully.");
        } else {
            System.out.println("Course not found.");
        }
    }
}
