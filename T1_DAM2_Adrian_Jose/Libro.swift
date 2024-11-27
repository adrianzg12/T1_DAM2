//
//  Libro.swift
//  T1_DAM2_Adrian_Jose
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct Libro : Identifiable , Codable {
    let id : UUID = UUID()
    let titulo : String
    let descripcion : String
    var estado = false
}
