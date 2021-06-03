//
//  AddVehiculoView.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI

struct AddVehiculoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var addVehiculoViewModel = AddVehiculoViewModel()
    
    @ObservedObject private var matricula = TextLimiter(limit: 6)
    @State var tipoVehiculoSeleccionado: TipoVehiculo = .Carro
    @ObservedObject var parqueadero: Parqueadero = .shared
    
    let cilindrajes = [100, 200, 300, 400, 500, 600, 1000]
    @State var cilindrajeSeleccionado: Int = 100
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Ingresar vehiculo")
                .font(.title)
                .bold()
                .padding()
        }
        
        Form{
            Section{
                TextField("Matricula", text: $matricula.value)
                    .keyboardType(.asciiCapable)
                
                Picker("Tipo de vehiculo", selection: $tipoVehiculoSeleccionado) {
                    ForEach(TipoVehiculo.allCases, id: \.self) { value in
                        Text(value.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            if tipoVehiculoSeleccionado == .Moto{
                Section(header: Text("Cilindraje")){
                    Picker("Cilindraje", selection: $cilindrajeSeleccionado) {
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
                    Text("Ingresar")
                }
                .frame(maxWidth: .infinity)
            }
        }
        .alert(isPresented: $addVehiculoViewModel.showAlert) {
            Alert(
                title: Text("Alert"),
                message: Text(addVehiculoViewModel.errorMessage)
            )
        }
        
        Spacer()
    }
    
    func agregarRegistro(){
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

