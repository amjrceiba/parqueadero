//
//  Parqueadero.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI
import infraestructure

class Parqueadero: ObservableObject {
    @Published var registrosModel = [RegistroModel]()
    
    private init() { }
    
    static let shared = Parqueadero()
    
    func obtenerRegistros(){
        let registrosRepository = RegistroRepositoryRealm().obtenerRegistros()
        var registros = [RegistroModel]()
        for r in registrosRepository {
            registros.append(RegistroTranslator().domainToModel(registro: r))
        }
        registrosModel = registros
    }
}
