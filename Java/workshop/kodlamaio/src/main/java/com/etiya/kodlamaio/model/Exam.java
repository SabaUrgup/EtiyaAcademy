package com.etiya.kodlamaio.model;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Exam {
    private Long id;
    private Long courseId;
    private String title;
    private int totalMarks;
    private LocalDate dueDate;
}
