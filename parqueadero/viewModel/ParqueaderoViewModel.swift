//
//  ParqueaderoViewModel.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI
import domain
import infraestructure

class ParqueaderoViewModel: ObservableObject {

    @Published var registrosModel = [RegistroModel]()
    
    
    func obtenerRegistros(){
        let registrosRepository = RegistroRepositoryRealm().obtenerRegistros()
        
        for r in registrosRepository {
            registrosModel.append(RegistroTranslator().domainToModel(registro: r))
        }
    }
}
