//
//  RegistroService.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation

public class RegistroService {
    private var registroRepository: RegistroRepository
    
    public init(registroRepository: RegistroRepository) {
        self.registroRepository = registroRepository
    }
    
    public func eliminarRegistro(registro: Registro){
        registroRepository.eliminar(registro: registro)
    }
    
    public func guardarRegistro(registro: Registro) throws{
        try registroRepository.registrar(registro: registro)
    }
    
    public func obtenerRegistros()->[Registro]
    {
        registroRepository.obtenerRegistros()
    }
}
