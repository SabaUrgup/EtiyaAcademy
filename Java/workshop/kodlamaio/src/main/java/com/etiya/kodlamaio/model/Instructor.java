package com.etiya.kodlamaio.model;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Instructor {
    private Long id;
    private String name;
    private String bio;
    private String email;
}
