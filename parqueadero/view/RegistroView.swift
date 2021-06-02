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
            CustomStackView(titulo: "tipo", info: registroViewModel.registroModel.vehiculo.tipo, tituloFont: .body, infoFont: .body)
            CustomStackView(titulo: "Matricula", info: registroViewModel.registroModel.vehiculo.matricula, tituloFont: .body, infoFont: .body)
            CustomStackView(titulo: "Cilindraje", info: "\(registroViewModel.registroModel.vehiculo.cilindraje)", tituloFont: .body, infoFont: .body)
            CustomStackView(titulo: "Fecha ingreso", info: "\(String().dateToString(date: registroViewModel.registroModel.fechaIngreso))", tituloFont: .body, infoFont: .body)
            CustomStackView(titulo: "Fecha salida", info: "\(String().dateToString(date: registroViewModel.factura.getFechaSalida()))", tituloFont: .body, infoFont: .body)
            CustomStackView(titulo: "Total", info: "\(registroViewModel.factura.getTotal())", tituloFont: .title, infoFont: .title)
            
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


