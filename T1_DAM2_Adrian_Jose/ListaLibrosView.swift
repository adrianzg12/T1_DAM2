//
//  ListaLibrosView.swift
//  T1_DAM2_Adrian_Jose
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct ListaLibrosView : View {
    var autor : Autor
    @State private var botonSeleccionado: Int? = nil
    let nombresBoto : [String] = ["Leido", "No leido"]
    
    @ObservedObject var modelo : ModeloAutor
    @State private var mostrarRegistro : Bool = false
    
    var body: some View {
        VStack {
            List {
                ForEach(autor.libros) { item in
                    VStack(alignment: .center) {
                        Text(autor.nombre)
                    }
                    VStack(alignment: .leading) {
                        Text(item.titulo)
                        Text(item.descripcion)
                    }
                    VStack(alignment: .trailing) {
                        ForEach(nombresBoto.indices, id: \.self) { idx in
                            Button(nombresBoto[idx]) {
                                withAnimation(.easeInOut) {
                                    if botonSeleccionado == idx && item.estado == false {
                                        //deselect
                                        botonSeleccionado = nil
                                    }else {
                                        //select
                                        botonSeleccionado = idx
                                    }
                                }
                            }
                            .padding()
                            .animation(.spring())
                            .foregroundColor(.white)
                            .colorMultiply(botonSeleccionado != nil && botonSeleccionado! == idx ? .green : .blue)
                        }
                    }
                }
            }
            .navigationTitle("Libros")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        mostrarRegistro = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $mostrarRegistro) {
                RegistroLibroView(autor: autor, modelo: modelo, mostrar: $mostrarRegistro)
            }
        }
    }
}
