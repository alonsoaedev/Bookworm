//
//  Student.swift
//  Bookworm
//
//  Created by Alonso Acosta on 04/02/26.
//

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
