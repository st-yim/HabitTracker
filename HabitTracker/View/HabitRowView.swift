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
        HStack {
            Image(systemName: habit.imageName)
                .foregroundColor(.blue)
                .font(.title)
            
            Text(habit.title)
                .font(.title3)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(habit.isActive ? .green : .gray) // Set the background based on isActive state
                )
                .cornerRadius(8)
                .shadow(radius: 4)
            
            NavigationLink(destination:
                HabitDetailView(habit: habit)) {
            }

            Spacer()

            Button(action: {
                viewModel.deleteHabit(habit)
            }) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .padding(.trailing, 8)
        }
    }
}

#Preview {
    HabitRowView(habit: Habit(imageName: "moon.fill", title: "Sleep", isSelected: true))
}
