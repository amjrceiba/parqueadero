//
//  ServiceFactory.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 4/06/21.
//

import Foundation
import dominio
import infraestructura

class ServiceFactory {
    
    func obtenerRepository(tipoRepositorio: String)->RegistroRepository?{
        
        if tipoRepositorio == ""{
            return nil
        }
        
        if tipoRepositorio.uppercased() == "REPOSITORIO_REALM"{
            return RegistroRepositoryRealm()
        }
        
        return nil
    }
}
