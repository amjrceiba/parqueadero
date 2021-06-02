//
//  Registro.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation

public class Registro {
    private var fechaIngreso: Date
    private var vehiculo: Vehiculo
    
    public init(fechaIngreso: Date, vehiculo: Vehiculo) throws {
        self.fechaIngreso = fechaIngreso
        self.vehiculo = vehiculo
        try validarFechaYMatricula(fechaIngreso: self.fechaIngreso, vehiculo: self.vehiculo)
    }
    
    func validarFechaYMatricula(fechaIngreso: Date, vehiculo: Vehiculo) throws{
        let dia = Calendar.current.component(.weekday, from: fechaIngreso)
        
        if (dia != 1 || dia != 2) && vehiculo.getMatricula().lowercased().hasPrefix("a"){
            throw ErroresRegistroEnum.diaIncorrecto
        }
    }
    
    public func getFechaIngreso()->Date{
        return self.fechaIngreso
    }
    
    public func getVehiculo()->Vehiculo{
        return self.vehiculo
    }
}
