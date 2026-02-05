//
//  AddBookView.swift
//  Bookworm
//
//  Created by Alonso Acosta on 05/02/26.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var rating: Int = 3
    @State private var genre: String = "Fantasy"
    @State private var review: String = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    
                    Picker("rating", selection: $rating) {
                        ForEach(0..<6) { rate in
                            Text("\(rate)")
                        }
                    }
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(
                            title: title,
                            author: author,
                            genre: genre,
                            review: review,
                            rating: rating
                        )
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
