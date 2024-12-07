package com.example.adminservice.model;
import jakarta.persistence.*;

@Entity
public class Job {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // This ensures the ID is auto-generated.
    private Long id;
    
    private String designation;
    private String description;
    private int experience;
    private double percentage12th;
    private double graduationGPA;
    private int numberOfSeats;
    private double salaryPackage;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public double getPercentage12th() {
        return percentage12th;
    }

    public void setPercentage12th(double percentage12th) {
        this.percentage12th = percentage12th;
    }

    public double getGraduationGPA() {
        return graduationGPA;
    }

    public void setGraduationGPA(double graduationGPA) {
        this.graduationGPA = graduationGPA;
    }

    public int getNumberOfSeats() {
        return numberOfSeats;
    }

    public void setNumberOfSeats(int numberOfSeats) {
        this.numberOfSeats = numberOfSeats;
    }

    public double getSalaryPackage() {
        return salaryPackage;
    }

    public void setSalaryPackage(double salaryPackage) {
        this.salaryPackage = salaryPackage;
    }

    
}
