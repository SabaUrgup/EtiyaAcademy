package com.etiya.kodlamaio.repository;

import com.etiya.kodlamaio.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<Course, Long> {
}
