//
//  RatingView.swift
//  Bookworm
//
//  Created by Alonso Acosta on 05/02/26.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label: String = ""
    var maxRating: Int = 5
    
    var offImgae: Image?
    var onImage: Image = Image(systemName: "star.fill")
    
    var offColor: Color = .gray
    var onColor: Color = .yellow
    
    var body: some View {
        HStack {
            if !label.isEmpty {
                Text(label)
            }
            
            ForEach(1..<maxRating + 1, id: \.self) { number in
                Button {
                    rating = number
                    print("\(rating)")
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColor : onColor)
                }
            }
        }
        // this view could be in a form and in that case
        // the form will force all the buttons in the view
        // to be tapped 1...5. To avoid that
        // use the modifier .buttonStyle(.plain)
        .buttonStyle(.plain)
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImgae ?? onImage
        }
        
        return onImage
    }
}

#Preview {
    RatingView(rating: .constant(2))
}
