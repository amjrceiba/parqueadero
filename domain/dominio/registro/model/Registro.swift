//
//  Registro.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation

public class Registro {
    
    private let domingo = 1
    private let lunes = 2
    private let prefijoMatricula = "a"
    private let limiteCarros = 20
    private let limiteMotos = 10
    
    private var id: String
    private var fechaIngreso: Date
    private var vehiculo: Vehiculo
    
    public var _id: String{
        get {
            return self.id;
        }
    }
    
    public init(id: String, fechaIngreso: Date, vehiculo: Vehiculo) throws {
        self.id = id
        self.fechaIngreso = fechaIngreso
        self.vehiculo = vehiculo
        try validarFechaYMatricula(fechaIngreso: self.fechaIngreso, vehiculo: self.vehiculo)
    }
    
    public init(id: String, fechaIngreso: Date, vehiculo: Vehiculo, vehiculosActuales: Int) throws {
        self.id = id
        self.fechaIngreso = fechaIngreso
        self.vehiculo = vehiculo
        try validarFechaYMatricula(fechaIngreso: self.fechaIngreso, vehiculo: self.vehiculo)
        try validarAgregar(vehiculosActuales: vehiculosActuales, limiteVehiculos: vehiculo is Moto ? limiteMotos : limiteCarros)
    }
    
    private func validarFechaYMatricula(fechaIngreso: Date, vehiculo: Vehiculo) throws{
        let dia = Calendar.current.component(.weekday, from: fechaIngreso)
        
        if (dia != domingo || dia != lunes) && vehiculo.getMatricula().lowercased().hasPrefix(prefijoMatricula){
            throw ErroresRegistroEnum.diaIncorrecto
        }
    }
    
    public func validarAgregar(vehiculosActuales: Int, limiteVehiculos: Int)throws{
        if vehiculosActuales >= limiteVehiculos{
            throw ErroresRegistroEnum.capacidadAlcanzada
        }
    }
    
    public func getFechaIngreso()->Date{
        return self.fechaIngreso
    }
    
    public func getVehiculo()->Vehiculo{
        return self.vehiculo
    }
}
