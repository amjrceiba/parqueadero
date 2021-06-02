//
//  Vehiculo.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation

public class Vehiculo {
    private var matricula: String?
    private var cilindraje: Int?
    private var tipo: String?
    
    public init(matricula: String, tipo: String, _ cilindraje: Int? = 0) throws {
        try setMatricula(matricula: matricula)
        self.cilindraje = cilindraje
        self.tipo = tipo
    }
    
    private func setMatricula(matricula: String) throws{
        if matricula == ""{
            throw ErroresVehiculoEnum.matriculaVacia
        }
        else if matricula.count < 6{
            throw ErroresVehiculoEnum.matriculaCorta
        }
        else{
            self.matricula = matricula
        }
    }
    
    public func getMatricula()->String{return self.matricula!}
    
    public func getCilindraje()->Int{return self.cilindraje!}
    
    public func getTipo()->String{return self.tipo!}
}
