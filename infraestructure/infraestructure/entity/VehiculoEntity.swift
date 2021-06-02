//
//  VehiculoEntity.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation
import RealmSwift

class VehiculoEntity: Object {
    @objc dynamic var matricula = ""
    @objc dynamic var cilindraje = 0
    @objc dynamic var tipo = ""
}
