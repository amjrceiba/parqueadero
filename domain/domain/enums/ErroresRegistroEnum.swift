//
//  ErroresRegistroEnum.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation

enum ErroresRegistroEnum: Error {
    case diaIncorrecto
}

extension ErroresRegistroEnum: LocalizedError{
    public var errorDescription: String?{
        switch self {
        case .diaIncorrecto:
            return NSLocalizedString(
                "Este vehiculo solo puede ingresar los dias Domingo o Lunes",
                comment: "Dida invalido"
            )
        }
    }
}
