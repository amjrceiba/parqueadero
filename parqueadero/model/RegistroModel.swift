//
//  RegistroModel.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation

struct RegistroModel {
    var id: String
    var fechaIngreso: Date
    var vehiculo: VehiculoModel
    
    func getTipo()->String{
        return (vehiculo is MotoModel) ? "Moto" : "Carro"
    }
}
