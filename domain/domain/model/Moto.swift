//
//  Moto.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation

public class Moto: Vehiculo {
    
    public init(matricula: String, tipo: String, cilindraje: Int) throws{
        try super.init(matricula: matricula, tipo: tipo, cilindraje)
    }
    
}
