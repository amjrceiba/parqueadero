//
//  RegistroEntity.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation
import RealmSwift

class RegistroEntity: Object {
    @objc dynamic var fechaIngreso: Date? = nil
    @objc dynamic var vehiculo: VehiculoEntity? = nil
}
