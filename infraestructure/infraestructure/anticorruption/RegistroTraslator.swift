//
//  RegistroTraslator.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation
import domain

class RegistroTraslator {
    func domainToEntity(registro: Registro)->RegistroEntity{
        
        let registroEntity = RegistroEntity()
        registroEntity.fechaIngreso = registro.getFechaIngreso()
        registroEntity.vehiculo = VehiculoTraslator().domainToEntity(vehiculo: registro.getVehiculo())
        
        return registroEntity
    }
    
    func entityToDomain(registroEntity: RegistroEntity)->Registro{
        return try! Registro(fechaIngreso: registroEntity.fechaIngreso!, vehiculo: VehiculoTraslator().entityToDomain(vehiculoEntity: registroEntity.vehiculo!))
    }
}
