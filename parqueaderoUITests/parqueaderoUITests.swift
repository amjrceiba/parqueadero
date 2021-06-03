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

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
        
        let toolbarButton = app.toolbarButtons["toolbarButton"]
        
        toolbarButton.tap()
                
    }

    
}
