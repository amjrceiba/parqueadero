//
//  RegistroRepository.swift
//  infraestructure
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation
import domain
import RealmSwift

public class RegistroRepositoryRealm: RegistroRepository {
        
    public init(){}
    
    public func registrar(registro: Registro) throws {
        let realm = try! Realm()
        
        
        if registro.getVehiculo() is Moto{
            
            let registrosMotos = RegistroMotoTraslator().getObjects(registrosMotosEntities: realm.objects(RegistroMotoEntity.self))
            try registro.validarAgregar(count: registrosMotos.count, limite: Const.limiteMotos)
            
            try! realm.write {
                realm.add(RegistroMotoTraslator().domainToEntity(registro: registro))
            }
        }
        else{
            let registrosCarros = RegistroCarroTraslator().getObjects(registrosCarrosEntities: realm.objects(RegistroCarroEntity.self))
            try registro.validarAgregar(count: registrosCarros.count, limite: Const.limiteCarros)
            
            try! realm.write {
                realm.add(RegistroCarroTraslator().domainToEntity(registro: registro))
            }
        }
    }
    
    public func eliminar(registro: Registro) {
        let realm = try! Realm()
                
        if registro.getVehiculo() is Moto{
            let registroMotoEntity = RegistroMotoTraslator().domainToEntity(registro: registro)
            let predicate = NSPredicate(format: "id == %@", registroMotoEntity.id! as CVarArg)
            if let r = realm.objects(RegistroMotoEntity.self).filter(predicate).first{
                try! realm.write {
                    realm.delete(r)
                }
            }
        }else{
            let registroCarroEntity = RegistroCarroTraslator().domainToEntity(registro: registro)
            let predicate = NSPredicate(format: "id == %@", registroCarroEntity.id! as CVarArg)
            if let r = realm.objects(RegistroCarroEntity.self).filter(predicate).first{
                try! realm.write {
                    realm.delete(r)
                }
            }
        }
    }
    
    public func obtenerRegistros() -> [Registro] {
        let realm = try! Realm()
        var registros = [Registro]()
        
        let registrosMotos = RegistroMotoTraslator().getObjects(registrosMotosEntities: realm.objects(RegistroMotoEntity.self))
        let registrosCarros = RegistroCarroTraslator().getObjects(registrosCarrosEntities: realm.objects(RegistroCarroEntity.self))

        registros.append(contentsOf: registrosMotos)
        registros.append(contentsOf: registrosCarros)
        
        return registros
    }
}
