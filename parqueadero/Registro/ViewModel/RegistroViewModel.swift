//
//  RegistroViewModel.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation
import domain
import infraestructure

class RegistroViewModel: ObservableObject {
       
    @Published var registro: Registro
    @Published var factura: Factura

    init(registro: Registro) {
        self.registro = registro
        self.factura = Factura(registro: registro, fechaSalida: Date())
    }
    
    func removeRegistro(){
        let registroRepository = RegistroRepositoryRealm()
        let registroService = RegistroService(registroRepository: registroRepository)
        registroService.eliminarRegistro(registro: registro)
    }
}
