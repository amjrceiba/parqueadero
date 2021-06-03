//
//  ContentView.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI
import domain
import infraestructure

struct parqueaderoView: View {
    @ObservedObject var parqueadero: Parqueadero = .shared
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView{
            
            VStack{
                if parqueadero.registrosModel.count > 0{
                    List{
                        
                        ForEach(parqueadero.registrosModel, id: \.fechaIngreso){registro in
                            NavigationLink(destination:RegistroView(registroViewModel: RegistroViewModel(registroModel: registro))){
                                RegistroItemView(registro: registro)
                            }
                        }
                    }
                }
                else{
                    Text("No hay vehiculos")
                        .font(.title)
                        .bold()
                }
            }
            .navigationTitle("Parking")
            .toolbar {
                Button(action:{showingSheet.toggle()}){
                    Image(systemName: "car")
                }
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
        parqueaderoView()
    }
}
