//
//  MotoEntity.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation
import RealmSwift

class MotoEntity: Object {
    @objc dynamic var matricula = ""
    @objc dynamic var cilindraje = 0
}
