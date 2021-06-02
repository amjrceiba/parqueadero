//
//  RegistroRepositoryRealm.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation
import domain
import RealmSwift

public class RegistroRepositoryRealm: RegistroRepository {
    
    let realm = try! Realm()
    
    public init(){}
    
    public func registrar(registro: Registro)throws {
        let registroEntity = RegistroTraslator().domainToEntity(registro: registro)

        let registros = obtenerRegistros()
        
        if registro.getVehiculo().getTipo() == "carro"{//Logica de negocio
            if registros.filter({$0.getVehiculo().getTipo() == "carro"}).count >= Const.limiteCarros {
                throw ErroresRegistroRealm.errorCarros
            }
        }
        else{
            if registros.filter({$0.getVehiculo().getTipo() == "moto"}).count >= Const.limiteMotos {
                throw ErroresRegistroRealm.errorMotos
            }
        }
            
        try! realm.write {
            realm.add(registroEntity)
        }
    }
    
    public func eliminar(registro: Registro) {
        let registroEntity = RegistroTraslator().domainToEntity(registro: registro)

        let predicate = NSPredicate(format: "fechaIngreso == %@", registroEntity.fechaIngreso! as CVarArg)
        if let r = realm.objects(RegistroEntity.self).filter(predicate).first{
            try! realm.write {
                realm.delete(r)
            }
        }
    }
    
    
    public func obtenerRegistros() -> [Registro] {
        let realm = try! Realm()
        let registrosEntities = realm.objects(RegistroEntity.self)
        
        var registros = [Registro]()
        
        for entity in registrosEntities {//Traduccion
            let registro = RegistroTraslator().entityToDomain(registroEntity: entity)
            registros.append(registro)
        }
        
        return registros
    }
}
