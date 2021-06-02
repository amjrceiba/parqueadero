//
//  ParkingViewModel.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation
import domain
import infraestructure

class ParkingViewModel: ObservableObject {
    @Published var registros = [RegistroModel]()
    
    init() {
        obtenerRegistros()
    }
    
    func obtenerRegistros(){
        let registroRepository = RegistroRepositoryRealm()
        let registrosRepository = registroRepository.obtenerRegistros()
        
        registros = [RegistroModel]()
        
        for registroD in registrosRepository {
            registros.append(RegistroTranslator().domainToModel(registro: registroD))
        }
    }
}
