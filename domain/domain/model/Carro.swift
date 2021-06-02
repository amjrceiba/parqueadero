//
//  Vehiculo.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 31/05/21.
//

import Foundation

public class Carro: Vehiculo {
    
    public init(matricula: String, tipo: String) throws{
        try super.init(matricula: matricula, tipo: tipo)
    }    
}



