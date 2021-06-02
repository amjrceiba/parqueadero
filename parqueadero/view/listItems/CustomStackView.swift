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
    
    var body: some View {
        HStack{
            Text(titulo)
                .bold()
            Spacer()
            
            Text(info)
                
        }
    }
}

