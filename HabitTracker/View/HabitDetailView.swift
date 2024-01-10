//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import SwiftUI

struct HabitDetailView: View {
    
    @State private var description: String = ""
    let habit: Habit
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("Enter Description", text: $description)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
        }
        .padding()
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

#Preview {
    HabitDetailView(habit: Habit(imageName: "moon.fill", title: "Hola", isSelected: false, isActive: false))
}
