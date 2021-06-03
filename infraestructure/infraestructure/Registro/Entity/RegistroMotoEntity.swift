//
//  RegistroEntity.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation
import RealmSwift

class RegistroMotoEntity: Object {
    @objc dynamic var id: String? = ""
    @objc dynamic var fechaIngreso: Date? = nil
    @objc dynamic var vehiculo: MotoEntity? = nil
}
