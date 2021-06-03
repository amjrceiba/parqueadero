//
//  Factura.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation

public class Factura {
    var registro: Registro
    var fechaSalida: Date
    var total: Int?
    
    public init(registro: Registro, fechaSalida: Date) {
        self.registro = registro
        self.fechaSalida = fechaSalida
    }
    
    public func calcularTotal(){
        self.fechaSalida = Date()
        self.total = TotalFactura(registro: self.registro, fechaSalida: fechaSalida).calcularTotal()
    }
    
    public func getFechaSalida()->Date{
        return fechaSalida
    }
    
    public func getTotal()->Int{
        self.total ?? 0
    }
}
