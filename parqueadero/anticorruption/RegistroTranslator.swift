//
//  RegistroTranslator.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation
import domain

class RegistroTranslator  {
    func domainToModel(registro: Registro)->RegistroModel{
        return RegistroModel(fechaIngreso: registro.getFechaIngreso(), vehiculo: VehiculoTranslator().domainToModel(vehiculo: registro.getVehiculo()))
    }
    
    func modelToDomain(registroModel: RegistroModel)->Registro{
        return try! Registro(fechaIngreso: registroModel.fechaIngreso, vehiculo: VehiculoTranslator().modelToDomain(vehiculoModel: registroModel.vehiculo))
    }
}
