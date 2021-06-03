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
       
    @Published var registroModel: RegistroModel
    @Published var factura: Factura

    init(registroModel: RegistroModel) {
        self.registroModel = registroModel
        self.factura = Factura(registro: RegistroTranslator().modelToDomain(registroModel: registroModel), fechaSalida: Date())        
    }
    
    func removeRegistro(){
        let registro = RegistroTranslator().modelToDomain(registroModel: registroModel)
        let registroRepository = RegistroRepositoryRealm()
        let registroService = RegistroService(registroRepository: registroRepository)
        registroService.eliminarRegistro(registro: registro)
    }
}
