//
//  ErroresRegistroRealm.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation

enum ErroresRegistroRealm {
    case errorCarros, errorMotos
}

extension ErroresRegistroRealm: LocalizedError{
    public var errorDescription: String?{
        switch self {
        case .errorCarros:
            return NSLocalizedString(
                "Ya hay suficientes carros",
                comment: "Numero de vehiculo alcanzado"
            )
            
        case .errorMotos:
            return NSLocalizedString(
                "Ya hay suficientes motos",
                comment: "Numero de vehiculo alcanzado"
            )
        }
    }
}
