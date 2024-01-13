//
//  HabitRowView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/5/24.
//

import SwiftUI

struct HabitRowView: View {
    var habit: Habit
    let onDeleteHabit: (Habit) -> Void
    let onActiveInactiveHabit: (Habit) -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 8) {
                HStack(alignment: .top) {
                    Image(systemName: habit.imageName)
                        .frame(width: 30, height: 30)
                        .foregroundColor(habit.isActive ? .blue : .gray) // Set the background based on isActive state
                        .font(.title)
                    
                    Text(habit.title)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(habit.isActive ? .blue.opacity(0.7) : .gray) // Set the background based on isActive state
                        )
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                        .padding(.trailing, 8)
                    
                    Spacer()
                    
                }
                
                HStack {
                    Image(systemName: habit.isActive ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.green)
                        .onTapGesture {
                            onActiveInactiveHabit(habit)
                        }
                    
                    
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.red)
                        .padding(8)
                        .onTapGesture {
                            onDeleteHabit(habit)
                        }
                }
            }
            // Arrow icon on the right side
            Image(systemName: "chevron.right")
                .foregroundColor(habit.isActive ? .blue : .gray) // Set the background based on isActive state
                .padding(.trailing, 8)
        }
    }
}

#Preview {
    HabitRowView(habit: Habit(id: UUID(), imageName: "moon.fill", title: "Sleep", isSelected: true), onDeleteHabit: { _ in}, onActiveInactiveHabit: {_ in})
}
