package com.example.demo.Mecanicos;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class MecanicosService {

    private final MecanicosRepository mecanicosRepository;

    @Autowired
    public MecanicosService(MecanicosRepository mecanicosRepository) {
        this.mecanicosRepository = mecanicosRepository;
    }

    public List<Mecanicos> getMechanics(){
        return mecanicosRepository.findAll();
    }

    public void AddNewMechanic(Mecanicos mecanicos){
        Optional<Mecanicos> mechanicByDocumento = mecanicosRepository.findMechanicByDocument(mecanicos.getDocumento());
        if(mechanicByDocumento.isPresent()){
            throw new IllegalStateException("Documento Existente");
        }
        mecanicosRepository.save(mecanicos);
    }
}
