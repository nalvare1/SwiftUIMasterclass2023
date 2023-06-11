//
//  NewTaskButton.swift
//  Devote
//
//  Created by Natalie Alvarez on 6/7/23.
//

import SwiftUI

struct NewTaskButton: View {
    @Binding var showNewTaskItem: Bool

    var body: some View {
        Button(action: {
            showNewTaskItem = true
            playSound(sound: "sound-ding", type: "mp3")
            haptics.notificationOccurred(.success)
        }, label: {
            Image(systemName: "plus.circle")
                .font(.system(size: 30, weight: .semibold, design: .rounded))
            Text("New Task")
                .font(.system(size: 24, weight: .bold, design: .rounded))
        })
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 15)
        .background(
            backgroundGradientCapsule.clipShape(Capsule())
        )
    }
}

#Preview {
    NewTaskButton(showNewTaskItem: .constant(false))
        .previewLayout(.sizeThatFits)
}
