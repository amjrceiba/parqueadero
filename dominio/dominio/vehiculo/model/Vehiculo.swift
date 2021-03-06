//
//  Vehiculo.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation

public class Vehiculo{
    
    private let limiteMatricula = 6
    private var matricula: String?
    
    public init(matricula: String) throws {
        try setMatricula(matricula: matricula)
    }
    
    private func setMatricula(matricula: String) throws{
        if matricula == ""{
            throw ErroresVehiculoEnum.matriculaVacia
        }
        else if matricula.count < limiteMatricula{
            throw ErroresVehiculoEnum.matriculaCorta
        }
        else{
            self.matricula = matricula
        }
    }
    
    public func getMatricula()->String{
        return matricula!
    }
}
