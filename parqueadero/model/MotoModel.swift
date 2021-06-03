//
//  MotoModel.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation

class MotoModel: VehiculoModel {
    var cilindraje: Int
    
    init(matricula: String, cilindraje: Int) {
        self.cilindraje = cilindraje
        super.init(matricula: matricula)
    }
}
