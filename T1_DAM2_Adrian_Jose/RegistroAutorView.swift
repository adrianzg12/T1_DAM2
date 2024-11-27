//
//  RegistroAutorView.swift
//  T1_DAM2_Adrian_Jose
//
//  Created by DAMII on 26/11/24.
//
import SwiftUI

struct RegistroAutorView : View {
    
    @ObservedObject var modelo : ModeloAutor
    @Binding var mostrar : Bool
    @State private var nombre : String = ""
    @State private var descripcion : String = ""
    
    var body : some View {
        NavigationView {
            Form {
                TextField("Nombre", text: $nombre)
                TextField("Descripcion", text: $descripcion)
                Button("Agregar") {
                    let nuevo = Autor(
                        nombre: nombre,
                        descripcion: descripcion,
                        libros : [])
                    modelo.autores.append(nuevo)
                    mostrar = false
                }
                .disabled(nombre.isEmpty)
                .disabled(descripcion.isEmpty)
            }
            .navigationTitle("Registrar Autor")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        mostrar = false
                    }
                }
            }
        }
    }
}
