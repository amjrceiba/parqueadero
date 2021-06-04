//
//  CarroTraslator.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation
import dominio
class CarroTraslator {
    
    func domainToEntity(carro: Carro)->CarroEntity{
        let carroEntity = CarroEntity()
        carroEntity.matricula = carro.getMatricula()
        return carroEntity
    }
    
    func entityToDomain(vehiculoEntity: CarroEntity)->Vehiculo{
        return try! Carro(matricula: vehiculoEntity.matricula)
    }
}
