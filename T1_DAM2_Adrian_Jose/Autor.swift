//
//  Autor.swift
//  T1_DAM2_Adrian_Jose
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct Autor : Identifiable, Codable {
    
    let id : UUID = UUID()
    let nombre : String
    let descripcion : String
    var libros : [Libro]
}
