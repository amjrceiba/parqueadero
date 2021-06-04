//
//  RegistroRepository.swift
//  domain
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation

public protocol RegistroRepository {
    func registrar(registro: Registro)throws
    func eliminar(registro: Registro)
    func obtenerRegistros()->[Registro]
    func obtenerCantidadRegistrosCarro()->Int
    func obtenerCantidadRegistrosMoto()->Int
}
