package com.example.adminservice.model;

import jakarta.persistence.Column;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "admin_table")
public class Admin {

    @Id
    @Column(name = "admin_username", length = 50)
    private String username;

    @Column(name = "admin_password", length = 100, nullable = false)  // Increased length to 100 for passwords
    private String password;

    // Default constructor (Required by JPA)
    public Admin() {}

    // Parameterized constructor
    public Admin(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // Getters and Setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin [username=" + username + ", password=" + password + "]";
    }
}
