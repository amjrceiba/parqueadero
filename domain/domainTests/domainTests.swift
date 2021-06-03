//
//  domainTests.swift
//  domainTests
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import XCTest
@testable import domain

class domainTests: XCTestCase {

//MARK: - Pruebas Vehiculo
    func testCreacionCarro() throws {
        // MARK: - Arrange
        let matricula = "abc123"
        
        // MARK: - Act
        
        let carro = try Carro(matricula: matricula)
        // MARK: - Assert
        XCTAssertEqual(carro.getMatricula(), "abc123")
    }
    
    func testCreacionMoto() throws {
        // MARK: - Arrange
        let matricula = "abc123"
        let cilindraje = 600
        
        // MARK: - Act
        
        let moto = try Moto(matricula: matricula, cilindraje: cilindraje)
        // MARK: - Assert
        XCTAssertEqual(moto.getMatricula(), "abc123")
    }
    
    func testCreacionCarroFallo() throws {
        // MARK: - Arrange
        let matricula = "abc12"
        
        // MARK: - Assert
        XCTAssertThrowsError(try Carro(matricula: matricula))
    }
    
    func testCreacionMotoFallo() throws {
        // MARK: - Arrange
        let matricula = "abc12"
        let cilindraje = 600
        // MARK: - Assert
        XCTAssertThrowsError(try Moto(matricula: matricula, cilindraje: cilindraje))
    }
    
//MARK: - Pruebas Registro
    
    func testCreacionRegistro() throws{
        // MARK: - Arrange
        let matricula = "bbc123"
        let carro = try Carro(matricula: matricula)
        // MARK: - Act
        
        let registro = try Registro(fechaIngreso: Date(), vehiculo: carro)
        print(registro.getId())
        XCTAssertEqual(registro.getVehiculo().getMatricula(), "bbc123")
    }
    
}
