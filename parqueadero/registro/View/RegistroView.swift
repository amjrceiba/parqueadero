//
//  RegistroView.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI
import dominio
import infraestructura

struct RegistroView: View {
    
    private let tipoString = "Tipo"
    private let matriculaString = "Matricula"
    private let cilindrajeString = "Cilindraje"
    private let fechaIngresoString = "Fecha ingreso"
    private let fechaSalidaString = "Fecha salida"
    private let totalString = "Total"
    private let alertTituloString = "Factura"
    private let alertMensajeString = "Factura generada con valor de $"
    private let alertButtonDefaultString = "Aceptar"
    private let alertButtonCancelString = "Cancelar"
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var parqueadero: ParqueaderoViewModel = .shared
    @State private var showingAlert = false
    
    let registroViewModel: RegistroViewModel
        
    var body: some View {
        
        Form{
            //CustomStackView(titulo: tipoString, info: registroViewModel.registroModel.getTipo(), tituloFont: .body, infoFont: .body)
            CustomStackView(titulo: matriculaString, info: registroViewModel.registro.getVehiculo().getMatricula(), tituloFont: .body, infoFont: .body)
            
            if registroViewModel.registro.getVehiculo() is Moto{
                CustomStackView(titulo: cilindrajeString, info: "\((registroViewModel.registro.getVehiculo() as! Moto).getCilindraje())", tituloFont: .body, infoFont: .body)
            }
            
            CustomStackView(titulo: fechaIngresoString, info: "\(String().dateToString(date: registroViewModel.registro.getFechaIngreso()))", tituloFont: .body, infoFont: .caption)
            CustomStackView(titulo: fechaSalidaString, info: "\(String().dateToString(date: registroViewModel.factura.getFechaSalida()))", tituloFont: .body, infoFont: .caption)
            CustomStackView(titulo: totalString, info: "$\(registroViewModel.factura.getTotal())", tituloFont: .title, infoFont: .title)
            
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
                        title: Text(alertTituloString),
                        message: Text("\(alertMensajeString)\(registroViewModel.factura.getTotal())"),
                        primaryButton: .default(Text(alertButtonDefaultString)) {
                            facturar()
                        },
                        secondaryButton: .cancel(Text(alertButtonCancelString))
                    )
                }
        .onAppear{
            registroViewModel.factura.calcularTotal()
        }
    }
    
    private func facturar(){       
        registroViewModel.removeRegistro()

        parqueadero.obtenerRegistros()
        presentationMode.wrappedValue.dismiss()
    }
}


