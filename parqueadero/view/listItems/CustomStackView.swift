//
//  CustomStackView.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 2/06/21.
//

import SwiftUI

struct CustomStackView: View {
    
    let titulo: String
    let info: String
    let tituloFont: Font
    let infoFont: Font
    
    var body: some View {
        HStack{
            Text(titulo)
                .font(tituloFont)
                .bold()
            Spacer()
            
            Text(info).font(infoFont)
        }
    }
}

