//
//  RegistroLibroView.swift
//  T1_DAM2_Adrian_Jose
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct RegistroLibroView : View {
    var autor : Autor
    @ObservedObject var modelo : ModeloAutor
    @Binding var mostrar : Bool
    @State private var titulo : String = ""
    @State private var descripcion : String = ""
    
    var body : some View {
        NavigationView {
            Form {
                TextField("Titulo", text: $titulo)
                TextField("Descripcion", text: $descripcion)
                Button("Agregar") {
                    if let index = modelo.autores.firstIndex(where: { $0.id == autor.id}) {
                        let nuevo = Libro(titulo: titulo,
                                          descripcion: descripcion)
                        modelo.autores[index].libros.append(nuevo)
                    }
                    mostrar = false
                }
                .disabled(titulo.isEmpty)
                .disabled(descripcion.isEmpty)
            }
            .navigationTitle("Registrar Libro")
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
