//
//  ContentView.swift
//  Bookworm
//
//  Created by Alonso Acosta on 04/02/26.
//

import SwiftUI

struct PushButton: View {
    let title: String
//    @State var isOn: Bool //uncomment to see the one way flow data effect
    @Binding var isOn: Bool
    
    var onColors: [Color] = [.red, .yellow]
    var offColors: [Color] = [.white.opacity(0.6), .white.opacity(0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(
                colors: isOn ? onColors : offColors,
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            // On this approach (one way flow of data)
            // this won't change the state of remember because
            // the rememberMe data will passed to PushButton and
            // it will take control over the state on its own view and
            // it won't pass the data back.
            // This will create two sources of truth
            // uncomment the line above to see the one way flow data effect
            PushButton(
                title: "Remember me",
//                isOn: rememberMe // One way flow of data (two sources of truth)
                isOn: $rememberMe // Two ways flow of data (onw source of truth)
            )
            Text(rememberMe ? "On" : "Off")
        }
    }
}

#Preview {
    ContentView()
}
