//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import SwiftUI

struct HabitDetailView: View {
    
    @StateObject var viewModel: HabitDetailViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                
                TextEditor(text: $viewModel.habitDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                    .frame(maxHeight: 400)
                
                if viewModel.habitDescription.isEmpty {
                    Text("Enter Description")
                        .foregroundColor(Color(UIColor.placeholderText))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 16)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: 1) // inset value should be same as lineWidth in .stroke
                    .stroke(.gray, lineWidth: 1)
            )
            .frame(maxWidth: .infinity)
            
            
            Button(action: {
                viewModel.updateDescription()
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
        .onAppear {
            viewModel.setUpDescription()
        }
        .padding()
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

#Preview {
    HabitDetailView(viewModel: .init(habit: Habit(id: UUID(), imageName: "", title: "", isSelected: true, isActive: true, habitDescription: "")))
}
