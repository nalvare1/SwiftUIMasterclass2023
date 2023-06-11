//
//  Constant.swift
//  Devote
//
//  Created by Natalie Alvarez on 6/2/23.
//

import SwiftUI

// Formatter:
let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

// UI:
var backgroundGradient: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

var backgroundGradientCapsule: LinearGradient {
    return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing)
}

// UX:
let haptics = UINotificationFeedbackGenerator()
