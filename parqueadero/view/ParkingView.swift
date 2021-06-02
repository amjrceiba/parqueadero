//
//  ContentView.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 31/05/21.
//

import SwiftUI
import domain
import infraestructure

struct ParkingView: View {
    @ObservedObject var parqueadero: Parqueadero = .shared
    
    var body: some View {
        NavigationView{
            List{
                ForEach(parqueadero.registros, id: \.fechaIngreso){ registro in
                    NavigationLink(destination: RegistroView(registroViewModel: RegistroViewModel(registroModel: registro))){
                        RegistroItemView(registro: registro)
                    }
                }
            }
            .listStyle(DefaultListStyle())
            .navigationTitle("Parking")
            .toolbar {
                NavigationLink(destination: AddVehicleView()) {
                    Image(systemName: "car")
                }
            }
        }
        .onAppear{
            parqueadero.obtenerRegistros()
        }
        
    }
}
