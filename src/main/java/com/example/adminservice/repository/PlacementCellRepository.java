package com.example.adminservice.repository;
import com.example.adminservice.model.PlacementCell;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface PlacementCellRepository extends JpaRepository<PlacementCell, Long> {
    // JpaRepository provides built-in methods like findAll()


    @Query("SELECT a FROM PlacementCell a WHERE a.email = ?1 AND a.password = ?2")
    PlacementCell checkPlacementCellLogin(String email, String password);
}
