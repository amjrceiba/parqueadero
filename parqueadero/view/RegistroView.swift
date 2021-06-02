//
//  RegistroView.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI
import domain
import infraestructure

struct RegistroView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var parqueadero: Parqueadero = .shared
    
    let registroViewModel: RegistroViewModel
        
    var body: some View {
        
        Form{
            CustomStackView(titulo: "tipo", info: registroViewModel.registroModel.vehiculo.tipo)
            CustomStackView(titulo: "Matricula", info: registroViewModel.registroModel.vehiculo.matricula)
            CustomStackView(titulo: "Cilindraje", info: "\(registroViewModel.registroModel.vehiculo.cilindraje)")
            CustomStackView(titulo: "Fecha ingreso", info: "\(String().dateToString(date: registroViewModel.registroModel.fechaIngreso))")
            CustomStackView(titulo: "Fecha salida", info: "\(String().dateToString(date: registroViewModel.factura.getFechaSalida()))")
            CustomStackView(titulo: "Total", info: "\(registroViewModel.factura.getTotal())")
            
            Section{
                Button(action:{
                    facturar()
                }){
                    Text("Facturar")
                }
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear{
            registroViewModel.factura.calcularTotal()
        }

    }
    
    func facturar(){       
        registroViewModel.removeRegistro()

        parqueadero.obtenerRegistros()
        presentationMode.wrappedValue.dismiss()
    }
}


