//
//  HabitModel.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import Foundation
import SwiftUI

struct Habit: Identifiable {
<<<<<<< HEAD
    let id = UUID()
=======
    let id: UUID
>>>>>>> develop
    let imageName: String
    var title: String
    var isSelected: Bool
    var isActive = true
<<<<<<< HEAD
    var description: String?
=======
    var habitDescription: String = ""
>>>>>>> develop
}

struct CreatedHabit: Identifiable {
    let id = UUID()
    let imageName: String
    var title: String
    var isSelected: Bool
    var isActive = true
<<<<<<< HEAD
    var description: String?
=======
    var habitDescription: String?
>>>>>>> develop
}


