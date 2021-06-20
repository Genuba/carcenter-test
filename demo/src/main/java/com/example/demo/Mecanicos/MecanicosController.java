package com.example.demo.Mecanicos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "api/v1/mechanic")
public class MecanicosController {

    private final MecanicosService mecanicosService;

    @Autowired
    public MecanicosController(MecanicosService mecanicosService) {
        this.mecanicosService = mecanicosService;
    }

    @GetMapping
    public List<Mecanicos> getMechanics(){ return mecanicosService.getMechanics(); }

    @PostMapping
    public void registerNewMechanic(@RequestBody Mecanicos mecanicos) {
        mecanicosService.AddNewMechanic(mecanicos);
    }
}
