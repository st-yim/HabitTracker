//
//  HabitRowView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/5/24.
//

import SwiftUI

struct HabitRowView: View {
    let habit: Habit
    @ObservedObject var viewModel = HabitTrackerViewModel()
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: habit.imageName)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
                    .font(.title)
                
                Text(habit.title)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 40)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(habit.isActive ? .green : .gray) // Set the background based on isActive state
                    )
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                
                Spacer()
                
                Button(action: {
                    viewModel.deleteHabit(habit)
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
                .padding(8)
            }
            
        }
    }
}

#Preview {
    HabitRowView(habit: Habit(imageName: "moon.fill", title: "Sleep", isSelected: true))
}
