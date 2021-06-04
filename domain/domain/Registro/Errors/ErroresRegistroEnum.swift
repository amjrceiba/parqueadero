//
//  ErroresRegistroEnum.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation

enum ErroresRegistroEnum: Error {
    case diaIncorrecto, capacidadAlcanzada
}

extension ErroresRegistroEnum: LocalizedError{
    public var errorDescription: String?{
        switch self {
        case .diaIncorrecto:
            return NSLocalizedString(
                "Este vehiculo solo puede ingresar los dias Domingo o Lunes",
                comment: "Dia invalido"
            )
        case .capacidadAlcanzada:
            return NSLocalizedString(
                "Capacidad maxima alcanzada",
                comment: "Capacidad maxima alcanzada"
            )
        }
    }
}
