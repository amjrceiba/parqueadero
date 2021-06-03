//
//  RegistroItemView.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI

struct RegistroItemView: View {
    let registro: RegistroModel
    var body: some View {
        HStack{
            Text(registro.vehiculo.matricula)
                .bold()
            Spacer()
            Text("\(String().dateToString(date: registro.fechaIngreso))")
                .font(.caption)
        }
    }
}

