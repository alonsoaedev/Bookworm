//
//  ContentView.swift
//  Bookworm
//
//  Created by Alonso Acosta on 04/02/26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("Bookworm__notes") private var notes = ""
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("TextField y TextEditor (no form)") {
                    Text("Text Editor")
                    TextEditor(text: $notes)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Text Field (horizontal)")
                    TextField("Enter your text", text: $notes)
                        .textFieldStyle(.roundedBorder)
                    
                    Text("Text Field (vertical)")
                    TextField("Enter your text", text: $notes, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                }
                
                NavigationLink("TextField y TextEditor (form)") {
                    Form {
                        Text("Text Editor")
                        TextEditor(text: $notes)
                            .textFieldStyle(.roundedBorder)
                        
                        Text("Text Field (horizontal)")
                        TextField("Enter your text", text: $notes)
                            .textFieldStyle(.roundedBorder)
                        
                        Text("Text Field (vertical)")
                        TextField("Enter your text", text: $notes, axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                    }
                }
            }
            .navigationTitle("")
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
