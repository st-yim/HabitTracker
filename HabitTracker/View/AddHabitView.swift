//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import SwiftUI

struct AddHabitView: View {
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: HabitTrackerViewModel
    
    @State private var habits: [Habit] = [
        Habit(imageName: "sunrise.fill", title: "Start the Day Right", isSelected: false),
        Habit(imageName: "figure.walk.circle", title: "Move Your Body", isSelected: false),
        Habit(imageName: "leaf", title: "Eat Well", isSelected: false),
        Habit(imageName: "book.fill", title: "Learn Something", isSelected: false),
        Habit(imageName: "hand.thumbsup.fill", title: "Say Thanks", isSelected: false),
        Habit(imageName: "list.bullet", title: "Get Organized", isSelected: false),
        Habit(imageName: "wind", title: "Relax Your Mind", isSelected: false),
        Habit(imageName: "moon.stars.fill", title: "Sleep Enough", isSelected: false),
        Habit(imageName: "person.2.fill", title: "Spend Time with People", isSelected: false),
        Habit(imageName: "clock.fill", title: "Think About Your Day", isSelected: false)
    ]
    
    @State private var isCreatingCustomHabit = false
    @State private var newHabitTitle = ""
    @State private var selectedImageName: String? // Store the selected image name
    @State private var showCreateHabitView = false
    @State private var customHabitName = ""
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(habits.indices, id: \.self) { index in
                        let habit = habits[index]
                        HStack {
                            Image(systemName: habit.isSelected ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(habit.isSelected ? .blue : .gray)
                            
                            Text(habit.title)
                                .opacity(showCreateHabitView ? 0 : 1) // Hide the title when CreateHabitView is active
                            Spacer()
                            Image(systemName: habit.imageName) // Assuming imageName represents the symbol name
                        }
                        .onTapGesture {
                            habits[index].isSelected.toggle()
                        }
                    }
                }
                .opacity(showCreateHabitView ? 0 : 1) // Blur the background when CreateHabitView is active
                .cornerRadius(10)
                .padding()
                
                Button("Create Your Own Habit") {
                    withAnimation {
                        showCreateHabitView.toggle()
                    }
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 35)
                .background(Color.blue)
                .cornerRadius(8.0)
                .padding(.horizontal, 16)
                .opacity(showCreateHabitView ? 0 : 1) // Hide the button when CreateHabitView is active
                .disabled(showCreateHabitView) // Disable the button when CreateHabitView is active
                
                if showCreateHabitView {
                    ZStack {
                        Color.white
                            .opacity(0.6) // Semi-transparent background behind the CreateHabitView
                        
                        VStack {
                            Text("Create Your Own Habit")
                                .padding()
                                .onTapGesture {
                                    withAnimation {
                                        showCreateHabitView.toggle()
                                    }
                                }
                            
                            // Other custom habit creation interface
                            TextField("Enter Habit Name", text: $customHabitName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            Spacer()
                            
                            Button("Add") {
                                // Logic to add custom habit
                                viewModel.addHabit(title: customHabitName, imageName: "info.circle")
                                isPresented = false
//                                withAnimation {
//                                    showCreateHabitView.toggle()
//                                }
                            }
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .background(Color.blue)
                            .cornerRadius(8.0)
                            .opacity(customHabitName.isEmpty ? 0.5 : 1)
                            .disabled(customHabitName.isEmpty)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding()
                    }
                }
                
                Button(action: {
                    let selectedHabits = habits.filter { $0.isSelected }
                    for habit in selectedHabits {
                        viewModel.addHabit(title: habit.title, imageName: habit.imageName)
                    }
                    isPresented = false
                }) {
                    Text("Add Selected")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                        .background(Color.blue)
                        .cornerRadius(8.0)
                        .disabled(habits.filter({ $0.isSelected }).isEmpty)
                        .opacity(habits.filter({ $0.isSelected }).isEmpty ? 0.5 : 1)
                }
                .opacity(showCreateHabitView ? 0 : 1) // Hide the button when CreateHabitView is active
                .disabled(showCreateHabitView) // Disable the button when CreateHabitView is active
                .padding(.horizontal)
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding()
            .navigationBarTitle("Add Habits", displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                isPresented = false
            }) {
                Image(systemName: "chevron.left")
                Text("Back")
            }
                .opacity(showCreateHabitView ? 0 : 1) // Hide the button when CreateHabitView is active
                .disabled(showCreateHabitView) // Disable the button when CreateHabitView is active
            )
        }
        .navigationBarHidden(showCreateHabitView)
    }
}
