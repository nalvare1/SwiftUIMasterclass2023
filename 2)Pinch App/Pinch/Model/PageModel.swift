//
//  PageModel.swift
//  Pinch
//
//  Created by Natalie Alvarez on 5/17/23.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return "thumb-" + imageName
    }
}
