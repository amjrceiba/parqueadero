//
//  parqueaderoUITests.swift
//  parqueaderoUITests
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import XCTest

class parqueaderoUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testAgregarVehiculo() throws {
        let app = XCUIApplication()
        app.launch()
        
        let toolbarButton = app.buttons.firstMatch
        
        toolbarButton.tap()
                
        let matriculaTextField = app.textFields["matriculaTextField"]
        matriculaTextField.tap()
        matriculaTextField.typeText("cdg123")
        
        let ingresarButton = app.buttons["ingresar"]
        ingresarButton.tap()
        
        let list = app.scrollViews.firstMatch
        
        XCTAssertTrue(list.exists)
    }
}
