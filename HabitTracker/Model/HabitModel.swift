//
//  HabitModel.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import Foundation
import SwiftUI

struct Habit: Identifiable {
    let id: UUID
    let imageName: String
    var title: String
    var isSelected: Bool
    var isActive = true
    var description: String = ""
}

struct CreatedHabit: Identifiable {
    let id = UUID()
    let imageName: String
    var title: String
    var isSelected: Bool
    var isActive = true
    var description: String?
}


