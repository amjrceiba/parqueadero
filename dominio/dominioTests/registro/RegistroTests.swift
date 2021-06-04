//
//  RegistroTests.swift
//  domainTests
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 3/06/21.
//

import XCTest
import dominio

class RegistroTests: XCTestCase {
//    testCreacionCarro_PlacaCorrecta_CreacionCorrecta
    func testCreacionRegistro_DatosCorrectos_CreacionCorrecta() throws{
        // MARK: - Arrange
        let matricula = "bbc123"
        let carro = try Carro(matricula: matricula)
        
        // MARK: - Assert
        let registro = try Registro(id: UUID().uuidString, fechaIngreso: Date(), vehiculo: carro)
        
        XCTAssertEqual(registro.getVehiculo().getMatricula(), "bbc123")
    }
    
    func testValidarMatriculaRegistro_PrefijoMatriculaA_Fallo()throws{
        // MARK: - Arrange
        let matricula = "abc123"
        let carro = try Carro(matricula: matricula)

        // MARK: - Act
        // MARK: - Assert
        XCTAssertThrowsError(try Registro(id: UUID().uuidString, fechaIngreso: Date(), vehiculo: carro))
    }
    
    func testValidarAgregarRegistro_VehiculosActualesMayorALimite_Fallo()throws{
        // MARK: - Arrange
        let matricula = "bbc123"
        let carro = try Carro(matricula: matricula)

        // MARK: - Act
        let registro = try Registro(id: UUID().uuidString, fechaIngreso: Date(), vehiculo: carro)
        // MARK: - Assert
        XCTAssertThrowsError(try registro.validarAgregar(vehiculosActuales: 20, limiteVehiculos: 10))
    }

}
