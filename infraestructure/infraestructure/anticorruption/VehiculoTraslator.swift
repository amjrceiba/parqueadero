//
//  VehiculoTraslator.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation
import domain
class VehiculoTraslator {
    func domainToEntity(vehiculo: Vehiculo)->VehiculoEntity{
        let vehiculoEntity = VehiculoEntity()
        vehiculoEntity.cilindraje = vehiculo.getCilindraje()
        vehiculoEntity.matricula = vehiculo.getMatricula()
        vehiculoEntity.tipo = vehiculo.getTipo()
        
        return vehiculoEntity
    }
    
    func entityToDomain(vehiculoEntity: VehiculoEntity)->Vehiculo{
        return try! Vehiculo(matricula: vehiculoEntity.matricula, tipo: vehiculoEntity.tipo, vehiculoEntity.cilindraje)
    }
}
