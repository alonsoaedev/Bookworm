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
    
    @State private var book = Book(
        title: "",
        author: "",
        genre: "Fantasy",
        review: "",
        rating: 3
    )
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $book.title)
                    TextField("Author's name", text: $book.author)
                    
                    Picker("Genre", selection: $book.genre) {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $book.review)
                    RatingView(rating: $book.rating)
                }
                
                Section {
                    Button("Save") {
                        modelContext.insert(book)
                        dismiss()
                    }
                }
                .disabled(book.isEmpty)
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
