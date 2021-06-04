//
//  BoldText.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 3/06/21.
//

import SwiftUI

struct BoldTextView: View {
    let text: String
    var body: some View {
        Text(text)
            .bold()
    }
}
