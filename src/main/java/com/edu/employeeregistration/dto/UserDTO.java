package com.edu.employeeregistration.dto;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "users")
@Data
public class UserDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;  

    @Column(nullable = false)
    private String name;  
    
    @Column(nullable = false)
    private String dateOfBirth;

    @Column(nullable = false)
    private String gender;  

    @Column(nullable = false)
    private String address;  

    @Column(nullable = false)
    private String city;  

    @Column(nullable = false)
    private String state;  

    @Column(nullable = false, unique = true)
    private String loginId;  

    @Column(nullable = false)
    private String password;  
}
