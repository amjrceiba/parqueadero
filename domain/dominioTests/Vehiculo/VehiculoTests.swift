//
//  VehiculoTests.swift
//  domainTests
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 3/06/21.
//

import XCTest

class VehiculoTests: XCTestCase {
    
    func testCreacionCarro_PlacaCorrecta_CreacionCorrecta() throws {
        let matricula = "abc123"
        
        let carro = try Carro(matricula: matricula)
        
        XCTAssertEqual(carro.getMatricula(), "abc123")
    }
    
    func testCreacionMoto_PlacaCorrecta_CreacionCorrecta() throws {
        let matricula = "abc123"
        let cilindraje = 600
        
        let moto = try Moto(matricula: matricula, cilindraje: cilindraje)
        
        XCTAssertEqual(moto.getMatricula(), "abc123")
    }
    
    func testCreacionCarro_PlacaCantidadCaracteresMenor6_Fallo() throws {
        let matricula = "abc12"
        
        XCTAssertThrowsError(try Carro(matricula: matricula))
    }
    
    func testCreacionMoto_PlacaCantidadCaracteresMenor6_Fallo() throws {
        let matricula = "abc12"
        let cilindraje = 600
        
        XCTAssertThrowsError(try Moto(matricula: matricula, cilindraje: cilindraje))
    }
    
}
