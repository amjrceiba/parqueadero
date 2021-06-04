//
//  RegistroItemView.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI
import dominio

struct RegistroItemView: View {
    let registro: Registro
    var body: some View {
        HStack{
            Text(registro.getVehiculo().getMatricula())
                .bold()
            Spacer()
            Text("\(String().dateToString(date: registro.getFechaIngreso()))")
                .font(.caption)
        }
    }
}

