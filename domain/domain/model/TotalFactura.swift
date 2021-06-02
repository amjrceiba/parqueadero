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
        
        let direnciaFechas = Calendar.current.dateComponents([.hour, .minute], from: registro.getFechaIngreso(), to: fechaSalida)
        let horas = direnciaFechas.hour ?? 0
        let minutos = direnciaFechas.minute ?? 0
        
        var dias = 0
        var precio = 0
                    
        print("minutos: \(minutos)")
        
        if minutos > 0 && minutos < 60{
            if registro.getVehiculo().getTipo() == "carro"{
                precio = Const.horaCarro
            }
            else{
                precio = Const.horaMoto
            }
        }

        if horas > 1 && horas <= 9{
            if registro.getVehiculo().getTipo() == "carro"{
                precio = Const.horaCarro * horas
            }
            else{
                precio = Const.horaMoto * horas
            }
        }
        else{

        }
        
        if registro.getVehiculo().getTipo() == "moto" && registro.getVehiculo().getCilindraje() > 500{
            precio += Const.adicional
        }
        
        return precio
    }
}
