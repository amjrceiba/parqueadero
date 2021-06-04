//
//  RegistroCarroTraslator.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation
import domain
import RealmSwift

class RegistroCarroTraslator {
    func domainToEntity(registro: Registro)->RegistroCarroEntity{
        let registroEntity = RegistroCarroEntity()
        registroEntity.id = registro._id
        registroEntity.fechaIngreso = registro.getFechaIngreso()
        registroEntity.vehiculo = CarroTraslator().domainToEntity(carro: registro.getVehiculo() as! Carro)
        
        return registroEntity
    }
    
    func entityToDomain(registroEntity: RegistroCarroEntity)->Registro{
        return try! Registro(id: registroEntity.id!, fechaIngreso: registroEntity.fechaIngreso!, vehiculo: CarroTraslator().entityToDomain(vehiculoEntity: registroEntity.vehiculo!))
    }
    
    func getObjects(registrosCarrosEntities: Results<RegistroCarroEntity>)->[Registro]
    {
        var registros = [Registro]()
        
        for entity in registrosCarrosEntities {
            let registro = entityToDomain(registroEntity: entity)
            registros.append(registro)
        }
        
        return registros
    }
}
