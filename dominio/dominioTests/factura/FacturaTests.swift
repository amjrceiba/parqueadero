//
//  FacturaTests.swift
//  domainTests
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 3/06/21.
//

import XCTest
@testable import dominio
class FacturaTests: XCTestCase {

    func testCalcularValorFactura_DatosCorrectos_ValorCorrecto() throws {        
        let vehiculo = try Carro(matricula: "bcdf123")
        let registro = try Registro(id: UUID().uuidString, fechaIngreso: Date(), vehiculo: vehiculo)
        let factura = Factura(registro: registro, fechaSalida: Date())
        factura.calcularTotal()
        
        XCTAssertEqual(factura.getTotal(), 1000)
    }

}
