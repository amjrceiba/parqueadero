//
//  TotalFactura.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation

class TotalFactura {
    
    private let horaMoto = 500
    private let horaCarro = 1000
    private let diaMoto = 8000
    private let diaCarro = 4000
    private let adicional = 2000
    private let altoCilindraje = 500
    private let valorMinimoDia = 9
    private let valorMaximoDia = 24
    
    private var registro: Registro
    private var fechaSalida: Date
    
    init(registro: Registro, fechaSalida: Date) {
        self.registro = registro
        self.fechaSalida = fechaSalida
    }
    
    func calcularTotal()->Int{
        
        let direnciaFechas = Calendar.current.dateComponents([.hour], from: registro.getFechaIngreso(), to: fechaSalida)
        var horas = direnciaFechas.hour ?? 1
        if horas == 0 {horas = 1}
        var precio = 0
        let valorHora = (registro.getVehiculo() is Moto) ? horaMoto : horaCarro
        let valorDia = (registro.getVehiculo() is Moto) ? diaMoto : diaCarro
        
        if horas < valorMinimoDia{
            precio = horas * valorHora
        }
        else{
            var dias = horas / valorMaximoDia
            var horasRestantes = 0
            
            if dias <= 1
            {
                dias = 1
            }
            
            horasRestantes = horas%valorMaximoDia
            precio += dias * valorDia
            precio += horasRestantes * valorHora
        }
        
        if registro.getVehiculo() is Moto && (registro.getVehiculo() as! Moto).getCilindraje() > altoCilindraje{
            precio += adicional
        }
        
        return precio
    }
}
