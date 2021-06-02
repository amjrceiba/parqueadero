//
//  VehiculoTranslator.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation
import domain
struct VehiculoTranslator {
    func domainToModel(vehiculo: Vehiculo)->VehiculoModel{
        return VehiculoModel(matricula: vehiculo.getMatricula(), cilindraje: vehiculo.getCilindraje(), tipo: vehiculo.getTipo())
    }
    
    func modelToDomain(vehiculoModel: VehiculoModel)->Vehiculo{
        return try! Vehiculo(matricula: vehiculoModel.matricula, tipo: vehiculoModel.tipo, vehiculoModel.cilindraje)
    }
}
