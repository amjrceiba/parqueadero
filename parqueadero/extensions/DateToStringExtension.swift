//
//  DateToStringExtension.swift
//  parqueadero
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 1/06/21.
//

import Foundation

extension String{
    func dateToString(date: Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd - HH:mm"
        return dateFormatter.string(from: date)
    }
}
