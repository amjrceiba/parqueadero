//
//  ErroresVehiculoEnum.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation

enum ErroresVehiculoEnum: Error {
    case matriculaVacia, matriculaCorta
}

extension ErroresVehiculoEnum: LocalizedError{
    public var errorDescription: String?{
        switch self {
        case .matriculaVacia:
            return NSLocalizedString(
                "La matricula esta vacia",
                comment: "Matricula invalida"
            )
            
        case .matriculaCorta:
            return NSLocalizedString(
                "La matricula debe de ser de 6 caracteres",
                comment: "Matricula invalida"
            )
        }
    }
}
