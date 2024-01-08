//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import SwiftUI

struct HabitDetailView: View {
    
    @State var description: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("Enter Description", text: $description)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .background(Color.blue)
                    .cornerRadius(8.0)
            }
            .padding(.horizontal)
        }
        .padding()
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

#Preview {
    HabitDetailView(description: "Hello")
}
