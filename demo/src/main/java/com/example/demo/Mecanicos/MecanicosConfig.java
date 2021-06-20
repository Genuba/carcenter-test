package com.example.demo.Mecanicos;

import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class MecanicosConfig {
    @Bean
    CommandLineRunner commandLineRunner( MecanicosRepository repository){
           return args -> {
               Mecanicos david = new Mecanicos(
                       "CC",
                       1019143966,
                       "david",
                       "alejandro",
                       "piracoca",
                       "vargas",
                       "3107608595",
                       "Cll 16 #17-25",
                       "ing.d4vid@gmail.com",
                       "A"
               );
               Mecanicos alex = new Mecanicos(
                       "CC",
                       120938472,
                       "alex",
                       "alejandro",
                       "ramirez",
                       "robles",
                       "3107608595",
                       "Cll 16 #17-25",
                       "ing.d4vid@gmail.com",
                       "A"
               );
               Mecanicos juan = new Mecanicos(
                       "CC",
                       1928347234,
                       "juan",
                       "alejandro",
                       "ramirez",
                       "robles",
                       "3107608595",
                       "Cll 16 #17-25",
                       "ing.d4vid@gmail.com",
                       "A"
               );

               repository.saveAll(
                 List.of(david,alex,juan)
               );
           };
    }
}
