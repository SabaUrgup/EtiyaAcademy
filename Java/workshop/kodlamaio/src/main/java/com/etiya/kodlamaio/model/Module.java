package com.etiya.kodlamaio.model;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Module {
    private Long id;
    private Long courseId;
    private String title;
    private String content;
}
