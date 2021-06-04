//
//  RegistroTraslator.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation
import dominio
import RealmSwift

class RegistroMotoTraslator {
    func domainToEntity(registro: Registro)->RegistroMotoEntity{
        let registroEntity = RegistroMotoEntity()
        registroEntity.id = registro._id
        registroEntity.fechaIngreso = registro.getFechaIngreso()
        registroEntity.vehiculo = MotoTraslator().domainToEntity(moto: registro.getVehiculo() as! Moto)
        
        return registroEntity
    }
    
    func entityToDomain(registroEntity: RegistroMotoEntity)->Registro{
        return try! Registro(id: registroEntity.id!, fechaIngreso: registroEntity.fechaIngreso!, vehiculo: MotoTraslator().entityToDomain(vehiculoEntity: registroEntity.vehiculo!))
    }
    
    func getObjects(registrosMotosEntities: Results<RegistroMotoEntity>)->[Registro]
    {
        var registros = [Registro]()
        
        for entity in registrosMotosEntities {
            let registro = entityToDomain(registroEntity: entity)
            registros.append(registro)
        }
        
        return registros
    }
}
