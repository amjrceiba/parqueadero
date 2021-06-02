//
//  Parqueadero.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI
import infraestructure

class Parqueadero: ObservableObject {
    var registrosArray = [RegistroModel]()
    
    private init() { }
    
    static let shared = Parqueadero()
    
    @Published var registros = [RegistroModel]()
    
    func obtenerRegistros(){
        //registros = [RegistroModel]()
        
        let registroRepository = RegistroRepositoryRealm()
        let registrosRepository = registroRepository.obtenerRegistros()
        
        registrosArray.removeAll()
        
        for registroD in registrosRepository {
            registrosArray.append(RegistroTranslator().domainToModel(registro: registroD))
        }
        
        registros = registrosArray
    }
}
