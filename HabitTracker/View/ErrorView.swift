//
//  ErrorView.swift
//  HabitTracker
//
//  Created by Purvesh Dodiya on 06/01/24.
//

import SwiftUI

struct ErrorView: View {
    
    let message: String
    let onClose: () -> Void

    var body: some View {
        VStack {
            Text(message)
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .cornerRadius(8.0)

            Spacer()
        }
        .onTapGesture {
            // Close the error message when tapped
            onClose()
        }
        .padding()
    }
}

#Preview {
    ErrorView(message: "", onClose: {})
}
