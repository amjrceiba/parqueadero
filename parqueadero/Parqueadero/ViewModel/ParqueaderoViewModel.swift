//
//  Parqueadero.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI
import domain
import infraestructure

class ParqueaderoViewModel: ObservableObject {
    @Published var registros = [Registro]()
    
    private init() { }
    
    static let shared = ParqueaderoViewModel()
    
    func obtenerRegistros(){
        let registroService = RegistroService(registroRepository: RegistroRepositoryRealm())
        registros = registroService.obtenerRegistros()
    }
}
