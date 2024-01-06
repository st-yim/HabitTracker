//
//  SectionView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/5/24.
//

import SwiftUI

struct SectionView: View {
    let title: String
    let habits: [Habit]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .foregroundColor(.blue) // Apple font color
                .padding(.leading, 16)
                .padding(.top, 8)
                .padding(.bottom, 4)
                .frame(maxWidth: .infinity, alignment: .leading)

            ForEach(habits.indices, id: \.self) { index in
                let habit = habits[index]
                HabitRowView(habit: habit)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .padding(.horizontal, 8)
                    .padding(.bottom, 4)
            }
        }
    }
}


#Preview {
    SectionView(title: "Active Habits", habits: [Habit(imageName: "moon.fill", title: "Sleep", isSelected: true)])
}
