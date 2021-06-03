//
//  Registro.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation

public class Registro {
    private var id: String 
    private var fechaIngreso: Date
    private var vehiculo: Vehiculo
    
    public init(id: String, fechaIngreso: Date, vehiculo: Vehiculo) throws {
        self.id = id
        self.fechaIngreso = fechaIngreso
        self.vehiculo = vehiculo
        try validarFechaYMatricula(fechaIngreso: self.fechaIngreso, vehiculo: self.vehiculo)
    }
    
    private func validarFechaYMatricula(fechaIngreso: Date, vehiculo: Vehiculo) throws{
        let dia = Calendar.current.component(.weekday, from: fechaIngreso)
        
        if (dia != 1 || dia != 2) && vehiculo.getMatricula().lowercased().hasPrefix("a"){
            throw ErroresRegistroEnum.diaIncorrecto
        }
    }
    
    public func validarAgregar(count: Int, limite: Int)throws{
        if count >= limite{
            throw ErroresRegistroEnum.capacidadAlcanzada
        }
    }
    
    public func getId()->String{
        return id
    }
    
    public func getFechaIngreso()->Date{
        return self.fechaIngreso
    }
    
    public func getVehiculo()->Vehiculo{
        return self.vehiculo
    }
}
