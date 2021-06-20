package com.example.demo.Mecanicos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MecanicosRepository
        extends JpaRepository<Mecanicos,Long> {

    @Query("SELECT m FROM mecanicos m WHERE m.documento = ?1")
    Optional<Mecanicos> findMechanicByDocument(int documento);
}
