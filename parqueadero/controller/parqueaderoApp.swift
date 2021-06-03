//
//  parqueaderoApp.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI

@main
struct parqueaderoApp: App {
    @StateObject var parqueadero = Parqueadero.shared
    var body: some Scene {
        
        WindowGroup {
            parqueaderoView()
                .environmentObject(parqueadero)
        }
    }
}
