//
//  AddVehiculoViewModel.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import Foundation
import dominio
import infraestructura

class AddVehiculoViewModel: ObservableObject {
    
    private let tipoRepositorio = "REPOSITORIO_REALM"
    
    @Published var showAlert = false
    @Published var errorMessage = ""
    
    func addVehicle(matricula: String, cilindraje: Int, tipoVehiculo: TipoVehiculo, completion: @escaping()->Void){
        do{
            let date = Date()
            let vehiculo = try crearVehiculo(matricula: matricula.lowercased(), tipoVehiculo: tipoVehiculo, cilindraje)
            
            let registro = try Registro(id: UUID().uuidString,fechaIngreso: date, vehiculo: vehiculo, vehiculosActuales: obtenerCapacidad(tipoVehiculo: tipoVehiculo))
            
            let repositorio = ServiceFactory().obtenerRepository(tipoRepositorio: tipoRepositorio)
            try repositorio?.registrar(registro: registro)
            
            completion()
        }
        catch{
            showAlert = true
            errorMessage = "\(error.localizedDescription)"
        }
    }
    
    func crearVehiculo(matricula:String, tipoVehiculo: TipoVehiculo, _ cilindraje: Int = 0) throws ->Vehiculo{
        var vehiculo: Vehiculo
        switch tipoVehiculo {
        case .Carro:
            vehiculo = try Carro(matricula: matricula)
        case .Moto:
            vehiculo = try Moto(matricula: matricula, cilindraje: cilindraje)
        }
        
        return vehiculo
    }
    
    func obtenerCapacidad(tipoVehiculo: TipoVehiculo)->Int{
        var capacidad = 0
        switch tipoVehiculo {
        case .Carro:
            capacidad = RegistroRepositoryRealm().getCarrosCount()
        case .Moto:
            capacidad = RegistroRepositoryRealm().getMotosCount()
        }
        return capacidad
    }
}
