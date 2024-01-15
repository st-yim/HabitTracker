//
//  CreateHabitView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/5/24.
//

import SwiftUI

struct CreateHabitView: View {
    
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: HabitTrackerViewModel
    @Binding var selectedImageName: String?

    @State private var newHabitTitle = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Habit Name", text: $newHabitTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                // Image picker or selection goes here...
                // For instance, use a Picker or Grid of images for selection.
                
                Button("Add") {
                    guard !newHabitTitle.isEmpty, let imageName = selectedImageName else { return }
                    viewModel.addHabit(title: newHabitTitle, imageName: imageName)
                    isPresented = false
                }
                .padding()
            }
            .padding()
            .navigationBarTitle("Create Habit", displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    isPresented = false
                }) {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
            )
        }
    }
}
#Preview {
    CreateHabitView(
        isPresented: .constant(false), // Set your desired value for isPresented
        viewModel: HabitTrackerViewModel(), // Pass an instance of your HabitTrackerViewModel
        selectedImageName: .constant("your_default_image_name") // Provide a default image name
    )
}

