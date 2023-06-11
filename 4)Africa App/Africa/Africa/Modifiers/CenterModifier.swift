//
//  CenterModifier.swift
//  Africa
//
//  Created by Natalie Alvarez on 5/25/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
