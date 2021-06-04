//
//  Moto.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation

public class Moto: Vehiculo{
    private var cilindraje: Int
    
    public init(matricula: String, cilindraje: Int) throws {
        self.cilindraje = cilindraje
        try super.init(matricula: matricula)
    }
    
    public func getCilindraje()->Int{
        return cilindraje
    }
}
