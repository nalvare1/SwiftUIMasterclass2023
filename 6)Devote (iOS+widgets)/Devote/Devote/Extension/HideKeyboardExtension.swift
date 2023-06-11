//
//  HideKeyboardExtension.swift
//  Devote
//
//  Created by Natalie Alvarez on 6/2/23.
//

import SwiftUI

#if canImport(UIKit)
// This code will only run when we can import the UIKit framework:

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#endif

