//
//  MotoTraslator.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation
import dominio

class MotoTraslator {
    
    func domainToEntity(moto: Moto)->MotoEntity{
        let motoEntity = MotoEntity()
        motoEntity.matricula = moto.getMatricula()
        motoEntity.cilindraje = moto.getCilindraje()
        return motoEntity
    }
    
    func entityToDomain(vehiculoEntity: MotoEntity)->Vehiculo{
        return try! Moto(matricula: vehiculoEntity.matricula, cilindraje: vehiculoEntity.cilindraje)
    }
}
