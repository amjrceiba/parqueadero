//
//  domainTests.swift
//  domainTests
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 31/05/21.
//

import XCTest
@testable import domain

class domainTests: XCTestCase {


    func testExample() throws {
        XCTAssertEqual(true, true)
        
    }
    
    func testCreacionVehiculo()throws{
        
        // MARK: - Arrange
        let matricula = "abc123"
        let tipo = "carro"
        // MARK: - Act
        do{
            let vehiculo = try Carro(matricula: matricula, tipo: tipo)
            XCTAssertEqual(vehiculo.getMatricula(), "abc123")
        }
        
        // MARK: - Assert
        catch{
            XCTAssertThrowsError(error)
        }
    }
    
    func testErrorCreacionVehiculo()throws{
        // MARK: - Arrange
        let matricula = "bca123"
        let tipo = "carro"
        // MARK: - Act
        do{
            let vehiculo = try Carro(matricula: matricula, tipo: tipo)
        }
        
        // MARK: - Assert
        catch{
            XCTAssertThrowsError(error)
        }
    }

}

class RegistroRepositoryTest: RegistroRepository {
    func eliminar(registro: Registro) {
        
    }
    
    func obtenerRegistros() -> [Registro] {
        return [Registro]()
    }
    
    public init(){}
    
    public func registrar(registro: Registro) {
        
    }
}
