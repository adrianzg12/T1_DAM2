//
//  ContentView.swift
//  T1_DAM2_Adrian_Jose
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

class ModeloAutor : ObservableObject {
    
    @Published var autores : [Autor] = [
        /*Autor(nombre: "Jose Lagos", descripcion: "T1", libros: [
            Libro(titulo: "Comunicacion", descripcion: "Test")]),
        Autor(nombre: "Adrian Llontop", descripcion: "T1", libros: [
            Libro(titulo: "Aritmetica", descripcion: "Test")])*/
        ]
        {
        
        didSet {
            guardarDatos()
        }
    }
        init() {
            cargarDatos()
        }
        
        public func archivo() -> URL {
            let documentos = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            return documentos.appendingPathComponent("autores.json")
            
        }
        
        public func guardarDatos() {
            do {
                let datos = try JSONEncoder().encode(autores)
                try datos.write(to: archivo())
            } catch {
                print("Error")
            }
        }
        
        public func cargarDatos() {
            do {
                let datos = try Data(contentsOf: archivo())
                autores = try JSONDecoder().decode([Autor].self, from: datos)
            } catch {
                print("Error")
            }
        }
    }

struct ContentView: View {
    @StateObject private var modelo : ModeloAutor = ModeloAutor()
    
    var body: some View {
        NavigationView {
            ListaAutoresView(modelo: modelo)
        }
    }
}



