//
//  ListaAutoresView.swift
//  T1_DAM2_Adrian_Jose
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct  ListaAutoresView : View {
    
    @ObservedObject var modelo : ModeloAutor
    @State private var mostrarRegistro = false
    
    var body: some View {
        VStack {
            List {
                ForEach(modelo.autores) { item in
                    NavigationLink(destination: ListaLibrosView(autor: item, modelo: modelo)
                    ) {
                        VStack(alignment: .leading) {
                            Text(item.nombre)
                            Text(item.descripcion)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Autores")
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
                RegistroAutorView(modelo: modelo, mostrar: $mostrarRegistro)
            }
        }
    }
}

