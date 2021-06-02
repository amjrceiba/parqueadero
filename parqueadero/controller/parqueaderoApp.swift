//
//  parqueaderoApp.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 31/05/21.
//

import SwiftUI

@main
struct parqueaderoApp: App {
    @StateObject var parqueadero = Parqueadero.shared
    var body: some Scene {
        WindowGroup {
            ParkingView()
                .environmentObject(parqueadero)
        }
    }
}
