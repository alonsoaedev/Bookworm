//
//  ContentView.swift
//  Bookworm
//
//  Created by Alonso Acosta on 04/02/26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lasNames = ["Granger", "Lovegood", "Potter", "Wesley"]
                    
                    let chooseFirstName = firstNames.randomElement()!
                    let chooseLastName = lasNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chooseFirstName) \(chooseLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
