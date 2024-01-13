//
//  HabitRowView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/5/24.
//

import SwiftUI

struct HabitRowView: View {
    @Binding var habit: Habit
    let onDeleteHabit: (Habit) -> Void
    
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
                    .contentShape(Rectangle())
                
                Spacer()
                
                Image(systemName: "trash")
                    .foregroundColor(.red)
                .padding(8)
                .onTapGesture {
                    onDeleteHabit(habit)
                }
                .contentShape(Rectangle())
            }
            
        }
    }
}

#Preview {
    HabitRowView(habit: .constant(Habit(id: UUID(), imageName: "moon.fill", title: "Sleep", isSelected: true) ), onDeleteHabit: { _ in})
}
