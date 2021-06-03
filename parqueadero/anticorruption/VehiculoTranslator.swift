//
//  VehiculoTranslator.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation
import domain
class VehiculoTranslator {
    
    func domainToModel(vehiculo: Vehiculo)->VehiculoModel{
        if vehiculo is Moto{
            let vehiculoModel = MotoModel(matricula: vehiculo.getMatricula(), cilindraje: (vehiculo as! Moto).getCilindraje())
            return vehiculoModel
        }
        let vehiculoModel = CarroModel(matricula: vehiculo.getMatricula())
        return vehiculoModel
    }
    
    func modelToDomain(vehiculoModel: VehiculoModel)->Vehiculo{
        if vehiculoModel is MotoModel{
            return try! Moto(matricula: vehiculoModel.matricula, cilindraje: (vehiculoModel as! MotoModel).cilindraje)
        }
        
        return try! Carro(matricula: vehiculoModel.matricula)
    }
}
