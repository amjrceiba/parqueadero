//
//  AddVehiculoView.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI

struct AddVehiculoView: View {
    
    private let tituloString = "Ingresar vehiculo"
    private let matriculaString = "Matricula"
    private let tipoVehiculoString = "Tipo de vehiculo"
    private let cilindrajeString = "Cilindraje"
    private let ingresarButtonString = "Ingresar"
    private let tituloAlertaString = "Alerta"
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var addVehiculoViewModel = AddVehiculoViewModel()
    
    @ObservedObject private var matricula = TextLimiter(limit: 6)
    @State var tipoVehiculoSeleccionado: TipoVehiculo = .Carro
    @ObservedObject var parqueadero: ParqueaderoViewModel = .shared
    
    @State var cilindrajeSeleccionado: Int = 100
    private let cilindrajes = [125, 250, 500, 650, 900, 1000]
   
    var body: some View {
        VStack(alignment: .leading){
            Text(tituloString)
                .font(.title)
                .bold()
                .padding()
        }
        
        Form{
            Section{
                TextField(matriculaString, text: $matricula.value)
                    .keyboardType(.asciiCapable)
                    .accessibility(identifier: "matriculaTextField")
                
                Picker(tipoVehiculoString, selection: $tipoVehiculoSeleccionado) {
                    ForEach(TipoVehiculo.allCases, id: \.self) { value in
                        Text(value.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            if tipoVehiculoSeleccionado == .Moto{
                Section(header: Text(cilindrajeString)){
                    Picker(cilindrajeString, selection: $cilindrajeSeleccionado) {
                        ForEach(cilindrajes, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            
            Section{
                Button(action:{
                    agregarRegistro()
                }){
                    Text(ingresarButtonString)
                }
                .frame(maxWidth: .infinity)
                .accessibility(identifier: "ingresar")
            }
            
        }
        .alert(isPresented: $addVehiculoViewModel.showAlert) {
            Alert(
                title: Text(tituloAlertaString),
                message: Text(addVehiculoViewModel.errorMessage)
            )
        }
        Spacer()
    }
    
    private func agregarRegistro(){
        addVehiculoViewModel.addVehicle(matricula: matricula.value, cilindraje: cilindrajeSeleccionado, tipoVehiculo: tipoVehiculoSeleccionado) {
            parqueadero.obtenerRegistros()
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddVehiculoView_Previews: PreviewProvider {
    static var previews: some View {
        AddVehiculoView()
    }
}

enum TipoVehiculo: String, CaseIterable  {
    case Carro, Moto
}

