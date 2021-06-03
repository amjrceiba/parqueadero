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
    @State private var showingAlert = false
    
    let registroViewModel: RegistroViewModel
        
    var body: some View {
        
        Form{
            CustomStackView(titulo: "tipo", info: registroViewModel.registroModel.getTipo(), tituloFont: .body, infoFont: .body)
            CustomStackView(titulo: "Matricula", info: registroViewModel.registroModel.vehiculo.matricula, tituloFont: .body, infoFont: .body)
            
            if registroViewModel.registroModel.vehiculo is MotoModel{
                CustomStackView(titulo: "Cilindraje", info: "\((registroViewModel.registroModel.vehiculo as! MotoModel).cilindraje)", tituloFont: .body, infoFont: .body)
            }
            
            CustomStackView(titulo: "Fecha ingreso", info: "\(String().dateToString(date: registroViewModel.registroModel.fechaIngreso))", tituloFont: .body, infoFont: .caption)
            CustomStackView(titulo: "Fecha salida", info: "\(String().dateToString(date: registroViewModel.factura.getFechaSalida()))", tituloFont: .body, infoFont: .caption)
            CustomStackView(titulo: "Total", info: "$\(registroViewModel.factura.getTotal())", tituloFont: .title, infoFont: .title)
            
            Section{
                Button(action:{
                    showingAlert.toggle()
                }){
                    Text("Facturar")
                }
                .frame(maxWidth: .infinity)
            }
        }
        .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("Factura"),
                        message: Text("Factura generada con valor de $\(registroViewModel.factura.getTotal())"),
                        primaryButton: .default(Text("Aceptar")) {
                            facturar()
                        },
                        secondaryButton: .cancel(Text("Cancelar"))
                    )
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


