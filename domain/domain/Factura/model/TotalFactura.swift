//
//  TotalFactura.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation

class TotalFactura {
    var registro: Registro
    var fechaSalida: Date
    
    init(registro: Registro, fechaSalida: Date) {
        self.registro = registro
        self.fechaSalida = fechaSalida
    }
    
    func calcularTotal()->Int{
        
        let direnciaFechas = Calendar.current.dateComponents([.hour], from: registro.getFechaIngreso(), to: fechaSalida)
        var horas = direnciaFechas.hour ?? 1
        if horas == 0 {horas = 1}
        var precio = 0
        let valorHora = (registro.getVehiculo() is Moto) ? Const.horaMoto : Const.horaCarro
        let valorDia = (registro.getVehiculo() is Moto) ? Const.diaMoto : Const.diaCarro
        
        if horas < 9{
            precio = horas * valorHora
        }
        else{
            var dias = horas / 24
            var horasRestantes = 0
            
            if dias <= 1
            {
                dias = 1
            }
            
            horasRestantes = horas%24
            precio += dias * valorDia
            precio += horasRestantes * valorHora
           
        }
        
        if registro.getVehiculo() is Moto && (registro.getVehiculo() as! Moto).cilindraje > 500{
            precio += Const.adicional
        }
        
        return precio
    }
}
