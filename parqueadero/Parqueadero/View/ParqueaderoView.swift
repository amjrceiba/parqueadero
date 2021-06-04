//
//  ContentView.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI
import domain
import infraestructure

struct ParqueaderoView: View {
    
    let navigationTittle = "Parqueadero"
    let toolbarButtonImagen = "car"
    let noHayVehiculosString = "No hay vehiculos"
    
    @ObservedObject var parqueadero: ParqueaderoViewModel = .shared
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            VStack{
                if parqueadero.registros.count > 0{
                    List{
                        ForEach(parqueadero.registros, id: \._id){registro in
                            NavigationLink(destination:RegistroView(registroViewModel: RegistroViewModel(registro: registro))){
                                RegistroItemView(registro: registro)
                            }
                        }
                    }
                }
                else{
                    BoldTextView(text: noHayVehiculosString)
                }
            }
            .navigationTitle(navigationTittle)
            .toolbar {
                Button(action:{showingSheet.toggle()}){
                    Image(systemName: toolbarButtonImagen)
                }
                .accessibility(identifier: "toolbarButton")
            }
        }
        .onAppear{
            parqueadero.obtenerRegistros()
        }
        .sheet(isPresented: $showingSheet) {
            AddVehiculoView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ParqueaderoView()
    }
}
