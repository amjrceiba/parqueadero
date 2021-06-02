//
//  AddVehicleView.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import SwiftUI

struct AddVehicleView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var parqueadero: Parqueadero = .shared
    @ObservedObject var addVehicleViewModel = AddVehicleViewModel()
    @State private var matricula: String = ""
    @State var selection: TipoVehiculo = .Carro
    @State var cilindraje: String = ""
    
    var body: some View {
        
        Form{
            Section{
                TextField("Matricula", text: $matricula)
                    .keyboardType(.asciiCapable)
                
                Picker("Tipo de vehiculo", selection: $selection) {
                    ForEach(TipoVehiculo.allCases, id: \.self) { value in
                        Text(value.rawValue)
                    }
                }
                
                if selection == .Moto{
                    TextField("Cilindraje", text: $cilindraje)
                        .keyboardType(.numberPad)
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
        .alert(isPresented: $addVehicleViewModel.showAlert) {
            Alert(
                title: Text("Alert"),
                message: Text(addVehicleViewModel.errorMessage)
            )
        }

    }
    
    func agregarRegistro(){
        addVehicleViewModel.addVehicle(matricula: matricula, cilindraje: Int(cilindraje) ?? 0, tipoVehiculo: selection)
        //parqueadero.obtenerRegistros()
        //presentationMode.wrappedValue.dismiss()
    }
}



enum TipoVehiculo: String, CaseIterable  {
    case Moto, Carro
}
